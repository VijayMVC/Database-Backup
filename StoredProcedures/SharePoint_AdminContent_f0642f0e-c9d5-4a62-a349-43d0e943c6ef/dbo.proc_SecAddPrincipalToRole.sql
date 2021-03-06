/****** Object:  StoredProcedure [dbo].[proc_SecAddPrincipalToRole]    Script Date: 5/15/2018 12:12:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecAddPrincipalToRole(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ScopeId uniqueidentifier,
    @RoleId int,
    @UserId int,
    @AddChangeLog bit=0,
    @ReturnAuditMask bit=1)
AS
    SET NOCOUNT ON
    DECLARE @ScopeUrl nvarchar(260)
    DECLARE @ScopeIdCur uniqueidentifier
    DECLARE @ScopeIdOld uniqueidentifier
    DECLARE @RoleDefWebId uniqueidentifier
    SELECT
        @RoleDefWebId = RoleDefWebId,
        @ScopeUrl = ScopeUrl
    FROM
        Perms
    WHERE
        SiteId = @SiteId AND
        ScopeId = @ScopeId AND
        WebId   = @WebId
    IF @ScopeUrl IS NULL
        RETURN 3
    IF NOT EXISTS (
        SELECT 
            * 
        FROM
            Roles
        WHERE
            SiteId = @SiteId AND
            WebId = @RoleDefWebId AND
            RoleId = @RoleId
            )
        RETURN 3
    BEGIN TRAN
        EXEC proc_SecAddPrincipalToRoleCore
                @SiteId, @WebId, @ScopeId, @RoleId, @UserId
        IF (@AddChangeLog = 1)
        BEGIN
            EXEC proc_SecLogChange 
                @SiteId, @WebId, @ScopeId, @ScopeUrl, @RoleId, @UserId, 524288, NULL
        END
        DECLARE @WebScopeId uniqueidentifier
        SELECT
            @WebScopeId = ScopeId
        FROM
            Webs
        WHERE
            Id = @WebId
        SET @ScopeIdCur = @ScopeId
        SET @ScopeIdOld = @ScopeId
        IF @ScopeId <> @WebScopeId
        BEGIN
            DECLARE @DirName nvarchar(256)
            DECLARE @LeafName nvarchar(128)
            DECLARE @OpenerRoleId int
            DECLARE @bRoot        bit
            SET @bRoot = 0
            SET @OpenerRoleId = 1073741824 + 1
            EXEC proc_spliturl @ScopeUrl, @DirName OUTPUT, NULL
            WHILE @ScopeIdCur <> @WebScopeId AND @bRoot = 0
            BEGIN
                IF @bRoot = 1   
                BEGIN
                    ROLLBACK
                    RETURN 3
                END
                EXEC proc_spliturl @DirName, @DirName OUTPUT, @LeafName OUTPUT
                SELECT 
                    @ScopeIdCur = ScopeId
                FROM
                    Docs WITH (NOLOCK)
                WHERE
                    SiteId = @SiteId AND
                    DirName = @DirName AND
                    LeafName = @LeafName
                IF (@ScopeIdCur <> @ScopeIdOld)
                BEGIN
                    EXEC proc_SecAddPrincipalToRoleCore
                        @SiteId, @WebId, @ScopeIdCur, @OpenerRoleId, @UserId
                END
                SET @ScopeIdOld = @ScopeIdCur
                IF @DirName = N'' AND @LeafName = N''
                    SET @bRoot = 1
            END 
        END
        EXEC proc_SecUpdateUserActiveStatus @SiteId, @UserId
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 0
    COMMIT
    IF @ReturnAuditMask = 1
    BEGIN
        EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    END
    RETURN 0

GO
