/****** Object:  StoredProcedure [dbo].[proc_MSS_AddMappingToPendingTable]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddMappingToPendingTable
@PID int,
@CrawledPropset uniqueIdentifier,
@CrawledPropertyName nvarchar(440),
@CrawledVariantType int
AS
DECLARE @RetVal int  SET @RetVal = 0
DECLARE @CrawledPropertyId int Set @CrawledPropertyId = 0
DECLARE @Order  int  SET @Order = 0
BEGIN TRANSACTION
    select @CrawledPropertyId=CrawledPropertyId from MSSCrawledProperties 
        where @CrawledPropset = Propset
          and @CrawledPropertyName = PropertyName
          and @CrawledVariantType = VariantType
    if @CrawledPropertyId = 0
    BEGIN
       select @CrawledPropset, @CrawledPropertyName, @CrawledPropertyId
       ROLLBACK TRANSACTION
       return 13
    END
   select @Order = MAX(MappingOrder) from MSSSchemaPropertyMappingsPending 
          where @PID = PID
   if @Order is NULL
       Select @Order = 100
    else
       Select @Order = @Order + 100
    Insert Into MSSSchemaPropertyMappingsPending 
           Values(@PID, @Order, @CrawledPropertyId)
    SELECT @RetVal = @@ERROR
    IF 0 = @RetVal
        COMMIT TRANSACTION
    ELSE
    BEGIN
        ROLLBACK TRANSACTION
    END
return @RetVal

GO
