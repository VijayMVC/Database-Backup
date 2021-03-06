/****** Object:  StoredProcedure [dbo].[zw_upsert_PaymentGroupsDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_PaymentGroupsDatabase ( 
@PaymentMethodType int  = NULL , 
@StoreID int  = NULL , 
@GroupName varchar(15)   = NULL , 
@DefaultAccountCode int  = NULL , 
@Text varchar(50)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Payment Groups Database'
 
	 UPDATE [Payment Groups Database] 
	 SET   
		[GroupName] = @GroupName, 
		[DefaultAccountCode] = @DefaultAccountCode, 
		[Text] = @Text, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [PaymentMethodType] = @PaymentMethodType
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Payment Groups Database]( [PaymentMethodType], [StoreID], [GroupName], [DefaultAccountCode], [Text], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @PaymentMethodType, @StoreID, @GroupName, @DefaultAccountCode, @Text, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
