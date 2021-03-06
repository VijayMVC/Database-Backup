/****** Object:  StoredProcedure [dbo].[proc_SecAddRoleDef]    Script Date: 5/15/2018 12:12:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecAddRoleDef(
    @SiteId       uniqueidentifier,
    @WebId        uniqueidentifier,
    @Title        nvarchar(255),
    @Description  nvarchar(512),
    @Hidden       bit,
    @RoleOrder    int,
    @Type         tinyint,
    @PermMask     tPermMask,
    @IdToCreate   int,
    @RoleDefId    int = NULL OUTPUT)
AS
    SET NOCOUNT ON
    IF @IdToCreate IS NULL
    BEGIN
        EXEC @RoleDefId = proc_SecGetWebPrincipalId @WebId
    END
    ELSE
    BEGIN
        SET @RoleDefId = @IdToCreate
    END
    DECLARE @RoleCount      int
    SELECT 
        @RoleCount = COUNT(*)
    FROM
        Roles
    WHERE
        SiteID = @SiteId AND
        WebId  = @WebId
    IF @RoleCount >= 1000
    BEGIN
        RETURN 1816
    END
    DECLARE @ScopeId uniqueidentifier
    SELECT 
        @ScopeId = ScopeId
    FROM
        Webs
    WHERE
        SiteId = @SiteId AND
        Id = @WebId
    BEGIN TRAN
    INSERT INTO Roles(
        SiteId,
        WebId,
        RoleId,
        Title,
        Description,
        Hidden,
        RoleOrder,
        Type,
        PermMask)
    VALUES(
        @SiteId,
        @WebId,
        @RoleDefId,
        @Title,
        @Description,
        @Hidden,
        @RoleOrder,
        @Type,
        @PermMask)
    IF 0 <> @@ERROR
    BEGIN
        ROLLBACK
        RETURN 80
    END
    EXEC proc_SecLogChange @SiteId, @WebId, @ScopeId, NULL, @RoleDefId, NULL, 262144, NULL
    COMMIT
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
