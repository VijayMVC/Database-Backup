/****** Object:  StoredProcedure [dbo].[zw_delete_VolumeCategoryDatabase]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_VolumeCategoryDatabase ( 
@VolumeCategoryID int  = NULL , 
@StoreID int  = NULL , 
@VolumeCategoryName varchar(30)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Volume Category Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [VolumeCategoryID] = @VolumeCategoryID
		AND [StoreID] = @StoreID

GO
