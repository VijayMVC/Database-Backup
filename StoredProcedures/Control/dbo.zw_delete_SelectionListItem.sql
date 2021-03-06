/****** Object:  StoredProcedure [dbo].[zw_delete_SelectionListItem]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_SelectionListItem ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@SelectionListID int  = NULL , 
@ItemText [nvarchar](40)   = NULL , 
@ListValue [decimal](18,4)  = NULL , 
@CostValue float  = NULL , 
@SortIndex int  = NULL , 
@SecondaryListID int  = NULL , 
@SecondaryListStoreID int  = NULL , 
@SecondaryListClassTypeID int  = NULL , 
@PriceFormula [nvarchar](MAX)   = NULL , 
@CostFormula [nvarchar](MAX)   = NULL , 
@PartID int  = NULL , 
@PartStoreID int  = NULL , 
@PartClassTypeID int  = NULL , 
@PartConsumptionFx [nvarchar](MAX)   = NULL , 
@UseDefaultPart bit  = NULL , 
@ItemProperties [nvarchar](MAX)   = NULL , 
@SecondaryListDefault [nvarchar](40)   = NULL , 
@Part2ID int  = NULL , 
@Part2StoreID int  = NULL , 
@Part2ClassTypeID int  = NULL , 
@Part2ConsumptionFx [nvarchar](MAX)   = NULL , 
@UseDefaultPart2 bit  = NULL , 
@PriceFormulaType int  = NULL , 
@CostFormulaType int  = NULL , 
@ItemColor int  = NULL , 
@PartDescription [nvarchar](MAX)   = NULL , 
@Part2Description [nvarchar](MAX)   = NULL , 
@PartLinksXML [nvarchar](MAX)   = NULL , 
@DependentLinksXML [nvarchar](MAX)   = NULL , 
@ItemFilters [nvarchar](MAX)   = NULL , 
@ItemImageLinks [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [SelectionListItem] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
