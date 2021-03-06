/****** Object:  StoredProcedure [dbo].[proc_SecFixScope]    Script Date: 5/15/2018 12:12:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecFixScope(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ScopeId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ScopeIdCur uniqueidentifier
    DECLARE @ScopeIdOld uniqueidentifier
    DECLARE @ScopeUrl nvarchar(260)
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    DECLARE @OpenerRoleId int
    DECLARE @bRoot        bit
    DECLARE @WebScopeId uniqueidentifier
    SET @OpenerRoleId = 1073741824 + 1
    SELECT 
        @ScopeUrl = ScopeUrl 
    FROM
        Perms
    WHERE
        SiteId = @SiteId AND
        ScopeId = @ScopeId
    SELECT
        @WebScopeId = ScopeId
    FROM
        Webs
    WHERE
        Id = @WebId
    SET @ScopeIdCur = @ScopeId
    SET @ScopeIdOld = @ScopeId
    SET @bRoot = 0
    EXEC proc_spliturl @ScopeUrl, @DirName OUTPUT, NULL
    BEGIN TRAN
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
                Docs
            WHERE
                SiteId = @SiteId AND
                DirName = @DirName AND
                LeafName = @LeafName
            IF (@ScopeIdCur <> @ScopeIdOld)
            BEGIN
                INSERT INTO RoleAssignment
                SELECT 
                    DISTINCT @SiteId, @ScopeIdCur, @OpenerRoleId, ra1.PrincipalId
                FROM 
                    RoleAssignment AS ra1
                WHERE
                    ra1.SiteId = @SiteId AND
                    ra1.ScopeId = @ScopeId AND 
                    (NOT EXISTS (
                            SELECT 
                                PrincipalId
                            FROM 
                               RoleAssignment AS ra2 
                            WHERE 
                                ra2.SiteId = @SiteId AND 
                                ra2.ScopeId = @ScopeIdCur AND 
                                ra2.PrincipalId = ra1.PrincipalId and 
                                ra2.RoleId = @OpenerRoleId))
                IF (@@ROWCOUNT <> 0)
                BEGIN
                    EXEC proc_SecUpdateAclForScope @SiteId, @ScopeIdCur
                END
           END
            SET @ScopeIdOld = @ScopeIdCur
            IF @DirName = N'' AND @LeafName = N''
                SET @bRoot = 1
        END 
    COMMIT

GO
