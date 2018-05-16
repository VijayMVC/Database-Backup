/****** Object:  StoredProcedure [dbo].[proc_SecListSiteGroups]    Script Date: 5/15/2018 12:12:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecListSiteGroups(
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        V.*
    FROM
        Sec_SiteGroupsView V
    WHERE
        V.SiteID = @SiteId

GO
