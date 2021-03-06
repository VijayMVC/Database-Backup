/****** Object:  StoredProcedure [dbo].[proc_SecResolvePrincipal]    Script Date: 5/15/2018 12:12:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_SecResolvePrincipal(
    @SiteId uniqueidentifier,
    @Input nvarchar(255),
    @InputIsEmailOnly bit,
    @AccountName nvarchar(255),
    @DLAlias nvarchar(128),
    @DLAliasServerAddress nvarchar(255),
    @SearchScope int)
AS
    SET NOCOUNT ON
    DECLARE @OutMatchType int
    DECLARE @OutPrincipalType int
    DECLARE @OutUserId int
    DECLARE @OutLogin nvarchar(255)
    DECLARE @OutEmail nvarchar(255)
    DECLARE @OutDisplayName nvarchar(255)
    SET @OutMatchType = 0 
    IF @InputIsEmailOnly = 0
    BEGIN
        SELECT TOP 2
            @OutMatchType = 1,
            @OutPrincipalType = 8,
            @OutUserID = ID,
            @OutLogin = Title,
            @OutEmail = CASE WHEN DLAlias IS NULL OR @DLAliasServerAddress IS NULL THEN NULL ELSE DLAlias + N'@' + @DLAliasServerAddress END,
            @OutDisplayName = Title
        FROM
            Groups
        WHERE
            (@SearchScope & 8) <> 0 AND
            SiteId = @SiteId AND
            Title = @Input AND
            DATALENGTH(Title) = DATALENGTH(@Input)
        IF @@ROWCOUNT = 1
            GOTO cleanup
        IF @AccountName IS NULL
        BEGIN
            SET @AccountName = @Input
        END
        SELECT 
            @OutMatchType = 1,
            @OutPrincipalType = CASE WHEN tp_DomainGroup = 0 THEN 1 ELSE 4 END,
            @OutUserId = tp_ID,
            @OutLogin = tp_Login,
            @OutEmail = tp_Email,
            @OutDisplayName = tp_Title
        FROM
            UserInfo
        WHERE
            (((@SearchScope & 1) <> 0 AND tp_DomainGroup = 0) OR
             ((@SearchScope & 4) <> 0 AND tp_DomainGroup = 1)
            )AND
            tp_SiteId = @SiteId AND
            tp_Login = @AccountName AND
            DATALENGTH(tp_Login) = DATALENGTH(@AccountName) AND
            tp_Deleted = 0
        IF @@ROWCOUNT = 1
            GOTO cleanup
    END
    SELECT TOP 2
        @OutMatchType = MatchType,
        @OutPrincipalType = PrincipalType,
        @OutUserId = UserId,
        @OutLogin = Login,
        @OutEmail = Email,
        @OutDisplayName = Title
    FROM
        (
            SELECT TOP 2
                2 AS MatchType,
                CASE WHEN tp_DomainGroup = 0 THEN 1 ELSE 4 END AS PrincipalType,
                tp_ID AS UserId,
                tp_Login AS Login,
                tp_Email AS Email,
                tp_Title AS Title
            FROM
                UserInfo
            WHERE
                (((@SearchScope & 1) <> 0 AND tp_DomainGroup = 0) OR
                 ((@SearchScope & 4) <> 0 AND tp_DomainGroup = 1)
                )AND
                tp_SiteId = @SiteId AND
                tp_Email = @Input AND
                DATALENGTH(tp_Email) = DATALENGTH(@Input) AND
                tp_Deleted = 0
            UNION
            SELECT TOP 2
                2 AS MatchType,
                8 AS PrincipalType,
                ID AS UserId,
                Title AS Login,
                CASE WHEN DLAlias IS NULL OR @DLAliasServerAddress IS NULL THEN NULL ELSE DLAlias + '@' + @DLAliasServerAddress END AS Email,
                Title AS DisplayName
            FROM
                Groups
            WHERE
                (@SearchScope & 8) <> 0 AND
                SiteId = @SiteId AND
                DLAlias = @DLAlias AND
                @DLAlias IS NOT NULL AND
                DATALENGTH(DLAlias) = DATALENGTH(@DLAlias)
        ) AllUserWithEmailMatch    
    IF @@ROWCOUNT = 1
        GOTO cleanup
    SELECT TOP 2
        @OutMatchType = MatchType,
        @OutPrincipalType = PrincipalType,
        @OutUserId = UserId,
        @OutLogin = Login,
        @OutEmail = Email,
        @OutDisplayName = Title
    FROM
        (
            SELECT TOP 2
                4 AS MatchType,
                CASE WHEN tp_DomainGroup = 0 THEN 1 ELSE 4 END AS PrincipalType,
                tp_ID AS UserId,
                tp_Login AS Login,
                tp_Email AS Email,
                tp_Title AS Title
            FROM
                UserInfo
            WHERE
                (((@SearchScope & 1) <> 0 AND tp_DomainGroup = 0) OR
                 ((@SearchScope & 4) <>0 AND tp_DomainGroup = 1)
                )AND
                tp_SiteId = @SiteId AND
                tp_Title = @Input AND
                DATALENGTH(tp_Title) = DATALENGTH(@Input) AND
                tp_Deleted = 0
            UNION
            SELECT TOP 2
                4,
                8 AS PrincipalType,
                ID AS UserId,
                Title AS Login,
                CASE WHEN DLAlias IS NULL OR @DLAliasServerAddress IS NULL THEN NULL ELSE DLAlias + '@' + @DLAliasServerAddress END AS Email,
                Title AS DisplayName
            FROM
                Groups
            WHERE
                (@SearchScope & 8) <> 0 AND
                SiteId = @SiteId AND
                Title = @Input AND
                DATALENGTH(Title) = DATALENGTH(@Input)
        ) AllUserWithDisplayNameMatch 
    IF @@ROWCOUNT = 1
        GOTO cleanup
    SELECT
            @OutMatchType = 0,
            @OutPrincipalType = 0,
            @OutUserId = -1,
            @OutLogin = NULL,
            @OutEmail = NULL,
            @OutDisplayName = NULL
cleanup:
    IF @OutMatchType <> 0
    BEGIN
        SELECT
                @OutMatchType,
                @OutPrincipalType,
                @OutUserId,
                @OutLogin,
                @OutEmail,
                @OutDisplayName
    END   
    RETURN 0

GO
