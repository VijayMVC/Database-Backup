/****** Object:  StoredProcedure [dbo].[proc_GetTpWebMetaData]    Script Date: 5/15/2018 12:12:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetTpWebMetaData(
    @WebSiteId     uniqueidentifier,
    @WebDirName nvarchar(256),
    @WebLeafName nvarchar(128),
    @DGCacheVersion bigint,
    @SystemId tSystemId = NULL)
AS
    DECLARE @WebId         uniqueidentifier
    DECLARE @UserId        int
    DECLARE @SiteFlags int
    DECLARE @SitePortalURL nvarchar(260)
    DECLARE @SitePortalName nvarchar(255)
    DECLARE @SiteSecurityVersion bigint
    DECLARE @SiteHashKey binary(16)
    DECLARE @UserInfoListId uniqueidentifier  
    DECLARE @RootWebId uniqueidentifier
    DECLARE @SiteLastContentChange datetime
    DECLARE @SiteLastSecurityChange datetime
    DECLARE @SiteNextUserOrGroupId int
    SET NOCOUNT ON
    SELECT
        @WebId = WebId,
        @SiteFlags = Sites.BitFlags,
        @SitePortalURL = Sites.PortalURL,
        @SitePortalName = Sites.PortalName,
        @SiteSecurityVersion = Sites.SecurityVersion,
        @SiteHashKey = Sites.HashKey,
        @UserInfoListId = Sites.UserInfoListId,
        @RootWebId = Sites.RootWebId,
        @SiteLastContentChange = Sites.LastContentChange,
        @SiteLastSecurityChange = Sites.LastSecurityChange,
        @SiteNextUserOrGroupId = Sites.NextUserOrGroupId
    FROM
        Docs INNER JOIN Sites (NOLOCK) ON
        Docs.SiteId = Sites.Id
    WHERE
        Docs.SiteId = @WebSiteId AND
        Docs.DirName = @WebDirName AND
        Docs.LeafName = @WebLeafName AND
        Docs.Type = 2
    IF @WebId IS NULL
    BEGIN
        RETURN 3
    END
    IF (@SiteNextUserOrGroupId IS NOT NULL AND
        @SiteNextUserOrGroupId > 1000)
    BEGIN
       SET @SiteFlags = @SiteFlags | 4096
    END
    DECLARE @ret int
    EXEC @ret = proc_ReturnTpWebMetaData @WebSiteId, @WebId, 
        @SiteFlags, @SitePortalURL, @SitePortalName,
        @SiteSecurityVersion, @SystemId, @SiteHashKey,
        @UserInfoListId, @RootWebId, @DGCacheVersion,
        @SiteLastContentChange, @SiteLastSecurityChange
    EXEC proc_GetEventReceivers @WebSiteId, @WebId, @WebId, 1
    RETURN @ret

GO
