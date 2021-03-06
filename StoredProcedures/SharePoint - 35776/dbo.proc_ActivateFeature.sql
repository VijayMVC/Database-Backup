/****** Object:  StoredProcedure [dbo].[proc_ActivateFeature]    Script Date: 5/15/2018 12:11:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ActivateFeature(
    @SiteId                     uniqueidentifier,
    @WebId                      uniqueidentifier, 
    @FeatureId                  uniqueidentifier,
    @Properties                 ntext = NULL)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    DECLARE @iRet int
    SET @iRet = 0
    IF (@WebId = '00000000-0000-0000-0000-000000000000')
    BEGIN
        IF NOT EXISTS (SELECT Id FROM Sites WHERE Id = @SiteId)
            RETURN 3
    END
    ELSE
    BEGIN
        IF NOT EXISTS (SELECT Id FROM Webs WHERE Id = @WebId AND SiteId = @SiteId)
            RETURN 3
    END
    BEGIN TRAN
    IF EXISTS (
        SELECT (1) FROM 
            Features WITH(SERIALIZABLE, UPDLOCK)
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            FeatureId = @FeatureId)
    BEGIN
        SET @iRet = 80
        GOTO cleanup
    END
    SET @Now = GETUTCDATE()
    INSERT INTO Features (
        SiteId,
        WebId,
        FeatureId,
        TimeActivated,
        Flags,
        Properties,
        PropertiesModified)
    VALUES (
        @SiteId,
        @WebId,
        @FeatureId,
        @Now,
        0,
        @Properties,
        @Now)
    IF (@@ROWCOUNT <> 1 OR @@ERROR <> 0)
    BEGIN
        SET @iRet = 1168
    END
cleanup:
    IF (@iRet <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @iRet

GO
