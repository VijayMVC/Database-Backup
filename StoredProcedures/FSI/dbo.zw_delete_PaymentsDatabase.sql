/****** Object:  StoredProcedure [dbo].[zw_delete_PaymentsDatabase]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_PaymentsDatabase ( 
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
 
	 UPDATE [Payments Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [PaymentID] = @PaymentID
		AND [StoreID] = @StoreID

GO
