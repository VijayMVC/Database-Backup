/****** Object:  StoredProcedure [dbo].[proc_DeplAddList]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddList(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @IncludeDescendants tinyint,
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
            @Id = Docs.ListId
        FROM
            Docs
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DirName AND
            Docs.LeafName = @LeafName
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
        FullUrl,
        IsSelected)
    SELECT
        Lists.tp_ID,
        3,
        0,
        Docs.DirName,
        Docs.LeafName,
        Lists.tp_WebId,
        Lists.tp_WebId,
        CASE
            WHEN @IncludeDescendants = 1
            THEN 2
            ELSE @IncludeDescendants
        END,
        CASE
            WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
            WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
            ELSE Docs.DirName + N'/' + Docs.LeafName
        END,
        @IsSelected
    FROM
        Lists
    INNER JOIN
        Docs
    ON
        Lists.tp_RootFolder = Docs.Id AND
        Docs.SiteId = @SiteId
    WHERE
        Lists.tp_ID = @Id
    IF @@ROWCOUNT = 0
        RETURN 2
    ELSE
        RETURN 0

GO
