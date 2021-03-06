/****** Object:  StoredProcedure [dbo].[proc_SecFixWeb]    Script Date: 5/15/2018 12:12:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecFixWeb(
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @SiteId uniqueidentifier
    DECLARE @ScopeId uniqueidentifier
    DECLARE @FullUrl nvarchar(260)
    DECLARE @OwnerId int
    SELECT 
        @SiteId = Webs.SiteId,
        @FullUrl = Webs.FullUrl,
        @ScopeId = Webs.ScopeId,
        @OwnerId = Sites.OwnerID
    FROM
        Webs
    INNER JOIN 
        Sites
    ON
        Sites.Id = Webs.SiteId
    WHERE 
        Webs.Id = @WebId
    IF NOT EXISTS (SELECT * FROM Perms WHERE SiteId = @SiteId AND ScopeId = @ScopeId)
    BEGIN
        BEGIN TRAN
        DECLARE @AdminRoleId int
        SET @AdminRoleId = 1073741824 + 5
        DECLARE @RoleDefWebId uniqueidentifier
        SELECT @RoleDefWebId = @WebId
        WHILE NOT EXISTS (SELECT WebId FROM Roles WHERE SiteId = @SiteId AND WebId = @RoleDefWebId) AND @RoleDefWebId IS NOT NULL
        BEGIN
            SELECT 
                @RoleDefWebId = ParentWebId
            FROM
                Webs
            WHERE
                Id = @RoleDefWebId
        END
        DELETE
            RoleAssignment
        WHERE
            SiteId  = @SiteId AND
            ScopeId = @ScopeId AND 
            RoleId  = @AdminRoleId AND
            PrincipalId = @OwnerId
        EXEC proc_SecAddPermScopeForWeb @SiteId, @ScopeId, @RoleDefWebId, @WebId, 0, @FullUrl
        EXEC proc_SecAddPrincipalToRole @SiteId, @WebId, @ScopeId, @AdminRoleId, @OwnerId
        COMMIT
    END

GO
