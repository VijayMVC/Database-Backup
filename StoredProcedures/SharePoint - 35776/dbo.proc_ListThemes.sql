/****** Object:  StoredProcedure [dbo].[proc_ListThemes]    Script Date: 5/15/2018 12:12:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListThemes(
    @SiteId uniqueidentifier,
    @WebUrl nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @ThemesDir nvarchar(256)
    SELECT @ThemesDir = @WebUrl + CASE WHEN (DATALENGTH(@WebUrl) = 0) THEN
        N'_themes' ELSE N'/_themes' END
    SELECT
        Docs.LeafName, 
        Docs2.SetupPathVersion, 
        Docs2.SetupPath, 
        Docs2.SetupPathUser, 
        DocStreams.Content
    FROM
        Docs 
    INNER JOIN 
        Docs Docs2 
    ON
        Docs2.SiteId = Docs.SiteId AND
        Docs2.DirName = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
    LEFT OUTER JOIN DocStreams ON
        Docs2.SiteId = DocStreams.SiteId AND
        Docs2.ParentId = DocStreams.ParentId AND
        Docs2.Id = DocStreams.Id AND
        Docs2.Level = DocStreams.Level
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @ThemesDir AND
        Docs2.LeafName = (Docs.LeafName + N'.inf') AND
        Docs2.Level = 1
    RETURN 0

GO
