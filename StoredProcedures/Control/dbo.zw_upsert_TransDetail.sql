/****** Object:  StoredProcedure [dbo].[zw_upsert_TransDetail]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_TransDetail ( 
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
@TransHeaderTransNumber int  = NULL , 
@GoodsItemID int  = NULL , 
@GoodsItemClassTypeID int  = NULL , 
@GoodsItemCode [nvarchar](35)   = NULL , 
@PricingLevel float  = NULL , 
@PricingLevelOverridden bit  = NULL , 
@DiscountLevel float  = NULL , 
@DiscountLevelOverridden bit  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@Quantity float  = NULL , 
@LineItemIndex int  = NULL , 
@LineItemNumber [nvarchar](50)   = NULL , 
@HTMLShortFormat [nvarchar](MAX)   = NULL , 
@HTMLLongFormat [nvarchar](MAX)   = NULL , 
@BasePrice [decimal](18,4)  = NULL , 
@BaseCalcPrice [decimal](18,4)  = NULL , 
@BaseOverriddenPrice [decimal](18,4)  = NULL , 
@BaseIsOverridden bit  = NULL , 
@DiscountPrice [decimal](18,4)  = NULL , 
@DiscountCalcPrice [decimal](18,4)  = NULL , 
@DiscountOverriddenPrice [decimal](18,4)  = NULL , 
@DiscountIsOverridden bit  = NULL , 
@ModifierPrice [decimal](18,4)  = NULL , 
@ModifierCalcPrice [decimal](18,4)  = NULL , 
@ModifierOverriddenPrice [decimal](18,4)  = NULL , 
@ModifierIsOverridden bit  = NULL , 
@RawSubTotalPrice [decimal](18,4)  = NULL , 
@RawSubTotalCalcPrice [decimal](18,4)  = NULL , 
@RawSubTotalOverriddenPrice [decimal](18,4)  = NULL , 
@RawSubTotalIsOverridden bit  = NULL , 
@RoundingPrice [decimal](18,4)  = NULL , 
@RoundingCalcPrice [decimal](18,4)  = NULL , 
@RoundingOverriddenPrice [decimal](18,4)  = NULL , 
@RoundingIsOverridden bit  = NULL , 
@SubTotalPrice [decimal](18,4)  = NULL , 
@SubTotalCalcPrice [decimal](18,4)  = NULL , 
@SubTotalOverriddenPrice [decimal](18,4)  = NULL , 
@SubTotalIsOverridden bit  = NULL , 
@TaxesPrice [decimal](18,4)  = NULL , 
@TaxesCalcPrice [decimal](18,4)  = NULL , 
@TaxesOverriddenPrice [decimal](18,4)  = NULL , 
@TaxesIsOverridden bit  = NULL , 
@TotalPrice [decimal](18,4)  = NULL , 
@TotalCalcPrice [decimal](18,4)  = NULL , 
@TotalOverriddenPrice [decimal](18,4)  = NULL , 
@TotalIsOverridden bit  = NULL , 
@MeAndSonsBasePrice [decimal](18,4)  = NULL , 
@MeAndSonsDiscountPrice [decimal](18,4)  = NULL , 
@MeAndSonsModifierPrice [decimal](18,4)  = NULL , 
@MeAndSonsRawSubTotalPrice [decimal](18,4)  = NULL , 
@MeAndSonsRoundingPrice [decimal](18,4)  = NULL , 
@MeAndSonsSubTotalPrice [decimal](18,4)  = NULL , 
@MeAndSonsTaxesPrice [decimal](18,4)  = NULL , 
@MeAndSonsTotalPrice [decimal](18,4)  = NULL , 
@InternalNotes [nvarchar](MAX)   = NULL , 
@UnitParamName [nvarchar](15)   = NULL , 
@UnitParamValue float  = NULL , 
@VariationID int  = NULL , 
@ImageParamID int  = NULL , 
@ImageParamStoreID int  = NULL , 
@ImageParamClassTypeID int  = NULL , 
@StageID int  = NULL , 
@StageStoreID int  = NULL , 
@StageClassTypeID int  = NULL , 
@SaleAccountID int  = NULL , 
@SaleAccountStoreID int  = NULL , 
@SaleAccountClassTypeID int  = NULL , 
@SaleAccountOverridden bit  = NULL , 
@ChildItemCount int  = NULL , 
@ParameterStr [nvarchar](MAX)   = NULL , 
@ModifierStr [nvarchar](MAX)   = NULL , 
@PartStr [nvarchar](MAX)   = NULL , 
@VarGridParam1ID int  = NULL , 
@VarGridParam2ID int  = NULL , 
@VarGridValues1 [nvarchar](MAX)   = NULL , 
@VarGridValues2 [nvarchar](MAX)   = NULL , 
@VarGridParam1OV bit  = NULL , 
@VarGridParam2OV bit  = NULL , 
@TaxItems [nvarchar](MAX)   = NULL , 
@IsComplete bit  = NULL , 
@AssignedToID int  = NULL , 
@TicketItemNumber int  = NULL , 
@ShippingCompanyID int  = NULL , 
@ShippingCompanyOV bit  = NULL , 
@ShippingContactID int  = NULL , 
@ShippingContactOV bit  = NULL , 
@ShippingAddressID int  = NULL , 
@ShippingAddressLinkID int  = NULL , 
@ShippingAddressOV bit  = NULL , 
@ShippingTaxClassID int  = NULL , 
@ShippingTaxClassOV bit  = NULL , 
@TotMaterialCost float  = NULL , 
@TotLaborCost float  = NULL , 
@TotEquipmentCost float  = NULL , 
@TotOutSourceCost float  = NULL , 
@TotOtherCost float  = NULL , 
@TotPartCost float  = NULL , 
@HasWorkAssignment bit  = NULL , 
@WorkAssignmentID int  = NULL , 
@WorkAssignmentStoreID int  = NULL , 
@WorkAssignmentClassTypeID int  = NULL , 
@TotFreightCost float  = NULL , 
@PriorityID int  = NULL , 
@PriorityStoreID int  = NULL , 
@PriorityClassTypeID int  = NULL , 
@AssignedToClassTypeID int  = NULL , 
@ProofApproved bit  = NULL , 
@ProofApprovedDate datetime  = NULL , 
@ProofApprovedByID int  = NULL , 
@PercentComplete float  = NULL , 
@PercentCompleteOV bit  = NULL , 
@TermID int  = NULL , 
@ContractPeriodID int  = NULL , 
@ContractStartDate datetime  = NULL , 
@ContractEndDate datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TransDetail] 
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
		[TransHeaderTransNumber] = @TransHeaderTransNumber, 
		[GoodsItemID] = @GoodsItemID, 
		[GoodsItemClassTypeID] = @GoodsItemClassTypeID, 
		[GoodsItemCode] = @GoodsItemCode, 
		[PricingLevel] = @PricingLevel, 
		[PricingLevelOverridden] = @PricingLevelOverridden, 
		[DiscountLevel] = @DiscountLevel, 
		[DiscountLevelOverridden] = @DiscountLevelOverridden, 
		[Description] = @Description, 
		[Quantity] = @Quantity, 
		[LineItemIndex] = @LineItemIndex, 
		[LineItemNumber] = @LineItemNumber, 
		[HTMLShortFormat] = @HTMLShortFormat, 
		[HTMLLongFormat] = @HTMLLongFormat, 
		[BasePrice] = @BasePrice, 
		[BaseCalcPrice] = @BaseCalcPrice, 
		[BaseOverriddenPrice] = @BaseOverriddenPrice, 
		[BaseIsOverridden] = @BaseIsOverridden, 
		[DiscountPrice] = @DiscountPrice, 
		[DiscountCalcPrice] = @DiscountCalcPrice, 
		[DiscountOverriddenPrice] = @DiscountOverriddenPrice, 
		[DiscountIsOverridden] = @DiscountIsOverridden, 
		[ModifierPrice] = @ModifierPrice, 
		[ModifierCalcPrice] = @ModifierCalcPrice, 
		[ModifierOverriddenPrice] = @ModifierOverriddenPrice, 
		[ModifierIsOverridden] = @ModifierIsOverridden, 
		[RawSubTotalPrice] = @RawSubTotalPrice, 
		[RawSubTotalCalcPrice] = @RawSubTotalCalcPrice, 
		[RawSubTotalOverriddenPrice] = @RawSubTotalOverriddenPrice, 
		[RawSubTotalIsOverridden] = @RawSubTotalIsOverridden, 
		[RoundingPrice] = @RoundingPrice, 
		[RoundingCalcPrice] = @RoundingCalcPrice, 
		[RoundingOverriddenPrice] = @RoundingOverriddenPrice, 
		[RoundingIsOverridden] = @RoundingIsOverridden, 
		[SubTotalPrice] = @SubTotalPrice, 
		[SubTotalCalcPrice] = @SubTotalCalcPrice, 
		[SubTotalOverriddenPrice] = @SubTotalOverriddenPrice, 
		[SubTotalIsOverridden] = @SubTotalIsOverridden, 
		[TaxesPrice] = @TaxesPrice, 
		[TaxesCalcPrice] = @TaxesCalcPrice, 
		[TaxesOverriddenPrice] = @TaxesOverriddenPrice, 
		[TaxesIsOverridden] = @TaxesIsOverridden, 
		[TotalPrice] = @TotalPrice, 
		[TotalCalcPrice] = @TotalCalcPrice, 
		[TotalOverriddenPrice] = @TotalOverriddenPrice, 
		[TotalIsOverridden] = @TotalIsOverridden, 
		[MeAndSonsBasePrice] = @MeAndSonsBasePrice, 
		[MeAndSonsDiscountPrice] = @MeAndSonsDiscountPrice, 
		[MeAndSonsModifierPrice] = @MeAndSonsModifierPrice, 
		[MeAndSonsRawSubTotalPrice] = @MeAndSonsRawSubTotalPrice, 
		[MeAndSonsRoundingPrice] = @MeAndSonsRoundingPrice, 
		[MeAndSonsSubTotalPrice] = @MeAndSonsSubTotalPrice, 
		[MeAndSonsTaxesPrice] = @MeAndSonsTaxesPrice, 
		[MeAndSonsTotalPrice] = @MeAndSonsTotalPrice, 
		[InternalNotes] = @InternalNotes, 
		[UnitParamName] = @UnitParamName, 
		[UnitParamValue] = @UnitParamValue, 
		[VariationID] = @VariationID, 
		[ImageParamID] = @ImageParamID, 
		[ImageParamStoreID] = @ImageParamStoreID, 
		[ImageParamClassTypeID] = @ImageParamClassTypeID, 
		[StageID] = @StageID, 
		[StageStoreID] = @StageStoreID, 
		[StageClassTypeID] = @StageClassTypeID, 
		[SaleAccountID] = @SaleAccountID, 
		[SaleAccountStoreID] = @SaleAccountStoreID, 
		[SaleAccountClassTypeID] = @SaleAccountClassTypeID, 
		[SaleAccountOverridden] = @SaleAccountOverridden, 
		[ChildItemCount] = @ChildItemCount, 
		[ParameterStr] = @ParameterStr, 
		[ModifierStr] = @ModifierStr, 
		[PartStr] = @PartStr, 
		[VarGridParam1ID] = @VarGridParam1ID, 
		[VarGridParam2ID] = @VarGridParam2ID, 
		[VarGridValues1] = @VarGridValues1, 
		[VarGridValues2] = @VarGridValues2, 
		[VarGridParam1OV] = @VarGridParam1OV, 
		[VarGridParam2OV] = @VarGridParam2OV, 
		[TaxItems] = @TaxItems, 
		[IsComplete] = @IsComplete, 
		[AssignedToID] = @AssignedToID, 
		[TicketItemNumber] = @TicketItemNumber, 
		[ShippingCompanyID] = @ShippingCompanyID, 
		[ShippingCompanyOV] = @ShippingCompanyOV, 
		[ShippingContactID] = @ShippingContactID, 
		[ShippingContactOV] = @ShippingContactOV, 
		[ShippingAddressID] = @ShippingAddressID, 
		[ShippingAddressLinkID] = @ShippingAddressLinkID, 
		[ShippingAddressOV] = @ShippingAddressOV, 
		[ShippingTaxClassID] = @ShippingTaxClassID, 
		[ShippingTaxClassOV] = @ShippingTaxClassOV, 
		[TotMaterialCost] = @TotMaterialCost, 
		[TotLaborCost] = @TotLaborCost, 
		[TotEquipmentCost] = @TotEquipmentCost, 
		[TotOutSourceCost] = @TotOutSourceCost, 
		[TotOtherCost] = @TotOtherCost, 
		[TotPartCost] = @TotPartCost, 
		[HasWorkAssignment] = @HasWorkAssignment, 
		[WorkAssignmentID] = @WorkAssignmentID, 
		[WorkAssignmentStoreID] = @WorkAssignmentStoreID, 
		[WorkAssignmentClassTypeID] = @WorkAssignmentClassTypeID, 
		[TotFreightCost] = @TotFreightCost, 
		[PriorityID] = @PriorityID, 
		[PriorityStoreID] = @PriorityStoreID, 
		[PriorityClassTypeID] = @PriorityClassTypeID, 
		[AssignedToClassTypeID] = @AssignedToClassTypeID, 
		[ProofApproved] = @ProofApproved, 
		[ProofApprovedDate] = @ProofApprovedDate, 
		[ProofApprovedByID] = @ProofApprovedByID, 
		[PercentComplete] = @PercentComplete, 
		[PercentCompleteOV] = @PercentCompleteOV, 
		[TermID] = @TermID, 
		[ContractPeriodID] = @ContractPeriodID, 
		[ContractStartDate] = @ContractStartDate, 
		[ContractEndDate] = @ContractEndDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [TransDetail]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [TransactionType], [ParentID], [ParentClassTypeID], [TransHeaderID], [TransHeaderClassTypeID], [TransHeaderTransNumber], [GoodsItemID], [GoodsItemClassTypeID], [GoodsItemCode], [PricingLevel], [PricingLevelOverridden], [DiscountLevel], [DiscountLevelOverridden], [Description], [Quantity], [LineItemIndex], [LineItemNumber], [HTMLShortFormat], [HTMLLongFormat], [BasePrice], [BaseCalcPrice], [BaseOverriddenPrice], [BaseIsOverridden], [DiscountPrice], [DiscountCalcPrice], [DiscountOverriddenPrice], [DiscountIsOverridden], [ModifierPrice], [ModifierCalcPrice], [ModifierOverriddenPrice], [ModifierIsOverridden], [RawSubTotalPrice], [RawSubTotalCalcPrice], [RawSubTotalOverriddenPrice], [RawSubTotalIsOverridden], [RoundingPrice], [RoundingCalcPrice], [RoundingOverriddenPrice], [RoundingIsOverridden], [SubTotalPrice], [SubTotalCalcPrice], [SubTotalOverriddenPrice], [SubTotalIsOverridden], [TaxesPrice], [TaxesCalcPrice], [TaxesOverriddenPrice], [TaxesIsOverridden], [TotalPrice], [TotalCalcPrice], [TotalOverriddenPrice], [TotalIsOverridden], [MeAndSonsBasePrice], [MeAndSonsDiscountPrice], [MeAndSonsModifierPrice], [MeAndSonsRawSubTotalPrice], [MeAndSonsRoundingPrice], [MeAndSonsSubTotalPrice], [MeAndSonsTaxesPrice], [MeAndSonsTotalPrice], [InternalNotes], [UnitParamName], [UnitParamValue], [VariationID], [ImageParamID], [ImageParamStoreID], [ImageParamClassTypeID], [StageID], [StageStoreID], [StageClassTypeID], [SaleAccountID], [SaleAccountStoreID], [SaleAccountClassTypeID], [SaleAccountOverridden], [ChildItemCount], [ParameterStr], [ModifierStr], [PartStr], [VarGridParam1ID], [VarGridParam2ID], [VarGridValues1], [VarGridValues2], [VarGridParam1OV], [VarGridParam2OV], [TaxItems], [IsComplete], [AssignedToID], [TicketItemNumber], [ShippingCompanyID], [ShippingCompanyOV], [ShippingContactID], [ShippingContactOV], [ShippingAddressID], [ShippingAddressLinkID], [ShippingAddressOV], [ShippingTaxClassID], [ShippingTaxClassOV], [TotMaterialCost], [TotLaborCost], [TotEquipmentCost], [TotOutSourceCost], [TotOtherCost], [TotPartCost], [HasWorkAssignment], [WorkAssignmentID], [WorkAssignmentStoreID], [WorkAssignmentClassTypeID], [TotFreightCost], [PriorityID], [PriorityStoreID], [PriorityClassTypeID], [AssignedToClassTypeID], [ProofApproved], [ProofApprovedDate], [ProofApprovedByID], [PercentComplete], [PercentCompleteOV], [TermID], [ContractPeriodID], [ContractStartDate], [ContractEndDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @TransactionType, @ParentID, @ParentClassTypeID, @TransHeaderID, @TransHeaderClassTypeID, @TransHeaderTransNumber, @GoodsItemID, @GoodsItemClassTypeID, @GoodsItemCode, @PricingLevel, @PricingLevelOverridden, @DiscountLevel, @DiscountLevelOverridden, @Description, @Quantity, @LineItemIndex, @LineItemNumber, @HTMLShortFormat, @HTMLLongFormat, @BasePrice, @BaseCalcPrice, @BaseOverriddenPrice, @BaseIsOverridden, @DiscountPrice, @DiscountCalcPrice, @DiscountOverriddenPrice, @DiscountIsOverridden, @ModifierPrice, @ModifierCalcPrice, @ModifierOverriddenPrice, @ModifierIsOverridden, @RawSubTotalPrice, @RawSubTotalCalcPrice, @RawSubTotalOverriddenPrice, @RawSubTotalIsOverridden, @RoundingPrice, @RoundingCalcPrice, @RoundingOverriddenPrice, @RoundingIsOverridden, @SubTotalPrice, @SubTotalCalcPrice, @SubTotalOverriddenPrice, @SubTotalIsOverridden, @TaxesPrice, @TaxesCalcPrice, @TaxesOverriddenPrice, @TaxesIsOverridden, @TotalPrice, @TotalCalcPrice, @TotalOverriddenPrice, @TotalIsOverridden, @MeAndSonsBasePrice, @MeAndSonsDiscountPrice, @MeAndSonsModifierPrice, @MeAndSonsRawSubTotalPrice, @MeAndSonsRoundingPrice, @MeAndSonsSubTotalPrice, @MeAndSonsTaxesPrice, @MeAndSonsTotalPrice, @InternalNotes, @UnitParamName, @UnitParamValue, @VariationID, @ImageParamID, @ImageParamStoreID, @ImageParamClassTypeID, @StageID, @StageStoreID, @StageClassTypeID, @SaleAccountID, @SaleAccountStoreID, @SaleAccountClassTypeID, @SaleAccountOverridden, @ChildItemCount, @ParameterStr, @ModifierStr, @PartStr, @VarGridParam1ID, @VarGridParam2ID, @VarGridValues1, @VarGridValues2, @VarGridParam1OV, @VarGridParam2OV, @TaxItems, @IsComplete, @AssignedToID, @TicketItemNumber, @ShippingCompanyID, @ShippingCompanyOV, @ShippingContactID, @ShippingContactOV, @ShippingAddressID, @ShippingAddressLinkID, @ShippingAddressOV, @ShippingTaxClassID, @ShippingTaxClassOV, @TotMaterialCost, @TotLaborCost, @TotEquipmentCost, @TotOutSourceCost, @TotOtherCost, @TotPartCost, @HasWorkAssignment, @WorkAssignmentID, @WorkAssignmentStoreID, @WorkAssignmentClassTypeID, @TotFreightCost, @PriorityID, @PriorityStoreID, @PriorityClassTypeID, @AssignedToClassTypeID, @ProofApproved, @ProofApprovedDate, @ProofApprovedByID, @PercentComplete, @PercentCompleteOV, @TermID, @ContractPeriodID, @ContractStartDate, @ContractEndDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
