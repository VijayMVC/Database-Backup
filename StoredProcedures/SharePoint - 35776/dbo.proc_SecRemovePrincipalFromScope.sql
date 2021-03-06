/****** Object:  StoredProcedure [dbo].[proc_SecRemovePrincipalFromScope]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemovePrincipalFromScope(
    @SiteId     uniqueidentifier,
    @WebId      uniqueidentifier,
    @WebScopeId uniqueidentifier,
    @ScopeId    uniqueidentifier,
    @PrincipalId    int,
    @RoleId         int = NULL)    
AS
    SET NOCOUNT ON
    DECLARE @IsDomainGroup bit
    DECLARE @IsRemoved bit
    DECLARE @AdminRoleId int
    DECLARE @GuestRoleId int
    SET @AdminRoleId = 1073741824 + 5
    SET @GuestRoleId = 1073741824 + 1
    EXEC @IsRemoved = proc_SecRemovePrincipalFromOneScope 
        @SiteId, @ScopeId, @PrincipalId, @RoleId
    IF (@IsRemoved = 1)    
        EXEC proc_SecLogChange 
                @SiteId, @WebId, @ScopeId, NULL, @RoleId, @PrincipalId, 33554432, NULL
    IF @IsDomainGroup = 0 AND @RoleId IS NULL AND @WebScopeId = @ScopeId
    BEGIN
        DELETE FROM
            EventSubsMatches 
        WHERE
            SubId 
        IN (
            SELECT ImmedSubscriptions.Id FROM
                Webs, ImmedSubscriptions
            WHERE
                ImmedSubscriptions.SiteId = Webs.SiteId AND
                ImmedSubscriptions.WebId = Webs.Id AND
                ImmedSubscriptions.UserId = @PrincipalId AND
                Webs.SiteId = @SiteId AND
                Webs.FirstUniqueAncestorWebId = @WebId
            UNION
            SELECT SchedSubscriptions.Id FROM 
                Webs, SchedSubscriptions
            WHERE
                SchedSubscriptions.SiteId = Webs.SiteId AND
                SchedSubscriptions.WebId = Webs.Id AND
                SchedSubscriptions.UserId = @PrincipalId AND
                Webs.SiteId = @SiteId AND
                Webs.FirstUniqueAncestorWebId = @WebId
        )
        DELETE
            ImmedSubscriptions
        FROM
            Webs, ImmedSubscriptions
        WHERE
            ImmedSubscriptions.SiteId = Webs.SiteId AND
            ImmedSubscriptions.WebId = Webs.Id AND
            ImmedSubscriptions.UserId = @PrincipalId AND
            Webs.SiteId = @SiteId AND
            Webs.FirstUniqueAncestorWebId = @WebId
        DELETE
            SchedSubscriptions
        FROM
            Webs, SchedSubscriptions
        WHERE
            SchedSubscriptions.SiteId = Webs.SiteId AND
            SchedSubscriptions.WebId = Webs.Id AND
            SchedSubscriptions.UserId = @PrincipalId AND
            Webs.SiteId = @SiteId AND
            Webs.FirstUniqueAncestorWebId = @WebId
        DELETE
            Personalization
        FROM
            Personalization
        INNER JOIN
            Docs
        ON
            Personalization.tp_PageUrlID = Docs.Id
        WHERE
            Personalization.tp_SiteId = @SiteId AND
            Personalization.tp_UserID = @PrincipalId AND
            Docs.SiteId = @SiteId AND
            Docs.WebId = @WebId
        DELETE
            WebParts
        FROM
            WebParts INNER JOIN Docs ON WebParts.tp_PageUrlID = Docs.Id
        WHERE
            WebParts.tp_SiteId = @SiteId AND
            WebParts.tp_UserID = @PrincipalId AND
            Docs.SiteId = @SiteId AND
            Docs.WebId = @WebId
        DELETE FROM
            WebMembers
        WHERE
            WebId = @WebId AND
            UserId = @PrincipalId
    END
    IF (@RoleId IS NULL) OR (@RoleId = @GuestRoleId AND @IsRemoved = 1)
    BEGIN
        DECLARE @Url nvarchar(260)
        DECLARE @UrlLike nvarchar(1024)
        DECLARE @SubScopeId uniqueidentifier
        SELECT 
            @Url = ScopeUrl
        FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            ScopeId = @ScopeId
        EXEC proc_EscapeForLike @Url, @UrlLike OUTPUT
        IF (@WebScopeId = @ScopeId)
        BEGIN
            DECLARE curScopeId CURSOR FOR SELECT ScopeId 
            FROM 
                Perms 
            WHERE
                SiteId = @SiteId AND
                WebId in (
                    SELECT Id FROM Webs WHERE
                        Webs.ScopeId = @ScopeId AND
                        Webs.FirstUniqueAncestorWebId = @WebId)
        END
        ELSE
        BEGIN
            DECLARE curScopeId CURSOR FOR SELECT ScopeId 
            FROM 
                Perms 
            WHERE
                SiteId = @SiteId AND
                WebId = @WebId AND
                Perms.ScopeUrl LIKE @UrlLike
        END
        OPEN curScopeId
        FETCH NEXT FROM curScopeId INTO @SubScopeId
        WHILE (@@FETCH_STATUS = 0)
        BEGIN
            IF @SubScopeId <> @ScopeId
                EXEC proc_SecRemovePrincipalFromOneScope 
                    @SiteId, @SubScopeId, @PrincipalId
            FETCH NEXT FROM curScopeId INTO @SubScopeId
        END
        CLOSE curScopeId
        DEALLOCATE curScopeId
    END
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 0
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
