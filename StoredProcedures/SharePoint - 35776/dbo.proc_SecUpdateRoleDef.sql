/****** Object:  StoredProcedure [dbo].[proc_SecUpdateRoleDef]    Script Date: 5/15/2018 12:12:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateRoleDef(
    @SiteId       uniqueidentifier,
    @WebId        uniqueidentifier,
    @RoleId       int,
    @Title        nvarchar(255),
    @Description  nvarchar(512),
    @Order        int,
    @Type         tinyint,
    @PermMask     tPermMask)
AS
    SET NOCOUNT ON
    BEGIN TRAN
    UPDATE
        Roles
    SET
        Title       = @Title,
        Description = @Description,
        RoleOrder   = @Order,
        Type        = @Type,
        PermMask    = COALESCE(@PermMask, PermMask)
    WHERE
        SiteId  = @SiteId AND
        WebId   = @WebId AND
        RoleId  = @RoleId
    IF 0 <> @@ERROR
    BEGIN
        ROLLBACK
        RETURN 80
    END
    IF @PermMask IS NOT NULL
    BEGIN
        EXEC proc_SecUpdateAcl @SiteId, @WebId            
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 0
    END
    DECLARE @ScopeId uniqueidentifier
    SELECT 
        @ScopeId = ScopeId
    FROM
        Webs
    WHERE
        SiteId = @SiteId AND
        Id = @WebId
    EXEC proc_SecLogChange @SiteId, @WebId, @ScopeId, NULL, @RoleId, NULL, 16777216, NULL
    COMMIT
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
