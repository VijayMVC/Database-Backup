/****** Object:  StoredProcedure [dbo].[proc_MSS_SetPendingMappings]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetPendingMappings
@PID int
AS
DECLARE @RetVal int  SET @RetVal = 0
BEGIN TRANSACTION
    Delete MSSSchemaPropertyMappings where @PID = PID
    SELECT @RetVal = @@ERROR
    IF 0 != @RetVal
    BEGIN
        ROLLBACK TRANSACTION
        return @RetVal
    END
    Insert Into MSSSchemaPropertyMappings 
           select PID, MappingOrder, CrawledPropertyId From MSSSchemaPropertyMappingsPending
           Where @PID = Pid 
    SELECT @RetVal = @@ERROR
    IF 0 != @RetVal
    BEGIN
        ROLLBACK TRANSACTION
        return @RetVal
    END
    DECLARE @dtNow datetime Set @dtNow = CURRENT_TIMESTAMP
    Update mssCrawledProperties 
        set LastModified = @dtNow
        where CrawledPropertyId IN
           ( Select CrawledPropertyId 
             from MSSSchemaPropertyMappingsPending 
             where @PID = PID )
    SELECT @RetVal = @@ERROR
    IF 0 != @RetVal
    BEGIN
        ROLLBACK TRANSACTION
        return @RetVal
    END
    Delete MSSSchemaPropertyMappingsPending where @PID = PID   
    SELECT @RetVal = @@ERROR
    IF 0 != @RetVal
    BEGIN
        ROLLBACK TRANSACTION
        return @RetVal
    END
    Update MSSSchemaHighLevelProps set LastCPAddsBenignModified = @dtNow
    SELECT @RetVal = @@ERROR    
    if ( 0 != @RetVal )
    BEGIN
        ROLLBACK TRANSACTION
        return @RetVal
    END
    COMMIT Transaction
    return @RetVal

GO
