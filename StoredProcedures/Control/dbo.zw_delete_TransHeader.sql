/****** Object:  StoredProcedure [dbo].[zw_delete_TransHeader]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_TransHeader ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@TransactionType int  = NULL , 
@EstimateNumber int  = NULL , 
@OrderNumber int  = NULL , 
@OrderTemplateNumber int  = NULL , 
@Version int  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@AccountID int  = NULL , 
@AccountStoreID int  = NULL , 
@ContactID int  = NULL , 
@SalesPerson1ID int  = NULL , 
@SalesPerson2ID int  = NULL , 
@SalesPerson3ID int  = NULL , 
@OrderNotes [nvarchar](MAX)   = NULL , 
@PONumber [nvarchar](25)   = NULL , 
@ProductionNotes [nvarchar](MAX)   = NULL , 
@PricingLevel float  = NULL , 
@PricingLevelOverridden bit  = NULL , 
@DiscountLevel float  = NULL , 
@DiscountLevelOverridden bit  = NULL , 
@EstimateCreatedDate datetime  = NULL , 
@OrderCreatedDate datetime  = NULL , 
@BuiltDate datetime  = NULL , 
@SaleDate datetime  = NULL , 
@ClosedDate datetime  = NULL , 
@VoidedDate datetime  = NULL , 
@ConvertedDate datetime  = NULL , 
@RejectedDate datetime  = NULL , 
@DueDate datetime  = NULL , 
@ProofDate datetime  = NULL , 
@LastFinanceChargeDate datetime  = NULL , 
@DispositionID int  = NULL , 
@SalesDispositionID int  = NULL , 
@EnteredByID int  = NULL , 
@HTMLShortFormat [nvarchar](MAX)   = NULL , 
@HTMLLongFormat [nvarchar](MAX)   = NULL , 
@BasePrice [decimal](18,4)  = NULL , 
@DiscountPrice [decimal](18,4)  = NULL , 
@ModifierPrice [decimal](18,4)  = NULL , 
@RawSubTotalPrice [decimal](18,4)  = NULL , 
@RoundingPrice [decimal](18,4)  = NULL , 
@SubTotalPrice [decimal](18,4)  = NULL , 
@TaxesPrice [decimal](18,4)  = NULL , 
@TotalPrice [decimal](18,4)  = NULL , 
@SonsBasePrice [decimal](18,4)  = NULL , 
@SonsDiscountPrice [decimal](18,4)  = NULL , 
@SonsModifierPrice [decimal](18,4)  = NULL , 
@SonsRawSubTotalPrice [decimal](18,4)  = NULL , 
@SonsRoundingPrice [decimal](18,4)  = NULL , 
@SonsSubTotalPrice [decimal](18,4)  = NULL , 
@SonsTaxesPrice [decimal](18,4)  = NULL , 
@SonsTotalPrice [decimal](18,4)  = NULL , 
@FinanceChargeAmount [decimal](18,4)  = NULL , 
@BalanceDue [decimal](18,4)  = NULL , 
@PaymentTotal [decimal](18,4)  = NULL , 
@WriteOffAmount [decimal](18,4)  = NULL , 
@StatusID int  = NULL , 
@StatusText [nvarchar](50)   = NULL , 
@TaxClassID int  = NULL , 
@TaxClassOverridden bit  = NULL , 
@InvoiceAddressID int  = NULL , 
@InvoiceAddressOverridden bit  = NULL , 
@InvoiceContactID int  = NULL , 
@ShippingAddressID int  = NULL , 
@ShippingAddressOverridden bit  = NULL , 
@ShippingContactID int  = NULL , 
@InvoiceAddressLinkID int  = NULL , 
@ShippingAddressLinkID int  = NULL , 
@EstimateGreeting [nvarchar](MAX)   = NULL , 
@EstimateGreetingTemplate [nvarchar](MAX)   = NULL , 
@IsTaxExempt bit  = NULL , 
@TaxNumber [nvarchar](25)   = NULL , 
@OrderOriginID int  = NULL , 
@OrderOriginName [nvarchar](25)   = NULL , 
@ManuallyReOpened bit  = NULL , 
@CreditMemoAmount float  = NULL , 
@CreditMemoOrderID int  = NULL , 
@NextRefNumber int  = NULL , 
@PricingLevelID int  = NULL , 
@PromotionID int  = NULL , 
@UseTaxLookup bit  = NULL , 
@TaxItems [nvarchar](MAX)   = NULL , 
@InvoiceNumber int  = NULL , 
@ServiceTicketNumber int  = NULL , 
@DivisionID int  = NULL , 
@DivisionIDOverridden bit  = NULL , 
@OrderNotesTemplate [nvarchar](MAX)   = NULL , 
@ProductionNotesTemplate [nvarchar](MAX)   = NULL , 
@IsFirmDueDate bit  = NULL , 
@ShippingCompanyID int  = NULL , 
@ShippingCompanyOV bit  = NULL , 
@ShippingContactOV bit  = NULL , 
@InvoiceCompanyID int  = NULL , 
@InvoiceCompanyOV bit  = NULL , 
@InvoiceContactOV bit  = NULL , 
@UseProgressBilling bit  = NULL , 
@PercentComplete float  = NULL , 
@RecurrenceType int  = NULL , 
@RecurrenceEndDate datetime  = NULL , 
@LastRecurrence datetime  = NULL , 
@ScheduledPaymentPlanID int  = NULL , 
@ScheduledPaymentDate datetime  = NULL , 
@ScheduledPayments int  = NULL , 
@ScheduledPaymentIntervals int  = NULL , 
@UsePaymentPlan bit  = NULL , 
@DroppedDate datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TransHeader] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
