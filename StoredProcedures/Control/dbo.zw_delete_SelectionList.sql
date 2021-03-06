/****** Object:  StoredProcedure [dbo].[zw_delete_SelectionList]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_SelectionList ( 
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
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
