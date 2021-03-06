/****** Object:  StoredProcedure [dbo].[proc_MSS_SetMappingOrder]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetMappingOrder
@PID int,
@CrawledPropertyId int,
@FromOrder int,
@ToOrder int
AS
DECLARE @RetVal int  SET @RetVal = 0
BEGIN TRANSACTION
    Update MSSSchemaPropertyMappings
       Set MappingOrder = @ToOrder
       Where @PID = PID
        and  @CrawledPropertyId = CrawledPropertyId
        and  @FromOrder = MappingOrder
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
