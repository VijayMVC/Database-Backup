/****** Object:  StoredProcedure [dbo].[proc_DeplAddFolder]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddFolder(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @IncludeDescendants tinyint,
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
            Type = 1
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
            WHEN Docs.DocLibRowId IS NOT NULL THEN 6
            ELSE 2
        END,
        0,
        Docs.DirName,
        Docs.LeafName,
        Docs.ParentId,
        Docs.WebId,
        @IncludeDescendants,
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
        Docs.Id = @Id
    IF @@ROWCOUNT = 0
        RETURN 2
    ELSE
        RETURN 0

GO
