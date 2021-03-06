/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteLocation]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteLocation(
    @LocationId int)
 AS

SET NOCOUNT ON

DECLARE @LastError int

BEGIN TRAN

    DELETE dbo.MSSLocationAuthentication
    WHERE LocationID = @LocationId

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0) Or (@@RowCount != 1)
    BEGIN
         ROLLBACK TRAN
         RETURN @LastError
    END

    DELETE dbo.MSSLocationUrlTemplates
    WHERE LocationID = @LocationId

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0)
    BEGIN
         ROLLBACK TRAN
         RETURN @LastError
    END

    EXEC @LastError = dbo.proc_MSS_DeleteLocationVisualisations @LocationId , ''

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0)
    BEGIN
         ROLLBACK TRAN
         RETURN @LastError
    END

    DELETE dbo.MSSLocationXml
    WHERE LocationId = @LocationId

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0) Or (@@RowCount != 1)
    BEGIN
         ROLLBACK TRAN
         RETURN @LastError
    END

    DELETE dbo.MSSLocations
    WHERE Id = @LocationId

    SELECT @LastError = @@ERROR
    IF (@LastError <> 0) Or (@@RowCount != 1)
    BEGIN
         ROLLBACK TRAN
         RETURN @LastError
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
