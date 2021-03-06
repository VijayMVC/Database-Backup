/****** Object:  StoredProcedure [dbo].[proc_CalculateAndUpdateSiteDiskUsed]    Script Date: 5/15/2018 12:11:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CalculateAndUpdateSiteDiskUsed(
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @ActualSize bigint
    DECLARE @Ret int
    EXEC @Ret = proc_GetSiteDiskUsed
        @SiteId,
        @ActualSize OUTPUT
    IF @Ret <> 0
    BEGIN
        GOTO cleanup
    END
    UPDATE
        Sites
    SET 
        DiskUsed = @ActualSize
    WHERE
        Id = @SiteId AND
        DiskUsed <> @ActualSize
    IF (@@ROWCOUNT = 1)
    BEGIN
        EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            8192,  8, NULL
    END
    DELETE FROM
        SiteQuota
    WHERE
        SiteId = @SiteId
    SET @Ret = 0
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN 0

GO
