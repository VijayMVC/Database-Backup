/****** Object:  StoredProcedure [dbo].[proc_MSS_PutLocationVisualisation]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_PutLocationVisualisation(
   @LocationId int,
   @VisualisationName nvarchar(60),
   @Xsl ntext,
   @Properties ntext,
   @SampleData ntext,
    @DeleteAllBeforePut bit = 0)
 AS

SET NOCOUNT ON

DECLARE @LastError int

BEGIN TRAN

IF @DeleteAllBeforePut = 1
BEGIN
   EXEC @LastError = dbo.proc_MSS_DeleteLocationVisualisations @LocationId, ''
   SELECT @LastError = @@ERROR
   IF @LastError <> 0
    BEGIN
        ROLLBACK TRAN
        RETURN @LastError
    END
END

SELECT LocationId
FROM dbo.MSSLocationVisualisations
WHERE LocationId = @LocationId And VisualisationName = @VisualisationName

IF @@Rowcount = 0
BEGIN
    INSERT INTO dbo.MSSLocationVisualisations
       (LocationId, VisualisationName, Xsl, Properties, SampleData)
   VALUES
      (@LocationId,@VisualisationName, @Xsl, @Properties, @SampleData)

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0)  Or (@@Rowcount <> 1)
    BEGIN
        ROLLBACK TRAN
        RETURN @LastError
    END

END
ELSE
BEGIN

    UPDATE dbo.MSSLocationVisualsisations
    SET
       Xsl = @Xsl,
       Properties = @Properties,
       SampleData = @SampleData
    WHERE LocationId = @LocationId And VisualisationName = @VisualisationName

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0)  Or (@@Rowcount <> 1)
    BEGIN
        ROLLBACK TRAN
        RETURN @LastError
    END

END

EXEC @LastError = dbo.proc_MSS_UpdateCacheInformation

SELECT @LastError = @@ERROR
IF @LastError <> 0
BEGIN 
    ROLLBACK TRAN
    RETURN @LastError
END

COMMIT TRAN
RETURN 0

GO
