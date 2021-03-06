/****** Object:  StoredProcedure [dbo].[proc_ConfirmSiteUsage]    Script Date: 5/15/2018 12:12:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ConfirmSiteUsage(
    @SiteId uniqueidentifier,
    @Disable bit)
AS
    SET NOCOUNT ON
    DECLARE @DTM datetime
    SELECT @DTM = GETUTCDATE()
    UPDATE
        Sites
    SET
        CertificationDate = CASE WHEN @Disable = 1
        THEN NULL
        ELSE @DTM END,
        DeadWebNotifyCount = 0
    WHERE
        Id = @SiteId
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        8192,  8, @DTM
    RETURN 0             

GO
