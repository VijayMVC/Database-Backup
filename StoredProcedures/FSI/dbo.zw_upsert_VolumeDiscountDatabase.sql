/****** Object:  StoredProcedure [dbo].[zw_upsert_VolumeDiscountDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_VolumeDiscountDatabase ( 
@VolumeCategoryID int  = NULL , 
@Quantity int  = NULL , 
@StoreID int  = NULL , 
@Discount float  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Volume Discount Database'
 
	 UPDATE [Volume Discount Database] 
	 SET   
		[Discount] = @Discount, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [VolumeCategoryID] = @VolumeCategoryID
		AND [Quantity] = @Quantity
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Volume Discount Database]( [VolumeCategoryID], [Quantity], [StoreID], [Discount], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @VolumeCategoryID, @Quantity, @StoreID, @Discount, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
