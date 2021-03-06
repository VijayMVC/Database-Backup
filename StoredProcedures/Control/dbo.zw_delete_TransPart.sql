/****** Object:  StoredProcedure [dbo].[zw_delete_TransPart]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_TransPart ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@TransHeaderID int  = NULL , 
@TransHeaderClassTypeID int  = NULL , 
@ParentID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@PartID int  = NULL , 
@PartClassTypeID int  = NULL , 
@PartCode [nvarchar](25)   = NULL , 
@GoodsItemID int  = NULL , 
@GoodsItemClassTypeID int  = NULL , 
@GoodsItemCode [nvarchar](35)   = NULL , 
@Include bit  = NULL , 
@IncludeCalculated bit  = NULL , 
@IncludeOverridden bit  = NULL , 
@CalculatedValue float  = NULL , 
@EstimatedValue float  = NULL , 
@EstimatedOverridden bit  = NULL , 
@ActualValue float  = NULL , 
@ActualOverridden bit  = NULL , 
@SortOrder int  = NULL , 
@UnitID int  = NULL , 
@UnitsText [nvarchar](25)   = NULL , 
@LineItemNumber [nvarchar](15)   = NULL , 
@InternalNotes [nvarchar](MAX)   = NULL , 
@PartLinkID int  = NULL , 
@PartLinkClassTypeID int  = NULL , 
@IsAutomatic bit  = NULL , 
@ReferenceNumber int  = NULL , 
@CalculatedCost float  = NULL , 
@EstimatedCost float  = NULL , 
@EstimatedCostOverridden bit  = NULL , 
@ActualCost float  = NULL , 
@ActualCostOverridden bit  = NULL , 
@TransDetailID int  = NULL , 
@TransModID int  = NULL , 
@ParameterID int  = NULL , 
@ParameterStoreID int  = NULL , 
@ParameterClassTypeID int  = NULL , 
@CostMultiplier [nvarchar](MAX)   = NULL , 
@CostMultiplierType int  = NULL , 
@TransDetailClassTypeID int  = NULL , 
@TransModClassTypeID int  = NULL , 
@IsPart2 bit  = NULL , 
@FixedCostMultiplier [nvarchar](MAX)   = NULL , 
@Vendor varchar(40)  = NULL , 
@VendorPartNumber varchar(40)  = NULL , 
@ActualPrice float  = NULL , 
@PartIndex float  = NULL , 
@VariableID int  = NULL , 
@VariableStoreID int  = NULL , 
@VariableClassTypeID int  = NULL , 
@EstimatedPrice float  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TransPart] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
