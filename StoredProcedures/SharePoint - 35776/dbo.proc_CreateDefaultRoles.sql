/****** Object:  StoredProcedure [dbo].[proc_CreateDefaultRoles]    Script Date: 5/15/2018 12:11:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateDefaultRoles(
    @SiteId                     uniqueidentifier,
    @WebId                      uniqueidentifier,
    @ScopeId                    uniqueidentifier,
    @UserId                     int,
    @SecondaryContactId         int,
    @AdminsName                 nvarchar(255),
    @AdminsDescription          nvarchar(512),
    @AdminsPermMask             tPermMask,
    @AuthorsName                nvarchar(255),
    @AuthorsDescription         nvarchar(512),
    @AuthorsPermMask            tPermMask,
    @ContributorsName           nvarchar(255),
    @ContributorsDescription    nvarchar(512),
    @ContributorsPermMask       tPermMask,
    @BrowsersName               nvarchar(255),
    @BrowsersDescription        nvarchar(512),
    @BrowsersPermMask           tPermMask,
    @GuestsName                 nvarchar(255),
    @GuestsDescription          nvarchar(512),
    @GuestsPermMask             tPermMask)
AS
    SET NOCOUNT ON
    DECLARE @RoleId int
    SET @RoleId = 1073741824 + 5
    EXEC proc_SecAddRoleDef
        @SiteId, @WebId, @AdminsName, @AdminsDescription, 
        0,  
        0,  
        5,
        @AdminsPermMask, @RoleId
    EXEC proc_SecAddPrincipalToRole @SiteId, @WebId, @ScopeId, 
        @RoleId, @UserId
    IF @SecondaryContactId IS NOT NULL
    BEGIN
        EXEC proc_SecAddPrincipalToRole @SiteId, @WebId, @ScopeId, 
            @RoleId, @SecondaryContactId
    END
    SET @RoleId = 1073741824 + 4
    EXEC proc_SecAddRoleDef
        @SiteId, @WebId, @AuthorsName, @AuthorsDescription, 
        0,  
        0,  
        4,
        @AuthorsPermMask, @RoleId
    SET @RoleId = 1073741824 + 3
    EXEC proc_SecAddRoleDef
        @SiteId, @WebId, @ContributorsName, @ContributorsDescription,
        0,  
        0,  
        3,
        @ContributorsPermMask, @RoleId
    SET @RoleId = 1073741824 + 2
    EXEC proc_SecAddRoleDef
        @SiteId, @WebId, @BrowsersName, @BrowsersDescription, 
        0,  
        0,  
        2,
        @BrowsersPermMask, @RoleId
    SET @RoleId = 1073741824 + 1
    EXEC proc_SecAddRoleDef
        @SiteId, @WebId, @GuestsName, @GuestsDescription, 
        1,  
        0,  
        1,
        @GuestsPermMask, @RoleId
    RETURN 0

GO
