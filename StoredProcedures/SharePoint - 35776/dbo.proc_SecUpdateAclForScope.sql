/****** Object:  StoredProcedure [dbo].[proc_SecUpdateAclForScope]    Script Date: 5/15/2018 12:12:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateAclForScope(
    @SiteId       uniqueidentifier,
    @ScopeId      uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @RoleDefWebId uniqueidentifier
    DECLARE @ptr        binary(16)
    DECLARE @aceCount   int
    DECLARE @pid        int
    DECLARE @pidNext    int
    DECLARE @perm       tPermMask
    DECLARE @permNext   tPermMask
    DECLARE @binary4    binary(4)
    DECLARE @binary8    binary(8)
    DECLARE @binaryPerm binary(8)
    SET @aceCount = 0
    SELECT 
        @ptr = TEXTPTR(acl),
        @RoleDefWebId = RoleDefWebId
    FROM 
        Perms (UPDLOCK) 
    WHERE 
        SiteId = @SiteId AND
        ScopeId = @ScopeId
    IF @ptr IS NULL 
    RETURN
    BEGIN TRAN
    SET @binary4 = dbo.fn_ChangeEndian4(0xfef3)
    UPDATETEXT Perms.acl @ptr 0 NULL @binary4       
    SET @binary8 = dbo.fn_ChangeEndian4(1)
    UPDATETEXT Perms.acl @ptr NULL NULL @binary8    
    SET @binary4 = dbo.fn_ChangeEndian4(1)
    UPDATETEXT Perms.acl @ptr NULL NULL @binary4    
    DECLARE cur CURSOR FOR SELECT PrincipalId, PermMask 
    FROM 
        RoleAssignment 
    INNER JOIN 
        Roles 
    ON
        RoleAssignment.RoleId  = Roles.RoleId
    WHERE
        RoleAssignment.SiteId  = @SiteId AND
        RoleAssignment.ScopeId = @ScopeId AND
        Roles.SiteId    = @SiteId AND
        Roles.WebId     = @RoleDefWebId
    ORDER BY
        PrincipalId
    OPEN cur
    FETCH NEXT FROM cur INTO @pid, @perm
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        FETCH NEXT FROM cur INTO @pidNext, @permNext
        IF @pidNext <> @pid OR @@FETCH_STATUS <> 0
        BEGIN   
            SET @binary4 = dbo.fn_ChangeEndian4(@pid)
            UPDATETEXT Perms.acl @ptr NULL NULL @binary4
            SET @binaryPerm = dbo.fn_ChangeEndian8(@perm)
            UPDATETEXT Perms.acl @ptr NULL NULL @binaryPerm
            SET @aceCount = @aceCount + 1
            SET @pid = @pidNext
            SET @perm = @permNext
        END
        ELSE    
            SET @perm = @perm | @permNext
    END
    CLOSE cur
    DEALLOCATE cur
    SET @binary4 = dbo.fn_ChangeEndian4(@aceCount)
    UPDATETEXT Perms.acl @ptr 12 4 @binary4
    EXEC proc_SecUpdateDepsFromScope @SiteId, @ScopeId
    COMMIT TRAN
    RETURN 0

GO
