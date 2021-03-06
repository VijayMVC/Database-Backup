/****** Object:  StoredProcedure [dbo].[zw_upsert_OrderDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_OrderDatabase ( 
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
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Order Database'
 
	 UPDATE [Order Database] 
	 SET   
		[PricingRatio] = @PricingRatio, 
		[Description] = @Description, 
		[NumberItems] = @NumberItems, 
		[CustomerID] = @CustomerID, 
		[ContactID] = @ContactID, 
		[OrdererFirstName] = @OrdererFirstName, 
		[OrdererLastName] = @OrdererLastName, 
		[OrdererTitle] = @OrdererTitle, 
		[OrdererPareaCode] = @OrdererPareaCode, 
		[OrdererPhoneNumber] = @OrdererPhoneNumber, 
		[OrdererPhoneExtention] = @OrdererPhoneExtention, 
		[OrdererFareaCode] = @OrdererFareaCode, 
		[OrdererFaxNumber] = @OrdererFaxNumber, 
		[OrdererEmailAddress] = @OrdererEmailAddress, 
		[SalePersonID] = @SalePersonID, 
		[EnteredByID] = @EnteredByID, 
		[Status] = @Status, 
		[OnHold] = @OnHold, 
		[EstimateDate] = @EstimateDate, 
		[OrderDate] = @OrderDate, 
		[DueDate] = @DueDate, 
		[DueTime] = @DueTime, 
		[BuiltDate] = @BuiltDate, 
		[VoidDate] = @VoidDate, 
		[PickedUpDate] = @PickedUpDate, 
		[WriteoffDate] = @WriteoffDate, 
		[HoldDate] = @HoldDate, 
		[LastInterestDate] = @LastInterestDate, 
		[ClosedDate] = @ClosedDate, 
		[SignSales] = @SignSales, 
		[AVISales] = @AVISales, 
		[InstallSales] = @InstallSales, 
		[ProductionCat1Sales] = @ProductionCat1Sales, 
		[ProductionCat2Sales] = @ProductionCat2Sales, 
		[ProductionCat3Sales] = @ProductionCat3Sales, 
		[ItemsTotal] = @ItemsTotal, 
		[SalesSubtotal] = @SalesSubtotal, 
		[TaxableAmount] = @TaxableAmount, 
		[TaxExemptAmount] = @TaxExemptAmount, 
		[TaxExemptAmountCalculated] = @TaxExemptAmountCalculated, 
		[TaxExemptAmountOverridden] = @TaxExemptAmountOverridden, 
		[TaxExempt] = @TaxExempt, 
		[TaxIDNumber] = @TaxIDNumber, 
		[TaxRegionID] = @TaxRegionID, 
		[CountySalesTax] = @CountySalesTax, 
		[CountySalesTaxRate] = @CountySalesTaxRate, 
		[StateSalesTax] = @StateSalesTax, 
		[StateSalesTaxRate] = @StateSalesTaxRate, 
		[TaxTotal] = @TaxTotal, 
		[PromotionID] = @PromotionID, 
		[DiscountAmount] = @DiscountAmount, 
		[DiscountPercent] = @DiscountPercent, 
		[ShippingCharge] = @ShippingCharge, 
		[InterestAmount] = @InterestAmount, 
		[SalesTotal] = @SalesTotal, 
		[TotalPayments] = @TotalPayments, 
		[BalanceOutstanding] = @BalanceOutstanding, 
		[WriteoffAmount] = @WriteoffAmount, 
		[PurchaseOrderNumber] = @PurchaseOrderNumber, 
		[ShippingAddress] = @ShippingAddress, 
		[DispositionOnCompletion] = @DispositionOnCompletion, 
		[OrderNotes] = @OrderNotes, 
		[InstallNotes] = @InstallNotes, 
		[EstimateNumber] = @EstimateNumber, 
		[ItemsDiscountTotal] = @ItemsDiscountTotal, 
		[DiscountTotal] = @DiscountTotal, 
		[DispositionOnCompletionID] = @DispositionOnCompletionID, 
		[CustomerName] = @CustomerName, 
		[ShippingTaxable] = @ShippingTaxable, 
		[RoyaltyRate] = @RoyaltyRate, 
		[JobBox] = @JobBox, 
		[ProofDate] = @ProofDate, 
		[LineItemsOverriden] = @LineItemsOverriden, 
		[OrderOriginID] = @OrderOriginID, 
		[IsLocked] = @IsLocked, 
		[LockedDate] = @LockedDate, 
		[LockedUser] = @LockedUser, 
		[ModifiedDate] = @ModifiedDate, 
		[ModifiedUser] = @ModifiedUser, 
		[InvoiceID] = @InvoiceID, 
		[EstGreetingIntro] = @EstGreetingIntro, 
		[EstGreetingIntroOV] = @EstGreetingIntroOV, 
		[EstGreetingBody] = @EstGreetingBody, 
		[EstGreetingClosing] = @EstGreetingClosing, 
		[EstGreetingClosingOV] = @EstGreetingClosingOV, 
		[ConvertedDate] = @ConvertedDate, 
		[ConvertedOrderID] = @ConvertedOrderID, 
		[LostDate] = @LostDate, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [OrderID] = @OrderID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Order Database]( [OrderID], [StoreID], [PricingRatio], [Description], [NumberItems], [CustomerID], [ContactID], [OrdererFirstName], [OrdererLastName], [OrdererTitle], [OrdererPareaCode], [OrdererPhoneNumber], [OrdererPhoneExtention], [OrdererFareaCode], [OrdererFaxNumber], [OrdererEmailAddress], [SalePersonID], [EnteredByID], [Status], [OnHold], [EstimateDate], [OrderDate], [DueDate], [DueTime], [BuiltDate], [VoidDate], [PickedUpDate], [WriteoffDate], [HoldDate], [LastInterestDate], [ClosedDate], [SignSales], [AVISales], [InstallSales], [ProductionCat1Sales], [ProductionCat2Sales], [ProductionCat3Sales], [ItemsTotal], [SalesSubtotal], [TaxableAmount], [TaxExemptAmount], [TaxExemptAmountCalculated], [TaxExemptAmountOverridden], [TaxExempt], [TaxIDNumber], [TaxRegionID], [CountySalesTax], [CountySalesTaxRate], [StateSalesTax], [StateSalesTaxRate], [TaxTotal], [PromotionID], [DiscountAmount], [DiscountPercent], [ShippingCharge], [InterestAmount], [SalesTotal], [TotalPayments], [BalanceOutstanding], [WriteoffAmount], [PurchaseOrderNumber], [ShippingAddress], [DispositionOnCompletion], [OrderNotes], [InstallNotes], [EstimateNumber], [ItemsDiscountTotal], [DiscountTotal], [DispositionOnCompletionID], [CustomerName], [ShippingTaxable], [RoyaltyRate], [JobBox], [ProofDate], [LineItemsOverriden], [OrderOriginID], [IsLocked], [LockedDate], [LockedUser], [ModifiedDate], [ModifiedUser], [InvoiceID], [EstGreetingIntro], [EstGreetingIntroOV], [EstGreetingBody], [EstGreetingClosing], [EstGreetingClosingOV], [ConvertedDate], [ConvertedOrderID], [LostDate], [ModifiedByComputer], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @OrderID, @StoreID, @PricingRatio, @Description, @NumberItems, @CustomerID, @ContactID, @OrdererFirstName, @OrdererLastName, @OrdererTitle, @OrdererPareaCode, @OrdererPhoneNumber, @OrdererPhoneExtention, @OrdererFareaCode, @OrdererFaxNumber, @OrdererEmailAddress, @SalePersonID, @EnteredByID, @Status, @OnHold, @EstimateDate, @OrderDate, @DueDate, @DueTime, @BuiltDate, @VoidDate, @PickedUpDate, @WriteoffDate, @HoldDate, @LastInterestDate, @ClosedDate, @SignSales, @AVISales, @InstallSales, @ProductionCat1Sales, @ProductionCat2Sales, @ProductionCat3Sales, @ItemsTotal, @SalesSubtotal, @TaxableAmount, @TaxExemptAmount, @TaxExemptAmountCalculated, @TaxExemptAmountOverridden, @TaxExempt, @TaxIDNumber, @TaxRegionID, @CountySalesTax, @CountySalesTaxRate, @StateSalesTax, @StateSalesTaxRate, @TaxTotal, @PromotionID, @DiscountAmount, @DiscountPercent, @ShippingCharge, @InterestAmount, @SalesTotal, @TotalPayments, @BalanceOutstanding, @WriteoffAmount, @PurchaseOrderNumber, @ShippingAddress, @DispositionOnCompletion, @OrderNotes, @InstallNotes, @EstimateNumber, @ItemsDiscountTotal, @DiscountTotal, @DispositionOnCompletionID, @CustomerName, @ShippingTaxable, @RoyaltyRate, @JobBox, @ProofDate, @LineItemsOverriden, @OrderOriginID, @IsLocked, @LockedDate, @LockedUser, @ModifiedDate, @ModifiedUser, @InvoiceID, @EstGreetingIntro, @EstGreetingIntroOV, @EstGreetingBody, @EstGreetingClosing, @EstGreetingClosingOV, @ConvertedDate, @ConvertedOrderID, @LostDate, @ModifiedByComputer, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
