/****** Object:  StoredProcedure [dbo].[proc_ListThemeFiles]    Script Date: 5/15/2018 12:12:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListThemeFiles(
    @SiteId uniqueidentifier,
    @WebUrl nvarchar(260),
    @ThemeName nvarchar(128))
AS
    SET NOCOUNT ON
    DECLARE @ThemeDir nvarchar(256)
    SELECT @ThemeDir = @WebUrl + CASE WHEN (DATALENGTH(@WebUrl) = 0) THEN
        N'_themes' ELSE N'/_themes' END
    SELECT @ThemeDir = @ThemeDir + N'/' + @ThemeName
    SELECT
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
        DocStreams.Content,
        Docs.HasStream,
        Docs.SetupPathVersion,
        Docs.SetupPath
    FROM
        Docs 
    LEFT OUTER JOIN 
        DocStreams
    ON
        Docs.SiteId = DocStreams.SiteId AND
        Docs.ParentId = DocStreams.ParentId AND
        Docs.Id = DocStreams.Id AND
        Docs.Level = DocStreams.Level
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @ThemeDir AND
        Docs.Level = 1
    RETURN 0

GO
