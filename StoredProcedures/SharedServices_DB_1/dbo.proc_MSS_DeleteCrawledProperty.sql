/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteCrawledProperty]    Script Date: 5/15/2018 12:11:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteCrawledProperty
@Propset uniqueidentifier,
@PropertyName nvarchar (440),
@VariantType int
AS
BEGIN TRANSACTION
    Declare @RetVal int
    DELETE MSSSchemaPropertyMappings
    FROM MSSSchemaPropertyMappings INNER JOIN MSSCrawledProperties 
       ON MSSSchemaPropertyMappings.crawledPropertyId = MSSCrawledProperties.crawledPropertyId
    WHERE  @Propset =  Propset and @PropertyName = PropertyName and @VariantType = VariantType

    Select @RetVal = @@ERROR 
    if 0 <> @RetVal
    BEGIN
       RollBack Transaction
       return @RetVal                           
    END

    Delete MSSCrawledProperties 
        where @Propset =  Propset and @PropertyName = PropertyName and @VariantType = VariantType

    Select @RetVal = @@ERROR 
    if 0 <> @RetVal
    BEGIN
       RollBack Transaction
       return @RetVal                           
    END

    update msscrawledPropCategory set crawledPropertyCount = 
         ( select count(*) from msscrawledProperties where propset = msscrawledPropCategory.propset )
         Where Propset = @Propset
    Select @RetVal = @@ERROR 
    if 0 <> @RetVal
    BEGIN
       RollBack Transaction
       return @RetVal                           
    END

    update MSSSchemaHighLevelProps Set LastCPDelete = CURRENT_TIMESTAMP,
                                       LastManagedPropDeleted = CURRENT_TIMESTAMP
    Select @RetVal = @@ERROR 
    if 0 <> @RetVal
    BEGIN
       RollBack Transaction
       return @RetVal                           
    END

 COMMIT TRANSACTION

GO
