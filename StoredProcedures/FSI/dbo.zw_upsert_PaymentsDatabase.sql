/****** Object:  StoredProcedure [dbo].[zw_upsert_PaymentsDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_PaymentsDatabase ( 
@PaymentID int  = NULL , 
@StoreID int  = NULL , 
@CustomerID int  = NULL , 
@OrderID int  = NULL , 
@PaymentAmount float  = NULL , 
@EnteredByID int  = NULL , 
@PaymentDate datetime  = NULL , 
@PaymentMethod varchar(12)   = NULL , 
@PaymentMethodType int  = NULL , 
@TrackingNumber varchar(20)   = NULL , 
@CreditCardExpDate datetime  = NULL , 
@Voided bit  = NULL , 
@VoidDate datetime  = NULL , 
@VoidAmount float  = NULL , 
@Reason varchar(40)   = NULL , 
@PaymentOnOrder bit  = NULL , 
@Refund bit  = NULL , 
@TakenForStoreID int  = NULL , 
@TakenForOrderID int  = NULL , 
@TakenForCustomerInfo varchar(MAX)   = NULL , 
@IsCCEncrypted bit  = NULL , 
@CCNumber varchar(30)   = NULL , 
@VCode varchar(10)   = NULL , 
@NameOnCard varchar(50)   = NULL , 
@TroutD varchar(25)   = NULL , 
@ProcessID int  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Payments Database'
 
	 UPDATE [Payments Database] 
	 SET   
		[CustomerID] = @CustomerID, 
		[OrderID] = @OrderID, 
		[PaymentAmount] = @PaymentAmount, 
		[EnteredByID] = @EnteredByID, 
		[PaymentDate] = @PaymentDate, 
		[PaymentMethod] = @PaymentMethod, 
		[PaymentMethodType] = @PaymentMethodType, 
		[TrackingNumber] = @TrackingNumber, 
		[CreditCardExpDate] = @CreditCardExpDate, 
		[Voided] = @Voided, 
		[VoidDate] = @VoidDate, 
		[VoidAmount] = @VoidAmount, 
		[Reason] = @Reason, 
		[PaymentOnOrder] = @PaymentOnOrder, 
		[Refund] = @Refund, 
		[TakenForStoreID] = @TakenForStoreID, 
		[TakenForOrderID] = @TakenForOrderID, 
		[TakenForCustomerInfo] = @TakenForCustomerInfo, 
		[IsCCEncrypted] = @IsCCEncrypted, 
		[CCNumber] = @CCNumber, 
		[VCode] = @VCode, 
		[NameOnCard] = @NameOnCard, 
		[TroutD] = @TroutD, 
		[ProcessID] = @ProcessID, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [PaymentID] = @PaymentID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Payments Database]( [PaymentID], [StoreID], [CustomerID], [OrderID], [PaymentAmount], [EnteredByID], [PaymentDate], [PaymentMethod], [PaymentMethodType], [TrackingNumber], [CreditCardExpDate], [Voided], [VoidDate], [VoidAmount], [Reason], [PaymentOnOrder], [Refund], [TakenForStoreID], [TakenForOrderID], [TakenForCustomerInfo], [IsCCEncrypted], [CCNumber], [VCode], [NameOnCard], [TroutD], [ProcessID], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @PaymentID, @StoreID, @CustomerID, @OrderID, @PaymentAmount, @EnteredByID, @PaymentDate, @PaymentMethod, @PaymentMethodType, @TrackingNumber, @CreditCardExpDate, @Voided, @VoidDate, @VoidAmount, @Reason, @PaymentOnOrder, @Refund, @TakenForStoreID, @TakenForOrderID, @TakenForCustomerInfo, @IsCCEncrypted, @CCNumber, @VCode, @NameOnCard, @TroutD, @ProcessID, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
