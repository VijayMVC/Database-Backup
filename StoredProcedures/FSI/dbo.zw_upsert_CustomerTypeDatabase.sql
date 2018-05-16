/****** Object:  StoredProcedure [dbo].[zw_upsert_CustomerTypeDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_CustomerTypeDatabase ( 
@CustomerTypeID int  = NULL , 
@StoreID int  = NULL , 
@CustomerType varchar(25)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Customer Type Database'
 
	 UPDATE [Customer Type Database] 
	 SET   
		[StoreID] = @StoreID, 
		[CustomerType] = @CustomerType, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [CustomerTypeID] = @CustomerTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Customer Type Database]( [CustomerTypeID], [StoreID], [CustomerType], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @CustomerTypeID, @StoreID, @CustomerType, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
