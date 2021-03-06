/****** Object:  StoredProcedure [dbo].[zw_upsert_TransMod]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_TransMod ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@TransactionType int  = NULL , 
@ParentID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@TransHeaderID int  = NULL , 
@TransHeaderClassTypeID int  = NULL , 
@GoodsItemID int  = NULL , 
@GoodsItemClassTypeID int  = NULL , 
@GoodsItemCode [nvarchar](35)   = NULL , 
@PricingLevel float  = NULL , 
@PricingLevelOverridden bit  = NULL , 
@DiscountLevel float  = NULL , 
@DiscountLevelOverridden bit  = NULL , 
@QuantityApplied float  = NULL , 
@SortOrder int  = NULL , 
@FormattedText [nvarchar](MAX)   = NULL , 
@ListID int  = NULL , 
@ListText [nvarchar](MAX)   = NULL , 
@Units int  = NULL , 
@UnitsText [nvarchar](8)   = NULL , 
@ValueType int  = NULL , 
@ValueAsString [nvarchar](MAX)   = NULL , 
@ValueAsFloat float  = NULL , 
@ValueAsInteger int  = NULL , 
@ValueAsDateTime datetime  = NULL , 
@ValueAsBinary image  = NULL , 
@ValueAsBlob image  = NULL , 
@ModifierPrice money  = NULL , 
@ModifierCalcPrice money  = NULL , 
@ModifierOverriddenPrice money  = NULL , 
@ModifierIsOverridden bit  = NULL , 
@MeAndSonsModifierPrice money  = NULL , 
@InternalNotes [nvarchar](MAX)   = NULL , 
@PartStr [nvarchar](MAX)   = NULL , 
@ValueOverridden bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TransMod] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[TransactionType] = @TransactionType, 
		[ParentID] = @ParentID, 
		[ParentClassTypeID] = @ParentClassTypeID, 
		[TransHeaderID] = @TransHeaderID, 
		[TransHeaderClassTypeID] = @TransHeaderClassTypeID, 
		[GoodsItemID] = @GoodsItemID, 
		[GoodsItemClassTypeID] = @GoodsItemClassTypeID, 
		[GoodsItemCode] = @GoodsItemCode, 
		[PricingLevel] = @PricingLevel, 
		[PricingLevelOverridden] = @PricingLevelOverridden, 
		[DiscountLevel] = @DiscountLevel, 
		[DiscountLevelOverridden] = @DiscountLevelOverridden, 
		[QuantityApplied] = @QuantityApplied, 
		[SortOrder] = @SortOrder, 
		[FormattedText] = @FormattedText, 
		[ListID] = @ListID, 
		[ListText] = @ListText, 
		[Units] = @Units, 
		[UnitsText] = @UnitsText, 
		[ValueType] = @ValueType, 
		[ValueAsString] = @ValueAsString, 
		[ValueAsFloat] = @ValueAsFloat, 
		[ValueAsInteger] = @ValueAsInteger, 
		[ValueAsDateTime] = @ValueAsDateTime, 
		[ValueAsBinary] = @ValueAsBinary, 
		[ValueAsBlob] = @ValueAsBlob, 
		[ModifierPrice] = @ModifierPrice, 
		[ModifierCalcPrice] = @ModifierCalcPrice, 
		[ModifierOverriddenPrice] = @ModifierOverriddenPrice, 
		[ModifierIsOverridden] = @ModifierIsOverridden, 
		[MeAndSonsModifierPrice] = @MeAndSonsModifierPrice, 
		[InternalNotes] = @InternalNotes, 
		[PartStr] = @PartStr, 
		[ValueOverridden] = @ValueOverridden, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [TransMod]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [TransactionType], [ParentID], [ParentClassTypeID], [TransHeaderID], [TransHeaderClassTypeID], [GoodsItemID], [GoodsItemClassTypeID], [GoodsItemCode], [PricingLevel], [PricingLevelOverridden], [DiscountLevel], [DiscountLevelOverridden], [QuantityApplied], [SortOrder], [FormattedText], [ListID], [ListText], [Units], [UnitsText], [ValueType], [ValueAsString], [ValueAsFloat], [ValueAsInteger], [ValueAsDateTime], [ValueAsBinary], [ValueAsBlob], [ModifierPrice], [ModifierCalcPrice], [ModifierOverriddenPrice], [ModifierIsOverridden], [MeAndSonsModifierPrice], [InternalNotes], [PartStr], [ValueOverridden], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @TransactionType, @ParentID, @ParentClassTypeID, @TransHeaderID, @TransHeaderClassTypeID, @GoodsItemID, @GoodsItemClassTypeID, @GoodsItemCode, @PricingLevel, @PricingLevelOverridden, @DiscountLevel, @DiscountLevelOverridden, @QuantityApplied, @SortOrder, @FormattedText, @ListID, @ListText, @Units, @UnitsText, @ValueType, @ValueAsString, @ValueAsFloat, @ValueAsInteger, @ValueAsDateTime, @ValueAsBinary, @ValueAsBlob, @ModifierPrice, @ModifierCalcPrice, @ModifierOverriddenPrice, @ModifierIsOverridden, @MeAndSonsModifierPrice, @InternalNotes, @PartStr, @ValueOverridden, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
