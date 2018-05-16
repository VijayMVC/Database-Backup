/****** Object:  StoredProcedure [dbo].[zw_delete_EstimateDatabase]    Script Date: 5/15/2018 12:09:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_EstimateDatabase ( 
@OrderID int  = NULL , 
@StoreID int  = NULL , 
@PricingRatio float  = NULL , 
@Description varchar(100)   = NULL , 
@NumberItems int  = NULL , 
@CustomerID int  = NULL , 
@ContactID int  = NULL , 
@OrdererFirstName varchar(20)   = NULL , 
@OrdererLastName varchar(20)   = NULL , 
@OrdererTitle varchar(30)   = NULL , 
@OrdererPareaCode varchar(25)   = NULL , 
@OrdererPhoneNumber varchar(20)   = NULL , 
@OrdererPhoneExtention varchar(10)   = NULL , 
@OrdererFareaCode varchar(25)   = NULL , 
@OrdererFaxNumber varchar(20)   = NULL , 
@OrdererEmailAddress varchar(75)   = NULL , 
@SalePersonID int  = NULL , 
@EnteredByID int  = NULL , 
@Status varchar(15)   = NULL , 
@OnHold bit  = NULL , 
@EstimateDate datetime  = NULL , 
@OrderDate datetime  = NULL , 
@DueDate datetime  = NULL , 
@DueTime datetime  = NULL , 
@BuiltDate datetime  = NULL , 
@VoidDate datetime  = NULL , 
@PickedUpDate datetime  = NULL , 
@WriteoffDate datetime  = NULL , 
@HoldDate datetime  = NULL , 
@LastInterestDate datetime  = NULL , 
@ClosedDate datetime  = NULL , 
@SignSales float  = NULL , 
@AVISales float  = NULL , 
@InstallSales float  = NULL , 
@ProductionCat1Sales float  = NULL , 
@ProductionCat2Sales float  = NULL , 
@ProductionCat3Sales float  = NULL , 
@ItemsTotal float  = NULL , 
@SalesSubtotal float  = NULL , 
@TaxableAmount float  = NULL , 
@TaxExemptAmount float  = NULL , 
@TaxExemptAmountCalculated float  = NULL , 
@TaxExemptAmountOverridden bit  = NULL , 
@TaxExempt bit  = NULL , 
@TaxIDNumber varchar(20)   = NULL , 
@TaxRegionID int  = NULL , 
@CountySalesTax float  = NULL , 
@CountySalesTaxRate float  = NULL , 
@StateSalesTax float  = NULL , 
@StateSalesTaxRate float  = NULL , 
@TaxTotal float  = NULL , 
@PromotionID int  = NULL , 
@DiscountAmount float  = NULL , 
@DiscountPercent float  = NULL , 
@ShippingCharge float  = NULL , 
@InterestAmount float  = NULL , 
@SalesTotal float  = NULL , 
@TotalPayments float  = NULL , 
@BalanceOutstanding float  = NULL , 
@WriteoffAmount float  = NULL , 
@PurchaseOrderNumber varchar(15)   = NULL , 
@ShippingAddress varchar(MAX)   = NULL , 
@DispositionOnCompletion varchar(9)   = NULL , 
@OrderNotes varchar(MAX)   = NULL , 
@InstallNotes varchar(MAX)   = NULL , 
@EstimateNumber int  = NULL , 
@ItemsDiscountTotal float  = NULL , 
@DiscountTotal float  = NULL , 
@DispositionOnCompletionID int  = NULL , 
@CustomerName varchar(50)   = NULL , 
@ShippingTaxable bit  = NULL , 
@RoyaltyRate float  = NULL , 
@JobBox varchar(18)   = NULL , 
@ProofDate datetime  = NULL , 
@LineItemsOverriden bit  = NULL , 
@OrderOriginID int  = NULL , 
@IsLocked bit  = NULL , 
@LockedDate datetime  = NULL , 
@LockedUser varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@ModifiedUser varchar(25)   = NULL , 
@InvoiceID int  = NULL , 
@EstGreetingIntro varchar(MAX)   = NULL , 
@EstGreetingIntroOV bit  = NULL , 
@EstGreetingBody varchar(MAX)   = NULL , 
@EstGreetingClosing varchar(MAX)   = NULL , 
@EstGreetingClosingOV bit  = NULL , 
@ConvertedDate datetime  = NULL , 
@ConvertedOrderID int  = NULL , 
@LostDate datetime  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Estimate Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [OrderID] = @OrderID
		AND [StoreID] = @StoreID

GO
