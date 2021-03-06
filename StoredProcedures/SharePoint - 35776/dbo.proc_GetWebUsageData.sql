/****** Object:  StoredProcedure [dbo].[proc_GetWebUsageData]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebUsageData(
    @WebSiteId uniqueidentifier,
    @WebDirName nvarchar(256),
    @WebLeafName nvarchar(128),
    @BlobType tinyint)
AS
    SET NOCOUNT ON
    SELECT
        CASE WHEN @BlobType = 1 THEN Webs.MonthlyUsageData
            ELSE Webs.DailyUsageData END,
        CASE WHEN @BlobType = 1 THEN Webs.MonthlyUsageDataVersion
            ELSE Webs.DailyUsageDataVersion END
    FROM
        Webs INNER JOIN Docs
    ON
        Webs.Id = Docs.WebId
    WHERE
        Docs.SiteId = @WebSiteId AND
        Docs.DirName = @WebDirName AND
        Docs.LeafName = @WebLeafName AND
        Docs.Type = 2 
    IF @@ROWCOUNT = 1 
    BEGIN
        RETURN 0
    END
    ELSE
    BEGIN
        RETURN 3
    END

GO
