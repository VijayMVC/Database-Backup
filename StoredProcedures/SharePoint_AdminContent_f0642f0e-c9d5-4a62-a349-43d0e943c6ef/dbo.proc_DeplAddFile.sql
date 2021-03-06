/****** Object:  StoredProcedure [dbo].[proc_DeplAddFile]    Script Date: 5/15/2018 12:12:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddFile(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @IncludeDescendants tinyint,
    @IsMajorFileOnly int,
    @IsLink tinyint,
    @IsSelected tinyint)
AS
    SET NOCOUNT ON
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    IF @Id IS NULL OR @Id = '00000000-0000-0000-0000-000000000000'
    BEGIN
        EXEC proc_SplitUrl @Url,
                           @DirName OUTPUT,
                           @LeafName OUTPUT
        SELECT
            @Id = Docs.Id
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            DirName = @DirName AND
            LeafName = @LeafName AND
            Type = 0
    END
    IF EXISTS (
            SELECT 1 FROM #ExportObjects
            WHERE Id = @Id)
        RETURN 0
    INSERT INTO #ExportObjects(
        Id,
        Type,
        Level,
        DirName,
        LeafName,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        IsLink,
        FullUrl,
        IsSelected)
    SELECT
        Docs.Id,
        CASE
            WHEN Docs.DocLibRowId IS NOT NULL THEN 7
            ELSE 5
        END,
        0,
        Docs.DirName,
        Docs.LeafName,
        Docs.ParentId,
        Docs.WebId,
        0,
        @IsLink,
        CASE
            WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
            WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
            ELSE Docs.DirName + N'/' + Docs.LeafName
        END,
        @IsSelected
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.Id = @Id AND
        ((@IsMajorFileOnly = 1 AND Docs.Level=1) OR
         (@IsMajorFileOnly = 0 AND Docs.Level IN
            (SELECT TOP 1 d2.Level FROM Docs d2
             WHERE d2.Id=Docs.Id AND d2.Level <> 255)))
    IF @@ROWCOUNT = 0
        RETURN 2
    ELSE
        RETURN 0

GO
