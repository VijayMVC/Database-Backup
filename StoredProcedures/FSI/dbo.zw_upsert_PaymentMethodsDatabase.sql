/****** Object:  StoredProcedure [dbo].[zw_upsert_PaymentMethodsDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_PaymentMethodsDatabase ( 
@PaymentMethodID int  = NULL , 
@PaymentMethod varchar(12)   = NULL , 
@PaymentMethodType int  = NULL , 
@AccountCode int  = NULL , 
@Text varchar(50)   = NULL , 
@ActiveMethod bit  = NULL , 
@ProcessOnline bit  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Payment Methods Database'
 
	 UPDATE [Payment Methods Database] 
	 SET   
		[PaymentMethod] = @PaymentMethod, 
		[PaymentMethodType] = @PaymentMethodType, 
		[AccountCode] = @AccountCode, 
		[Text] = @Text, 
		[ActiveMethod] = @ActiveMethod, 
		[ProcessOnline] = @ProcessOnline, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [PaymentMethodID] = @PaymentMethodID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Payment Methods Database]( [PaymentMethodID], [PaymentMethod], [PaymentMethodType], [AccountCode], [Text], [ActiveMethod], [ProcessOnline], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @PaymentMethodID, @PaymentMethod, @PaymentMethodType, @AccountCode, @Text, @ActiveMethod, @ProcessOnline, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
