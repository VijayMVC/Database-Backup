/****** Object:  StoredProcedure [dbo].[zw_upsert_SelectionList]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_SelectionList ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ListName [nvarchar](40)   = NULL , 
@CategoryID int  = NULL , 
@Format int  = NULL , 
@DefaultListValue [decimal](18,4)  = NULL , 
@DefaultListCost float  = NULL , 
@DefaultSecondaryListID int  = NULL , 
@DefaultSecondaryListStoreID int  = NULL , 
@DefaultSecondaryListClassTypeID int  = NULL , 
@DefaultPriceFormula [nvarchar](MAX)   = NULL , 
@DefaultCostFormula [nvarchar](MAX)   = NULL , 
@DefaultPartID int  = NULL , 
@DefaultPartStoreID int  = NULL , 
@DefaultPartClassTypeID int  = NULL , 
@DefaultPartConsumptionFx [nvarchar](MAX)   = NULL , 
@DefaultProperties [nvarchar](MAX)   = NULL , 
@DefaultSecondaryListDefault [nvarchar](40)   = NULL , 
@DefaultPart2ID int  = NULL , 
@DefaultPart2StoreID int  = NULL , 
@DefaultPart2ClassTypeID int  = NULL , 
@DefaultPart2ConsumptionFx [nvarchar](MAX)   = NULL , 
@BlankListValue float  = NULL , 
@BlankListCost float  = NULL , 
@BlankSecondaryListID int  = NULL , 
@BlankSecondaryListStoreID int  = NULL , 
@BlankSecondaryListClassTypeID int  = NULL , 
@BlankPriceFormula [nvarchar](MAX)   = NULL , 
@BlankCostFormula [nvarchar](MAX)   = NULL , 
@BlankPartID int  = NULL , 
@BlankPartStoreID int  = NULL , 
@BlankPartClassTypeID int  = NULL , 
@BlankPartConsumptionFx [nvarchar](MAX)   = NULL , 
@BlankProperties [nvarchar](MAX)   = NULL , 
@BlankSecondaryListBlank [nvarchar](40)   = NULL , 
@BlankPart2ID int  = NULL , 
@BlankPart2StoreID int  = NULL , 
@BlankPart2ClassTypeID int  = NULL , 
@BlankPart2ConsumptionFx [nvarchar](MAX)   = NULL , 
@BlankUseDefaultPart bit  = NULL , 
@BlankUseDefaultPart2 bit  = NULL , 
@DefaultPriceFormulaType int  = NULL , 
@DefaultCostFormulaType int  = NULL , 
@BlankPriceFormulaType int  = NULL , 
@BlankCostFormulaType int  = NULL , 
@DefaultItemColor int  = NULL , 
@BlankItemColor int  = NULL , 
@DefaultPartDescription [nvarchar](MAX)   = NULL , 
@DefaultPart2Description [nvarchar](MAX)   = NULL , 
@BlankPartDescription [nvarchar](MAX)   = NULL , 
@BlankPart2Description [nvarchar](MAX)   = NULL , 
@DefaultPartLinksXML [nvarchar](MAX)   = NULL , 
@BlankPartLinksXML [nvarchar](MAX)   = NULL , 
@DefaultDependentLinksXML [nvarchar](MAX)   = NULL , 
@BlankDependentLinksXML [nvarchar](MAX)   = NULL , 
@DefaultFilters [nvarchar](MAX)   = NULL , 
@BlankFilters [nvarchar](MAX)   = NULL , 
@DefaultImageLinks [nvarchar](MAX)   = NULL , 
@BlankImageLinks [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [SelectionList] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[ListName] = @ListName, 
		[CategoryID] = @CategoryID, 
		[Format] = @Format, 
		[DefaultListValue] = @DefaultListValue, 
		[DefaultListCost] = @DefaultListCost, 
		[DefaultSecondaryListID] = @DefaultSecondaryListID, 
		[DefaultSecondaryListStoreID] = @DefaultSecondaryListStoreID, 
		[DefaultSecondaryListClassTypeID] = @DefaultSecondaryListClassTypeID, 
		[DefaultPriceFormula] = @DefaultPriceFormula, 
		[DefaultCostFormula] = @DefaultCostFormula, 
		[DefaultPartID] = @DefaultPartID, 
		[DefaultPartStoreID] = @DefaultPartStoreID, 
		[DefaultPartClassTypeID] = @DefaultPartClassTypeID, 
		[DefaultPartConsumptionFx] = @DefaultPartConsumptionFx, 
		[DefaultProperties] = @DefaultProperties, 
		[DefaultSecondaryListDefault] = @DefaultSecondaryListDefault, 
		[DefaultPart2ID] = @DefaultPart2ID, 
		[DefaultPart2StoreID] = @DefaultPart2StoreID, 
		[DefaultPart2ClassTypeID] = @DefaultPart2ClassTypeID, 
		[DefaultPart2ConsumptionFx] = @DefaultPart2ConsumptionFx, 
		[BlankListValue] = @BlankListValue, 
		[BlankListCost] = @BlankListCost, 
		[BlankSecondaryListID] = @BlankSecondaryListID, 
		[BlankSecondaryListStoreID] = @BlankSecondaryListStoreID, 
		[BlankSecondaryListClassTypeID] = @BlankSecondaryListClassTypeID, 
		[BlankPriceFormula] = @BlankPriceFormula, 
		[BlankCostFormula] = @BlankCostFormula, 
		[BlankPartID] = @BlankPartID, 
		[BlankPartStoreID] = @BlankPartStoreID, 
		[BlankPartClassTypeID] = @BlankPartClassTypeID, 
		[BlankPartConsumptionFx] = @BlankPartConsumptionFx, 
		[BlankProperties] = @BlankProperties, 
		[BlankSecondaryListBlank] = @BlankSecondaryListBlank, 
		[BlankPart2ID] = @BlankPart2ID, 
		[BlankPart2StoreID] = @BlankPart2StoreID, 
		[BlankPart2ClassTypeID] = @BlankPart2ClassTypeID, 
		[BlankPart2ConsumptionFx] = @BlankPart2ConsumptionFx, 
		[BlankUseDefaultPart] = @BlankUseDefaultPart, 
		[BlankUseDefaultPart2] = @BlankUseDefaultPart2, 
		[DefaultPriceFormulaType] = @DefaultPriceFormulaType, 
		[DefaultCostFormulaType] = @DefaultCostFormulaType, 
		[BlankPriceFormulaType] = @BlankPriceFormulaType, 
		[BlankCostFormulaType] = @BlankCostFormulaType, 
		[DefaultItemColor] = @DefaultItemColor, 
		[BlankItemColor] = @BlankItemColor, 
		[DefaultPartDescription] = @DefaultPartDescription, 
		[DefaultPart2Description] = @DefaultPart2Description, 
		[BlankPartDescription] = @BlankPartDescription, 
		[BlankPart2Description] = @BlankPart2Description, 
		[DefaultPartLinksXML] = @DefaultPartLinksXML, 
		[BlankPartLinksXML] = @BlankPartLinksXML, 
		[DefaultDependentLinksXML] = @DefaultDependentLinksXML, 
		[BlankDependentLinksXML] = @BlankDependentLinksXML, 
		[DefaultFilters] = @DefaultFilters, 
		[BlankFilters] = @BlankFilters, 
		[DefaultImageLinks] = @DefaultImageLinks, 
		[BlankImageLinks] = @BlankImageLinks, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [SelectionList]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [ListName], [CategoryID], [Format], [DefaultListValue], [DefaultListCost], [DefaultSecondaryListID], [DefaultSecondaryListStoreID], [DefaultSecondaryListClassTypeID], [DefaultPriceFormula], [DefaultCostFormula], [DefaultPartID], [DefaultPartStoreID], [DefaultPartClassTypeID], [DefaultPartConsumptionFx], [DefaultProperties], [DefaultSecondaryListDefault], [DefaultPart2ID], [DefaultPart2StoreID], [DefaultPart2ClassTypeID], [DefaultPart2ConsumptionFx], [BlankListValue], [BlankListCost], [BlankSecondaryListID], [BlankSecondaryListStoreID], [BlankSecondaryListClassTypeID], [BlankPriceFormula], [BlankCostFormula], [BlankPartID], [BlankPartStoreID], [BlankPartClassTypeID], [BlankPartConsumptionFx], [BlankProperties], [BlankSecondaryListBlank], [BlankPart2ID], [BlankPart2StoreID], [BlankPart2ClassTypeID], [BlankPart2ConsumptionFx], [BlankUseDefaultPart], [BlankUseDefaultPart2], [DefaultPriceFormulaType], [DefaultCostFormulaType], [BlankPriceFormulaType], [BlankCostFormulaType], [DefaultItemColor], [BlankItemColor], [DefaultPartDescription], [DefaultPart2Description], [BlankPartDescription], [BlankPart2Description], [DefaultPartLinksXML], [BlankPartLinksXML], [DefaultDependentLinksXML], [BlankDependentLinksXML], [DefaultFilters], [BlankFilters], [DefaultImageLinks], [BlankImageLinks], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @ListName, @CategoryID, @Format, @DefaultListValue, @DefaultListCost, @DefaultSecondaryListID, @DefaultSecondaryListStoreID, @DefaultSecondaryListClassTypeID, @DefaultPriceFormula, @DefaultCostFormula, @DefaultPartID, @DefaultPartStoreID, @DefaultPartClassTypeID, @DefaultPartConsumptionFx, @DefaultProperties, @DefaultSecondaryListDefault, @DefaultPart2ID, @DefaultPart2StoreID, @DefaultPart2ClassTypeID, @DefaultPart2ConsumptionFx, @BlankListValue, @BlankListCost, @BlankSecondaryListID, @BlankSecondaryListStoreID, @BlankSecondaryListClassTypeID, @BlankPriceFormula, @BlankCostFormula, @BlankPartID, @BlankPartStoreID, @BlankPartClassTypeID, @BlankPartConsumptionFx, @BlankProperties, @BlankSecondaryListBlank, @BlankPart2ID, @BlankPart2StoreID, @BlankPart2ClassTypeID, @BlankPart2ConsumptionFx, @BlankUseDefaultPart, @BlankUseDefaultPart2, @DefaultPriceFormulaType, @DefaultCostFormulaType, @BlankPriceFormulaType, @BlankCostFormulaType, @DefaultItemColor, @BlankItemColor, @DefaultPartDescription, @DefaultPart2Description, @BlankPartDescription, @BlankPart2Description, @DefaultPartLinksXML, @BlankPartLinksXML, @DefaultDependentLinksXML, @BlankDependentLinksXML, @DefaultFilters, @BlankFilters, @DefaultImageLinks, @BlankImageLinks, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
