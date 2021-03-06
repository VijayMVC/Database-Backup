/****** Object:  StoredProcedure [dbo].[proc_MSS_DeletePropertyMappingsPendingForManagedProperty]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeletePropertyMappingsPendingForManagedProperty
@PID int
AS
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @DateNow datetime Select @DateNow = CURRENT_TIMESTAMP

BEGIN TRANSACTION
    delete MSSSchemaPropertyMappingsPending
           where pid = @PID
    SELECT @RetVal = @@ERROR
    IF 0 = @RetVal
    BEGIN
        COMMIT TRANSACTION
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION
    END
    return @RetVal

GO
