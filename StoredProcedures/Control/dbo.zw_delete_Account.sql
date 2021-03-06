/****** Object:  StoredProcedure [dbo].[zw_delete_Account]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Account ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@Notes [nvarchar](MAX)   = NULL , 
@CompanyName [nvarchar](40)   = NULL , 
@AccountNumber int  = NULL , 
@ParentID int  = NULL , 
@Department [nvarchar](25)   = NULL , 
@DateCreated datetime  = NULL , 
@DateImported datetime  = NULL , 
@ImportBatch [nvarchar](15)   = NULL , 
@AccountingContactID int  = NULL , 
@PrimaryContactID int  = NULL , 
@BillingAddressID int  = NULL , 
@ShippingAddressID int  = NULL , 
@MainPhoneNumberID int  = NULL , 
@MainFaxNumberID int  = NULL , 
@Flags [nvarchar](MAX)   = NULL , 
@Keywords [nvarchar](MAX)   = NULL , 
@TaxNumber [nvarchar](25)   = NULL , 
@TaxNumberExpDate datetime  = NULL , 
@TaxClassID int  = NULL , 
@WebAddress [nvarchar](50)   = NULL , 
@IsProspect bit  = NULL , 
@TaxExempt bit  = NULL , 
@HasCreditAccount bit  = NULL , 
@CreditApprovalDate datetime  = NULL , 
@CreditLimit [decimal](18,4)  = NULL , 
@CreditBalance [decimal](18,4)  = NULL , 
@DefaultPaymentExpDate datetime  = NULL , 
@DefaultPaymentTrackingNumber [nvarchar](25)   = NULL , 
@DefaultPaymentNameOnCard [nvarchar](25)   = NULL , 
@DefaultPaymentTypeID int  = NULL , 
@PricingPlanTypeID int  = NULL , 
@PaymentTermsID int  = NULL , 
@DiscountLevel float  = NULL , 
@PricingLevel float  = NULL , 
@PONumberRequired bit  = NULL , 
@IndustryID int  = NULL , 
@OriginID int  = NULL , 
@Marketing3ID int  = NULL , 
@SalesPersonID1 int  = NULL , 
@SalesPersonID2 int  = NULL , 
@SalesPersonID3 int  = NULL , 
@TaxExemptExpDate datetime  = NULL , 
@CreditNumber [nvarchar](25)   = NULL , 
@PricingLevelID int  = NULL , 
@PromotionID int  = NULL , 
@UseTaxLookup bit  = NULL , 
@HasServiceContract bit  = NULL , 
@ServiceContractStartDate datetime  = NULL , 
@ServiceContractExpDate datetime  = NULL , 
@ServiceContractTypeID int  = NULL , 
@ServiceContractNotes [nvarchar](MAX)   = NULL , 
@DivisionID int  = NULL , 
@RegionID int  = NULL , 
@PONumber varchar(25)  = NULL , 
@PrimaryNumber varchar(75)  = NULL , 
@PriNumberTypeID int  = NULL , 
@PriNumberTypeText varchar(50)  = NULL , 
@SecondaryNumber varchar(75)  = NULL , 
@SecNumberTypeID int  = NULL , 
@SecNumberTypeText varchar(50)  = NULL , 
@IsClient bit  = NULL , 
@IsVendor bit  = NULL , 
@IsPersonal bit  = NULL , 
@Is1099Vendor bit  = NULL , 
@VendorPaymentTermsID int  = NULL , 
@MyAccountNumber varchar(50)  = NULL , 
@DefaultShipMethodID int  = NULL , 
@ThirdNumber varchar(75)  = NULL , 
@ThirdNumberTypeID int  = NULL , 
@ThirdNumberTypeText varchar(50)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Account] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
