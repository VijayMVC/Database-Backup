/****** Object:  StoredProcedure [dbo].[proc_MSS_DeletePropertyMappingsFromIds]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeletePropertyMappingsFromIds
@PID int,
@CrawledPropertyId int
AS
DECLARE @Order  int  SET @Order = 0
DECLARE @RetVal int  SET @RetVal = 0
BEGIN TRANSACTION
    delete MSSSchemaPropertyMappings
           where pid = @PID and 
                 crawledPropertyId = @crawledPropertyId
    SELECT @RetVal = @@ERROR
    if ( 0 != @RetVal )
        execute @RetVal = proc_MSS_SetCrawledPropertyLastModified @CrawledPropertyId
    IF 0 = @RetVal
        COMMIT TRANSACTION
    ELSE
    BEGIN
        ROLLBACK TRANSACTION
    END
return @RetVal

GO
