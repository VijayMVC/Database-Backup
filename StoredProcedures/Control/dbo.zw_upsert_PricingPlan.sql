/****** Object:  StoredProcedure [dbo].[zw_upsert_PricingPlan]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_PricingPlan ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@PricingPlanTypeID int  = NULL , 
@GoodsItemID int  = NULL , 
@GoodsItemClassTypeID int  = NULL , 
@SetUpFormula [nvarchar](MAX)   = NULL , 
@BaseMinimum [nvarchar](MAX)   = NULL , 
@OverallMinimum [nvarchar](MAX)   = NULL , 
@RoundingFactor [decimal](18,4)  = NULL , 
@CommissionPlanID int  = NULL , 
@RoyaltyPlanID int  = NULL , 
@ScreenTemplateID int  = NULL , 
@WebInputTemplateID int  = NULL , 
@InvoiceTemplateID int  = NULL , 
@EstimateTemplateID int  = NULL , 
@WorkOrderTemplateID int  = NULL , 
@EmployeeWebOutputTemplateID int  = NULL , 
@CustomerWebOutputTemplateID int  = NULL , 
@QtyDiscountTableID int  = NULL , 
@OverallDiscountTableID int  = NULL , 
@PerPieceMinimum [nvarchar](MAX)   = NULL , 
@UseCustomPriceMethod bit  = NULL , 
@UnitPriceParameterID int  = NULL , 
@UnitPriceParameterClassTypeID int  = NULL , 
@OverheadFormula [nvarchar](MAX)   = NULL , 
@MaterialCostFormula [nvarchar](MAX)   = NULL , 
@LaborCostFormula [nvarchar](MAX)   = NULL , 
@EquipmentCostFormula [nvarchar](MAX)   = NULL , 
@OutsourceCostFormula [nvarchar](MAX)   = NULL , 
@OtherCostFormula [nvarchar](MAX)   = NULL , 
@IncludeModifierCost bit  = NULL , 
@CostMultiplierType int  = NULL , 
@AccountCodeID int  = NULL , 
@FamilyID int  = NULL , 
@FamilyStoreID int  = NULL , 
@FamilyClassTypeID int  = NULL , 
@UnitPriceVariableID int  = NULL , 
@UnitPriceVariableStoreID int  = NULL , 
@UnitPriceVariableClassTypeID int  = NULL , 
@PreDiscountFx [nvarchar](MAX)   = NULL , 
@BuiltInDiscountFx [nvarchar](MAX)   = NULL , 
@DefaultDiscountFx [nvarchar](MAX)   = NULL , 
@Notes [nvarchar](MAX)   = NULL , 
@FreightFormula [nvarchar](MAX)   = NULL , 
@WarningFx [nvarchar](MAX)   = NULL , 
@ErrorFx [nvarchar](MAX)   = NULL , 
@PreDiscountType int  = NULL , 
@EvaluateOnSaveFormulas [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [PricingPlan] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[PricingPlanTypeID] = @PricingPlanTypeID, 
		[GoodsItemID] = @GoodsItemID, 
		[GoodsItemClassTypeID] = @GoodsItemClassTypeID, 
		[SetUpFormula] = @SetUpFormula, 
		[BaseMinimum] = @BaseMinimum, 
		[OverallMinimum] = @OverallMinimum, 
		[RoundingFactor] = @RoundingFactor, 
		[CommissionPlanID] = @CommissionPlanID, 
		[RoyaltyPlanID] = @RoyaltyPlanID, 
		[ScreenTemplateID] = @ScreenTemplateID, 
		[WebInputTemplateID] = @WebInputTemplateID, 
		[InvoiceTemplateID] = @InvoiceTemplateID, 
		[EstimateTemplateID] = @EstimateTemplateID, 
		[WorkOrderTemplateID] = @WorkOrderTemplateID, 
		[EmployeeWebOutputTemplateID] = @EmployeeWebOutputTemplateID, 
		[CustomerWebOutputTemplateID] = @CustomerWebOutputTemplateID, 
		[QtyDiscountTableID] = @QtyDiscountTableID, 
		[OverallDiscountTableID] = @OverallDiscountTableID, 
		[PerPieceMinimum] = @PerPieceMinimum, 
		[UseCustomPriceMethod] = @UseCustomPriceMethod, 
		[UnitPriceParameterID] = @UnitPriceParameterID, 
		[UnitPriceParameterClassTypeID] = @UnitPriceParameterClassTypeID, 
		[OverheadFormula] = @OverheadFormula, 
		[MaterialCostFormula] = @MaterialCostFormula, 
		[LaborCostFormula] = @LaborCostFormula, 
		[EquipmentCostFormula] = @EquipmentCostFormula, 
		[OutsourceCostFormula] = @OutsourceCostFormula, 
		[OtherCostFormula] = @OtherCostFormula, 
		[IncludeModifierCost] = @IncludeModifierCost, 
		[CostMultiplierType] = @CostMultiplierType, 
		[AccountCodeID] = @AccountCodeID, 
		[FamilyID] = @FamilyID, 
		[FamilyStoreID] = @FamilyStoreID, 
		[FamilyClassTypeID] = @FamilyClassTypeID, 
		[UnitPriceVariableID] = @UnitPriceVariableID, 
		[UnitPriceVariableStoreID] = @UnitPriceVariableStoreID, 
		[UnitPriceVariableClassTypeID] = @UnitPriceVariableClassTypeID, 
		[PreDiscountFx] = @PreDiscountFx, 
		[BuiltInDiscountFx] = @BuiltInDiscountFx, 
		[DefaultDiscountFx] = @DefaultDiscountFx, 
		[Notes] = @Notes, 
		[FreightFormula] = @FreightFormula, 
		[WarningFx] = @WarningFx, 
		[ErrorFx] = @ErrorFx, 
		[PreDiscountType] = @PreDiscountType, 
		[EvaluateOnSaveFormulas] = @EvaluateOnSaveFormulas, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [PricingPlan]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [PricingPlanTypeID], [GoodsItemID], [GoodsItemClassTypeID], [SetUpFormula], [BaseMinimum], [OverallMinimum], [RoundingFactor], [CommissionPlanID], [RoyaltyPlanID], [ScreenTemplateID], [WebInputTemplateID], [InvoiceTemplateID], [EstimateTemplateID], [WorkOrderTemplateID], [EmployeeWebOutputTemplateID], [CustomerWebOutputTemplateID], [QtyDiscountTableID], [OverallDiscountTableID], [PerPieceMinimum], [UseCustomPriceMethod], [UnitPriceParameterID], [UnitPriceParameterClassTypeID], [OverheadFormula], [MaterialCostFormula], [LaborCostFormula], [EquipmentCostFormula], [OutsourceCostFormula], [OtherCostFormula], [IncludeModifierCost], [CostMultiplierType], [AccountCodeID], [FamilyID], [FamilyStoreID], [FamilyClassTypeID], [UnitPriceVariableID], [UnitPriceVariableStoreID], [UnitPriceVariableClassTypeID], [PreDiscountFx], [BuiltInDiscountFx], [DefaultDiscountFx], [Notes], [FreightFormula], [WarningFx], [ErrorFx], [PreDiscountType], [EvaluateOnSaveFormulas], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @PricingPlanTypeID, @GoodsItemID, @GoodsItemClassTypeID, @SetUpFormula, @BaseMinimum, @OverallMinimum, @RoundingFactor, @CommissionPlanID, @RoyaltyPlanID, @ScreenTemplateID, @WebInputTemplateID, @InvoiceTemplateID, @EstimateTemplateID, @WorkOrderTemplateID, @EmployeeWebOutputTemplateID, @CustomerWebOutputTemplateID, @QtyDiscountTableID, @OverallDiscountTableID, @PerPieceMinimum, @UseCustomPriceMethod, @UnitPriceParameterID, @UnitPriceParameterClassTypeID, @OverheadFormula, @MaterialCostFormula, @LaborCostFormula, @EquipmentCostFormula, @OutsourceCostFormula, @OtherCostFormula, @IncludeModifierCost, @CostMultiplierType, @AccountCodeID, @FamilyID, @FamilyStoreID, @FamilyClassTypeID, @UnitPriceVariableID, @UnitPriceVariableStoreID, @UnitPriceVariableClassTypeID, @PreDiscountFx, @BuiltInDiscountFx, @DefaultDiscountFx, @Notes, @FreightFormula, @WarningFx, @ErrorFx, @PreDiscountType, @EvaluateOnSaveFormulas, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
