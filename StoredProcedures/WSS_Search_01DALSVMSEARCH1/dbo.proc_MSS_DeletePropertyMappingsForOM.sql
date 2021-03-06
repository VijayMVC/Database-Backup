/****** Object:  StoredProcedure [dbo].[proc_MSS_DeletePropertyMappingsForOM]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeletePropertyMappingsForOM
@FriendlyName  nvarchar(64),
@CrawledPropset uniqueIdentifier,
@CrawledPropertyName nvarchar(440),
@CrawledVariantType int
AS
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @PID int
DECLARE @CrawledPropertyId int
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
