/****** Object:  StoredProcedure [dbo].[proc_SecMigrateUser]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecMigrateUser(
    @SiteId uniqueidentifier,
    @OldLogin nvarchar(255),
    @NewLogin nvarchar(255),
    @NewSystemId tSystemID,
    @IsWindowsAuth bit,
    @OldSystemId tSystemID = NULL)
AS
    SET NOCOUNT ON
    DECLARE @OldUserId int, @NewUserId int
    SET @NewUserId = -1
    SET @OldUserId = -1
    UPDATE UserInfo
    SET
       tp_SystemId = CONVERT(varbinary, NEWID()),
       tp_Deleted = tp_Id,
       @NewUserId = tp_ID       
    WHERE
       tp_SiteId = @SiteId AND
       tp_SystemId = @NewSystemId AND
       tp_Login = @NewLogin AND
       (tp_DomainGroup = 0 OR @IsWindowsAuth = 0)
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1003
    END
    UPDATE UserInfo
    SET
       tp_SystemId = @NewSystemId,
       tp_Login = @NewLogin,
       tp_ExternalToken = NULL,
       @OldUserId = tp_ID
    WHERE
       tp_SiteId = @SiteId AND
       tp_Login = @OldLogin AND
       tp_Deleted = 0 AND           
       (@OldSystemId IS NULL OR tp_SystemId = @OldSystemId) AND
       (tp_DomainGroup = 0 OR @IsWindowsAuth = 0)
    IF(@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        RETURN 1003
    END
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 1
    SELECT @OldUserId, @NewUserId
    RETURN 0

GO
