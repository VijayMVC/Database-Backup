/****** Object:  StoredProcedure [dbo].[proc_SecGetSiteGroupById]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetSiteGroupById(
    @SiteId         uniqueidentifier,
    @GroupId        int)
AS
    SET NOCOUNT ON
    SELECT
        V.*
    FROM
        Sec_SiteGroupsView AS V
    WHERE
        SiteID = @SiteId AND
        ID = @GroupID

GO
