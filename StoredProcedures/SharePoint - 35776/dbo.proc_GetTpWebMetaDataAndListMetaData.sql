/****** Object:  StoredProcedure [dbo].[proc_GetTpWebMetaDataAndListMetaData]    Script Date: 5/15/2018 12:12:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetTpWebMetaDataAndListMetaData(
    @WebSiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @Url nvarchar(260),
    @ListId uniqueidentifier,
    @RunUrlToWebUrl bit,
    @DGCacheVersion bigint,
    @SystemId tSystemId = NULL,
    @MetadataFlags int = 0)
AS
    SET NOCOUNT ON
    DECLARE @ret int
    DECLARE @WebUrl nvarchar(256)
    DECLARE @WebDirName nvarchar(256)
    DECLARE @WebLeafName nvarchar(128)
    DECLARE @UserId int
    DECLARE @UrlDirName nvarchar(256)
    DECLARE @UrlLeafName nvarchar(128)
    DECLARE @WebIdSelected uniqueidentifier
    DECLARE @ListIdSelected uniqueidentifier
    DECLARE @ItemLevelSelected tinyint
    DECLARE @UrlIsListItem bit
    DECLARE @RootWebId uniqueidentifier
    DECLARE @UserInfoListId uniqueidentifier
    SET @UserId = 0
    SET @UrlIsListItem = 0
    SET @RootWebId = NULL
    IF (@MetadataFlags & 0x00000010) <> 0
    BEGIN
        IF (@RunUrlToWebUrl = 1)
        BEGIN
            EXEC @ret = proc_UrlToWebUrlOutput @WebSiteId, @Url, 
                @WebDirName OUTPUT, @WebLeafName OUTPUT
            IF (@ret <> 0)
            BEGIN
                RETURN @ret
            END
            SET @WebUrl = CASE WHEN (DATALENGTH(@WebDirName) = 0) THEN @WebLeafName WHEN (DATALENGTH(@WebLeafName) = 0) THEN @WebDirName ELSE @WebDirName + N'/' + @WebLeafName END
            SELECT @WebUrl
        END
        ELSE
        BEGIN
            SET @WebUrl = @Url
            EXEC proc_SplitUrl @WebUrl, @WebDirName OUTPUT, @WebLeafName OUTPUT
        END
        DECLARE @SiteFlags int
        DECLARE @SitePortalURL nvarchar(260)
        DECLARE @SitePortalName nvarchar(255)
        DECLARE @SiteSecurityVersion bigint
        DECLARE @SiteHashKey binary(16)
        DECLARE @SiteLastContentChange datetime
        DECLARE @SiteLastSecurityChange datetime
        DECLARE @SiteNextUserOrGroupId int
        SELECT
            @WebId = Docs.WebId,
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
        DECLARE @retWebMetaData int
        EXEC @retWebMetaData = proc_ReturnTpWebMetaData @WebSiteId, @WebId,
            @SiteFlags, @SitePortalURL, @SitePortalName,
            @SiteSecurityVersion, @SystemId, @SiteHashKey,
            @UserInfoListId, @RootWebId, @DGCacheVersion,
            @SiteLastContentChange, @SiteLastSecurityChange
        EXEC proc_GetEventReceivers @WebSiteId, @WebId, @WebId, 1
        IF (@retWebMetaData <> 0)
        BEGIN
            RETURN @retWebMetaData
        END
        IF (@MetadataFlags & 0x00000100) <> 0
        BEGIN
            EXEC @retWebMetaData = proc_ReturnWebMetainfo @WebId
            IF (@retWebMetaData <> 0)
            BEGIN
                RETURN @retWebMetaData
            END            
        END
        IF (@MetadataFlags & 0x00000200) <> 0
        BEGIN
            EXEC @retWebMetaData = proc_ReturnWebFeatures @WebSiteId, @WebId
            IF (@retWebMetaData <> 0)
            BEGIN
                RETURN @retWebMetaData
            END            
        END
        IF (@MetadataFlags & 0x00000400) <> 0
        BEGIN
            DECLARE @Webs_NavParentWebId uniqueidentifier
            SELECT 
                @Webs_NavParentWebId = Webs.NavParentWebId
            FROM
                Webs WITH(NOLOCK)
            WHERE
                Webs.Id = @WebId
            EXEC @retWebMetaData = proc_ReturnCachedNavAcls @WebSiteId, @WebId,
                @Webs_NavParentWebId
            IF (@retWebMetaData <> 0)
            BEGIN
                RETURN @retWebMetaData
            END
        END
        IF (@MetadataFlags & 0x00004000) <> 0
        BEGIN
            DECLARE @RedirectRetval int
            DECLARE @RedirectUrl nvarchar(260)
            DECLARE @RedirectType tinyint
            DECLARE @ContentTypeId tContentTypeId
            EXEC @RedirectRetval = proc_GetFolderRedirectUrl
                @WebSiteId,
                @WebDirName,
                @WebLeafName,
                1,
                @RedirectUrl OUTPUT,
                @RedirectType OUTPUT,
                @ContentTypeId OUTPUT
            IF (@RedirectType = 255)
                RETURN @RedirectRetval
            IF @RedirectType = 0
            BEGIN
                SELECT TOP 1
                    @RedirectType,
                    @RedirectUrl,
                    WelcomePageParameters
                FROM
                    Docs
                WHERE
                    Docs.SiteId = @WebSiteId AND
                    Docs.DirName = @WebDirName AND
                    Docs.LeafName = @WebLeafName
            END
            ELSE
            BEGIN
                SELECT
                    @RedirectType,
                    @RedirectUrl,
                    NULL
            END
        END
    END
    IF @ListId IS NULL AND (@MetadataFlags & 0x00000008) <> 0
    BEGIN
        DECLARE @TypeSelected int
        DECLARE @ItemIdSelected int
        EXEC proc_SplitUrl @Url, @UrlDirName OUTPUT, @UrlLeafName OUTPUT
        IF @UserId = 0
        BEGIN
            SELECT
                @UserId = UserInfo.tp_Id
            FROM
                UserInfo WITH(NOLOCK)
            WHERE
                UserInfo.tp_SiteId = @WebSiteId AND
                UserInfo.tp_SystemId = @SystemId
        END
        SELECT TOP 1
            @ListIdSelected = ListId,
            @TypeSelected = Type,
            @WebIdSelected = WebId,
            @ItemIdSelected = DocLibRowId,
            @ItemLevelSelected = Level
        FROM
            Docs WITH(NOLOCK)
        WHERE
            SiteId = @WebSiteId AND
            DirName = @UrlDirName AND
            LeafName = @UrlLeafName AND
            (Level = 255 AND LTCheckoutUserId = @UserId OR
             Level <> 255 AND (LTCheckoutUserId IS NULL OR LTCheckoutUserId <> @UserId))
        ORDER BY
            Level DESC
        IF @WebIdSelected <> @WebId
        BEGIN
            SET @ret = 1
            RETURN @ret
        END
        SELECT @ListIdSelected, @TypeSelected, @ItemIdSelected
        IF (@ListIdSelected IS NOT NULL AND @ItemIdSelected IS NOT NULL)
            SET @UrlIsListItem = 1
    END
    IF (@MetadataFlags & 0x00000020) <> 0
    BEGIN
        SET @ListId = @ListIdSelected
    END
    IF @ListId IS NOT NULL
        SET @MetadataFlags = @MetadataFlags | 0x00000040    
    IF @ListId IS NOT NULL AND 
        ((@MetadataFlags & 0x00000800) = 0)
    BEGIN
        DECLARE @retListMetaData int
        DECLARE @PrefetchListScope bit
        IF (@MetadataFlags & 0x00000002) <> 0
            SET @PrefetchListScope = 1
        EXEC @retListMetaData = proc_GetListMetaData @WebId, @ListId, @PrefetchListScope
        IF (@retListMetaData <> 0)
        BEGIN
            RETURN @retListMetaData
        END
        EXEC proc_GetEventReceivers @WebSiteId, @WebId, @ListId, 2
        IF (@MetadataFlags & 0x00000001) <> 0
        BEGIN
            IF @UserId = 0
            BEGIN
                SELECT
                    @UserId = UserInfo.tp_Id
                FROM
                    UserInfo WITH(NOLOCK)
                WHERE
                    UserInfo.tp_SiteId = @WebSiteId AND
                    UserInfo.tp_SystemId = @SystemId
            END
            EXEC @ret = proc_GetListWebParts @ListId, @UserId, 0, 0, 0, @WebSiteId
            IF (@ret <> 0)
            BEGIN
                RETURN @ret
            END
        END        
    END
    IF (@MetadataFlags & 0x00000040) <> 0 AND
       (@MetadataFlags & 0x00001000) = 0
    BEGIN
        IF @RootWebId IS NULL
        BEGIN
            SELECT
                @RootWebId = RootWebId,
                @UserInfoListId = UserInfoListId
            FROM
                Sites WITH(NOLOCK)
            WHERE
                Id = @WebSiteId
        END
        IF @UserInfoListId IS NOT NULL AND 
            (@ListId IS NULL OR @ListId <> @UserInfoListId)
        BEGIN
            DECLARE @PrefetchUserInfoListScope bit
            IF (@MetadataFlags & 0x00000002) <> 0
                SET @PrefetchUserInfoListScope = 1
            EXEC @ret = proc_GetListMetaData @RootWebId, @UserInfoListId, @PrefetchUserInfoListScope
            IF (@ret <> 0)
            BEGIN
                RETURN @ret
            END
            IF (@MetadataFlags & 0x00000080) <> 0
            BEGIN
                EXEC proc_GetEventReceivers @WebSiteId, @RootWebId, @UserInfoListId, 2
                IF @UserId = 0
                BEGIN
                    SELECT
                        @UserId = UserInfo.tp_Id
                    FROM
                        UserInfo WITH(NOLOCK)
                    WHERE
                        UserInfo.tp_SiteId = @WebSiteId AND
                        UserInfo.tp_SystemId = @SystemId
                END
                EXEC @ret = proc_GetListWebParts @UserInfoListId, @UserId, 0, 0, 0, @WebSiteId
                IF (@ret <> 0)
                BEGIN
                    RETURN @ret
                END
            END                
        END
    END
    IF (@UrlIsListItem = 0 AND (@MetadataFlags & 0x00000020) <> 0) OR
       ((@MetadataFlags & 0x00002000) <> 0)
    BEGIN
        DECLARE @WebFullUrl nvarchar(260)
        EXEC @ret = proc_GetMetaInfoForSingleDoc @WebSiteId, @UrlDirName,
                            @UrlLeafName, @UserId, @ItemLevelSelected, 0
        IF (@ret <> 0)
        BEGIN
            RETURN @ret
        END
    END
    RETURN @ret

GO
