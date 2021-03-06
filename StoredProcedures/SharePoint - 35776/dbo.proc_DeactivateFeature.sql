/****** Object:  StoredProcedure [dbo].[proc_DeactivateFeature]    Script Date: 5/15/2018 12:11:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeactivateFeature(
    @SiteId                     uniqueidentifier,
    @WebId                      uniqueidentifier, 
    @FeatureId                  uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DELETE FROM
        Features
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        FeatureId = @FeatureId
    IF (@@ROWCOUNT <> 1 OR @@ERROR <> 0)
    BEGIN
        SET @iRet = 3
    END
    RETURN @iRet

GO
