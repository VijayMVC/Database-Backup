/****** Object:  StoredProcedure [dbo].[zw_upsert_VolumeCategoryDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_VolumeCategoryDatabase ( 
@VolumeCategoryID int  = NULL , 
@StoreID int  = NULL , 
@VolumeCategoryName varchar(30)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Volume Category Database'
 
	 UPDATE [Volume Category Database] 
	 SET   
		[VolumeCategoryName] = @VolumeCategoryName, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [VolumeCategoryID] = @VolumeCategoryID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Volume Category Database]( [VolumeCategoryID], [StoreID], [VolumeCategoryName], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @VolumeCategoryID, @StoreID, @VolumeCategoryName, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
