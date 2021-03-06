/****** Object:  StoredProcedure [dbo].[proc_GetFolderRedirectUrl]    Script Date: 5/15/2018 12:12:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetFolderRedirectUrl(
    @DocSiteId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @Level tinyint,
    @RedirectUrl nvarchar(260) OUTPUT,
    @RedirectType tinyint OUTPUT,
    @ContentTypeId tContentTypeId OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @DocFullUrl nvarchar(260)
    SET @DocFullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
    SET @ContentTypeId = NULL
    EXEC proc_GetWelcomeNameForPath
        @DocSiteId,
        @DocDirName,
        @DocLeafName,
        @DocFullUrl,
        @RedirectUrl OUTPUT
    IF @RedirectUrl IS NOT NULL
    BEGIN
        SET @RedirectType = 0
        RETURN 146
    END
    SELECT TOP 1
        @RedirectUrl = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
    FROM
        WelcomeNames INNER JOIN Docs
    ON
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocFullUrl AND
        Docs.LeafName = WelcomeNames.LeafName
    WHERE
        Docs.Type = 0
    ORDER BY
        WelcomeNames.Rank ASC
    OPTION (FORCE ORDER)
    IF @RedirectUrl IS NOT NULL
    BEGIN
        SET @RedirectType = 1
        RETURN 146
    END
    SELECT TOP 1
        @ContentTypeId = ISNULL(UserData.tp_ContentTypeId, 0x012001)
    FROM
        Docs LEFT OUTER JOIN UserData
    ON
        Docs.SiteId = UserData.tp_SiteId AND
        Docs.DirName = UserData.tp_DirName AND
        Docs.LeafName = UserData.tp_LeafName AND
        Docs.Level = UserData.tp_Level
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.Level = @Level AND
        Docs.Type = 1
    DECLARE @InDocLibButNotRoot bit
    SELECT TOP 1
        @RedirectUrl = CASE WHEN (DATALENGTH(Docs2.DirName) = 0) THEN Docs2.LeafName WHEN (DATALENGTH(Docs2.LeafName) = 0) THEN Docs2.DirName ELSE Docs2.DirName + N'/' + Docs2.LeafName END,
        @InDocLibButNotRoot = CASE WHEN Lists.tp_ID IS NULL THEN
            0 ELSE 1 END
    FROM
        Docs INNER JOIN WebParts
    ON
        WebParts.tp_ListId = Docs.ListId
    INNER JOIN
        Docs Docs2
    ON
        Docs2.SiteId = @DocSiteId AND
        Docs2.SiteId = WebParts.tp_SiteID AND
        Docs2.Id = WebParts.tp_PageUrlID AND
        Docs2.Level = WebParts.tp_Level
    LEFT OUTER JOIN
        Lists WITH (NOLOCK)
    ON
        Lists.tp_WebID = Docs.WebId AND
        Lists.tp_ID = Docs.ListId AND
        Lists.tp_RootFolder <> Docs.Id
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.Level = @Level AND
        Docs.Type = 1 AND
        WebParts.tp_UserID IS NULL AND
        (WebParts.tp_Type = 0 OR 
            (WebParts.tp_Type = 1 AND
             WebParts.tp_ContentTypeId IN (0x, @ContentTypeId))
        ) AND
        (WebParts.tp_Flags & 8) = 0 AND
        (WebParts.tp_Flags & 262144) = 0
    ORDER BY
        CASE 
            WHEN WebParts.tp_ContentTypeId = @ContentTypeId AND
                 (WebParts.tp_Flags & 268435456) <> 0
            THEN 0
            ELSE 1
        END,
        WebParts.tp_Type,  
        WebParts.tp_CreationTime
    IF @RedirectUrl IS NOT NULL
    BEGIN
        SET @RedirectType = 2
        IF @InDocLibButNotRoot = 1
            RETURN 144
        ELSE
            RETURN 146
    END
    DECLARE @Webs_Id uniqueidentifier
    DECLARE @Webs_WebTemplate int
    DECLARE @Webs_ProvisionConfig smallint
    SELECT TOP 1
        @Webs_WebTemplate = Webs.WebTemplate,
        @Webs_ProvisionConfig = Webs.ProvisionConfig,
        @Webs_Id = Webs.Id
    FROM
        Docs INNER JOIN Webs
    ON
        Webs.Id = Docs.WebId
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.Level = @Level AND
        Docs.Type = 2
    IF (@Webs_WebTemplate = 0x1 AND 
        @Webs_ProvisionConfig = -1)
    BEGIN
        IF NOT EXISTS (
            SELECT TOP 1 
                Lists.tp_ID 
            FROM
                Lists
            WHERE
                Lists.tp_WebId = @Webs_Id AND
                (Lists.tp_Flags & 16) = 0 )
        BEGIN
            SET @RedirectType = 3
            SET @RedirectUrl = N''
            RETURN 149 
        END
    END         
    SET @RedirectType = 255
    SET @RedirectUrl = NULL
    RETURN 2

GO
