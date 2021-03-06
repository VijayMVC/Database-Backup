/****** Object:  StoredProcedure [dbo].[proc_SecUpdateAnonymousPermMask]    Script Date: 5/15/2018 12:12:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateAnonymousPermMask(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ScopeId uniqueidentifier,
    @AnonymousPermMask tPermMask)
AS
    SET NOCOUNT ON
    BEGIN TRAN
        UPDATE
            Perms
        SET
            AnonymousPermMask = @AnonymousPermMask
        WHERE
            SiteId = @SiteId AND
            ScopeId = @ScopeId AND
            WebId   = @WebId
        EXEC proc_SecLogChange @SiteId, @WebId, @ScopeId, NULL, NULL, -1, 524288, NULL
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 0
    COMMIT
    RETURN 0

GO
