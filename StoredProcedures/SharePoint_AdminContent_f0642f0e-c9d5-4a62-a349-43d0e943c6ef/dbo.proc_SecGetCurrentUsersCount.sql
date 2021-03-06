/****** Object:  StoredProcedure [dbo].[proc_SecGetCurrentUsersCount]    Script Date: 5/15/2018 12:12:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetCurrentUsersCount(
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @QuotaOrLockStatus int
    DECLARE @StorageQuotaError int
    SET @StorageQuotaError = 0
    SELECT  @QuotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@QuotaOrLockStatus = 1)
    BEGIN
        SET @StorageQuotaError = 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        SET @StorageQuotaError = 212
    END
    SELECT
        UsersCount,
        UserQuota,
        @StorageQuotaError
    FROM
        Sites
    WHERE
        Id = @SiteId
    RETURN 0

GO
