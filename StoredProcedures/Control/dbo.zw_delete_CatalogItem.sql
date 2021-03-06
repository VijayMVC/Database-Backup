/****** Object:  StoredProcedure [dbo].[zw_delete_CatalogItem]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_delete_CatalogItem] ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@PartID int  = NULL , 
@VendorID int  = NULL , 
@BarCode varchar(50)  = NULL , 
@Cost float  = NULL , 
@PackageSize float  = NULL , 
@PackageUnitID int  = NULL , 
@UnitCost float  = NULL , 
@VendorPartName varchar(50)  = NULL , 
@PartNumber varchar(50)  = NULL , 
@VendorPriority int  = NULL , 
@Flags [nvarchar](MAX)   = NULL , 
@BillingNotes [nvarchar](MAX)   = NULL , 
@ProductionNotes [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [CatalogItem] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID


GO
