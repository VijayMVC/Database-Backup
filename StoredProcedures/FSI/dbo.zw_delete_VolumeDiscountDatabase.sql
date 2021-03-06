/****** Object:  StoredProcedure [dbo].[zw_delete_VolumeDiscountDatabase]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_VolumeDiscountDatabase ( 
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
 
	 UPDATE [Volume Discount Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [VolumeCategoryID] = @VolumeCategoryID
		AND [Quantity] = @Quantity
		AND [StoreID] = @StoreID

GO
