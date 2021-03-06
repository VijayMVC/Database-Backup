/****** Object:  StoredProcedure [dbo].[usp_CreateRecordsForL360]    Script Date: 5/15/2018 12:09:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 6/2/16
-- Description:	Adds Records to Corebridge Data from Excel
-- =============================================
CREATE PROCEDURE usp_CreateRecordsForL360
    @CustomerName VARCHAR(40) = 'Evans Halshaw' ,
    @InvoiceNumber VARCHAR(20) = '2127-1012' ,
    @OrderDescription VARCHAR(100) = 'Window Graphics' ,
    @OrderContact VARCHAR(20) = 'Martin Phillips' ,
    @PhoneNumber VARCHAR(20) = '(012) 957-5930' ,
    @Email VARCHAR(100) = 'martin.phillips@evanshalshaw.com' ,
    @CompletedDate DATETIME = '4/29/16 11:00' ,
    @Amount MONEY = 339.09 ,
    @CompanyLocation VARCHAR(8) = '9204501' ,
    @CompanyName VARCHAR(50) = 'FASTSIGNS Banbury #9204501'
AS
    BEGIN
            SET NOCOUNT ON
	    DECLARE
            @LName VARCHAR(50) ,
            @FName VARCHAR(50) 
        SELECT
            @FName = CASE WHEN NOT ( @OrderContact = '' )
                          THEN SUBSTRING(ISNULL(@OrderContact, ''), 1,
                                         CHARINDEX(' ',
                                                   ISNULL(@OrderContact, ''))
                                         - 1)
                          ELSE 'First'
                     END ,
            @LName = CASE WHEN NOT ( @OrderContact = '' )
                          THEN SUBSTRING(ISNULL(@OrderContact, ''),
                                         CHARINDEX(' ',
                                                   ISNULL(@OrderContact, ''))
                                         + 1, LEN(ISNULL(@OrderContact, '')))
                          ELSE 'Last'
                     END 
        DECLARE @MAXAccountId INT
        SELECT
            @MAXAccountId = AccountConsolidated.AccountId
        FROM
            AccountConsolidated
        WHERE
            AccountConsolidated.CompanyLocationId = @CompanyLocation
            AND AccountConsolidated.CompanyName = @CustomerName

        IF @MAXAccountId IS NULL
            BEGIN
                SELECT
                    @MAXAccountId = MAX(AccountConsolidated.AccountId)
                FROM
                    AccountConsolidated
                WHERE
                    AccountConsolidated.CompanyLocationId = @CompanyLocation
                GROUP BY
                    AccountConsolidated.CompanyLocationId
                SET @MAXAccountId = @MAXAccountId + 1
                INSERT  AccountConsolidated
                        ( CompanyLocationId ,
                          FranchiseName ,
                          AccountId ,
                          LocationId ,
                          CompanyName ,
                          AccountNumber ,
                          PrimaryAccountContactId ,
                          BillingContactId ,
                          PrimaryPhoneNumber ,
                          PrimaryPhoneNumberTypeText ,
                          SecondaryPhoneNumber ,
                          SecondaryPhoneNumberTypeText ,
                          TertiaryPhoneNumber ,
                          TertiaryPhoneNumberTypeText ,
                          IndustryType ,
                          FirstOrderDate ,
                          LastOrderDate ,
                          LastSaleAmount ,
                          IsUpdate ,
                          OLTP_InsertDate ,
                          OLTP_UpdateDate ,
                          UpdateCheckSum ,
                          FIICustomerID ,
                          FIIPrimaryContactID ,
                          FIIBillingContactID
		                )
                VALUES
                        ( @CompanyLocation , -- CompanyLocationId - char(8)
                          @CompanyName , -- FranchiseName - varchar(64)
                          @MAXAccountId , -- AccountId - int
                          0 , -- LocationId - int
                          @CustomerName , -- CompanyName - varchar(50)
                          '' , -- AccountNumber - varchar(50)
                          0 , -- PrimaryAccountContactId - int
                          0 , -- BillingContactId - int
                          @PhoneNumber , -- PrimaryPhoneNumber - varchar(25)
                          'Office' , -- PrimaryPhoneNumberTypeText - varchar(25)
                          '' , -- SecondaryPhoneNumber - varchar(25)
                          '' , -- SecondaryPhoneNumberTypeText - varchar(25)
                          '' , -- TertiaryPhoneNumber - varchar(25)
                          '' , -- TertiaryPhoneNumberTypeText - varchar(25)
                          '' , -- IndustryType - varchar(50)
                          @CompletedDate , -- FirstOrderDate - datetimeoffset
                          @CompletedDate , -- LastOrderDate - datetimeoffset
                          @Amount , -- LastSaleAmount - decimal
                          0 , -- IsUpdate - int
                          GETDATE() , -- OLTP_InsertDate - datetime
                          NULL , -- OLTP_UpdateDate - datetime
                          0 , -- UpdateCheckSum - int
                          0 , -- FIICustomerID - int
                          0 , -- FIIPrimaryContactID - int
                          0  -- FIIBillingContactID - int
		                )
            END 

        DECLARE @MaxContactID INT
        SELECT
            @MAXAccountId = ContactConsolidated.ContactId
        FROM
            ContactConsolidated
        WHERE
            CompanyLocationId = @CompanyLocation
            AND FirstName = @FName
            AND LastName = @LName

        IF @MaxContactID IS NULL
            BEGIN
                SELECT
                    @MaxContactID = MAX(ContactId)
                FROM
                    ContactConsolidated
                WHERE
                    CompanyLocationId = @CompanyLocation
                GROUP BY
                    CompanyLocationId
                SET @MaxContactID = @MaxContactID + 1
                INSERT  ContactConsolidated
                        ( CompanyLocationId ,
                          FranchiseName ,
                          ContactId ,
                          AccountId ,
                          FirstName ,
                          MiddleName ,
                          LastName ,
                          Title ,
                          Position ,
                          EmailAddress ,
                          PrimaryPhoneNumber ,
                          PrimaryPhoneNumberExtension ,
                          PrimaryPhoneNumberType ,
                          SecondaryPhoneNumber ,
                          SecondaryPhoneNumberType ,
                          TertiaryPhoneNumber ,
                          TertiaryPhoneNumberType ,
                          IsUpdate ,
                          OLTP_InsertDate ,
                          OLTP_UpdateDate ,
                          UpdateCheckSum ,
                          FIIContactID ,
                          FIICustomerID ,
                          ContactStatus
				        )
                VALUES
                        ( @CompanyLocation , -- CompanyLocationId - char(8)
                          @CompanyName , -- FranchiseName - varchar(64)
                          @MaxContactID , -- ContactId - int
                          @MAXAccountId , -- AccountId - int
                          @FName , -- FirstName - varchar(50)
                          '' , -- MiddleName - varchar(50)
                          @LName , -- LastName - varchar(50)
                          '' , -- Title - varchar(50)
                          '' , -- Position - varchar(50)
                          @Email , -- EmailAddress - varchar(100)
                          @PhoneNumber , -- PrimaryPhoneNumber - varchar(25)
                          '' , -- PrimaryPhoneNumberExtension - varchar(25)
                          'Office' , -- PrimaryPhoneNumberType - varchar(25)
                          '' , -- SecondaryPhoneNumber - varchar(25)
                          '' , -- SecondaryPhoneNumberType - varchar(25)
                          '' , -- TertiaryPhoneNumber - varchar(25)
                          '' , -- TertiaryPhoneNumberType - varchar(25)
                          0 , -- IsUpdate - int
                          GETDATE() , -- OLTP_InsertDate - datetime
                          NULL , -- OLTP_UpdateDate - datetime
                          0 , -- UpdateCheckSum - int
                          0 , -- FIIContactID - int
                          0 , -- FIICustomerID - int
                          ''  -- ContactStatus - varchar(127)
				        )
            END     
	
        DECLARE @CorebridgeOrder INT
        SET @CorebridgeOrder = REPLACE(REPLACE(REPLACE(REPLACE(dbo.CorebridgeOrderFromInvoice(@InvoiceNumber),'-V',''),'WP-',''),'PG-',''),'I-','')

		INSERT OrderConsolidated
		        ( CompanyLocationId ,
		          FranchiseName ,
		          OrderId ,
		          LocationId ,
		          ProductionFacilityId ,
		          AccountId ,
		          ShippingContactId ,
		          InvoiceContactId ,
		          OrderContactId ,
		          ShippingAddressId ,
		          InvoiceAddressId ,
		          IsUpdate ,
		          OLTP_InsertDate ,
		          OLTP_UpdateDate ,
		          UpdateCheckSum
		        )
		VALUES
		        ( @CompanyLocation , -- CompanyLocationId - char(8)
		          @CompanyName , -- FranchiseName - varchar(64)
		          @CorebridgeOrder , -- OrderId - int
		          0 , -- LocationId - int
		          0 , -- ProductionFacilityId - int
		          @MAXAccountId , -- AccountId - int
		          0 , -- ShippingContactId - int
		          @MaxContactID , -- InvoiceContactId - int
		          @MaxContactID , -- OrderContactId - int
		          0 , -- ShippingAddressId - int
		          0 , -- InvoiceAddressId - int
		          0 , -- IsUpdate - int
		          GETDATE() , -- OLTP_InsertDate - datetime
		          null , -- OLTP_UpdateDate - datetime
		          0  -- UpdateCheckSum - int
		        )

		INSERT SalesResultsAllDispositions
		        ( CompanyLocationId ,
		          FranchiseName ,
		          IncomeTypeId ,
		          IncomeTypeDescription ,
		          IncomeTypeText ,
		          SortAccount ,
		          LocationId ,
		          LocationName ,
		          InvoiceNumber ,
		          OrderActive ,
		          OrderStatusId ,
		          OrderCompletionDate ,
		          OrderClosedDate ,
		          OrderBuiltDate ,
		          OrderCreatedDate ,
		          CategoryId ,
		          ProductCategory ,
		          CompanyName ,
		          IndustryType ,
		          CustomerType ,
		          SalesPersonName ,
		          GLAcctId ,
		          GL_Account ,
		          CostOfGoodsSold ,
		          AdditionalCosts ,
		          Amount ,
		          SubTotalPrice ,
		          DiscountPrice ,
		          TaxesPrice ,
		          ShippingAmount ,
		          PostageAmount ,
		          TaxableAmount ,
		          NonTaxableAmount ,
		          Id ,
		          OrderId ,
		          OrderProductId ,
		          OrderProductPartId ,
		          OrderProductLineItem ,
		          MaxProductLineItem ,
		          IsVended ,
		          OrderContactName ,
		          BillingAddress1 ,
		          BillingAddress2 ,
		          BillingAddress3 ,
		          BillingCity ,
		          BillingState ,
		          BillingCounty ,
		          BillingZip ,
		          BillngZipExtended ,
		          ShippingAddress1 ,
		          ShippingAddress2 ,
		          ShippingAddress3 ,
		          ShippingCity ,
		          ShippingState ,
		          ShippingCounty ,
		          ShippingZip ,
		          ShippingZipExtended ,
		          OLTP_InsertDate ,
		          OLTP_UpdateDate ,
		          UpdateCheckSum ,
		          BalanceDue ,
		          Currency
		        )
		VALUES
		        ( @CompanyLocation , -- CompanyLocationId - char(8)
		          @CompanyName , -- FranchiseName - varchar(64)
		          0 , -- IncomeTypeId - int
		          'PART' , -- IncomeTypeDescription - varchar(50)
		          'Parts' , -- IncomeTypeText - varchar(100)
		          'In-House Sales' , -- SortAccount - varchar(100)
		          0 , -- LocationId - int
		          '' , -- LocationName - varchar(50)
		          @InvoiceNumber , -- InvoiceNumber - varchar(50)
		          1 , -- OrderActive - bit
		          1 , -- OrderStatusId - int
		          @CompletedDate , -- OrderCompletionDate - datetime
		          null , -- OrderClosedDate - datetime
		          @CompletedDate , -- OrderBuiltDate - datetime
		          @CompletedDate , -- OrderCreatedDate - datetime
		          0 , -- CategoryId - int
		          '' , -- ProductCategory - varchar(127)
		          '' , -- CompanyName - varchar(50)
		          'Unknown' , -- IndustryType - varchar(50)
		          '' , -- CustomerType - varchar(50)
		          '' , -- SalesPersonName - varchar(500)
		          23 , -- GLAcctId - int
		          '4110 In-House Sales' , -- GL_Account - varchar(50)
		          NULL , -- CostOfGoodsSold - decimal
		          NULL , -- AdditionalCosts - decimal
		          @Amount , -- Amount - decimal
		          NULL , -- SubTotalPrice - decimal
		          NULL , -- DiscountPrice - decimal
		          NULL , -- TaxesPrice - decimal
		          NULL , -- ShippingAmount - decimal
		          NULL , -- PostageAmount - decimal
		          NULL , -- TaxableAmount - decimal
		          NULL , -- NonTaxableAmount - decimal
		          @CorebridgeOrder , -- Id - int
		          @CorebridgeOrder , -- OrderId - int
		          0 , -- OrderProductId - int
		          0 , -- OrderProductPartId - int
		          0 , -- OrderProductLineItem - int
		          0 , -- MaxProductLineItem - int
		          NULL , -- IsVended - bit
		          @OrderContact , -- OrderContactName - varchar(127)
		          '' , -- BillingAddress1 - varchar(50)
		          '' , -- BillingAddress2 - varchar(50)
		          '' , -- BillingAddress3 - varchar(50)
		          '' , -- BillingCity - varchar(50)
		          '' , -- BillingState - varchar(50)
		          '' , -- BillingCounty - varchar(50)
		          '' , -- BillingZip - varchar(50)
		          '' , -- BillngZipExtended - varchar(10)
		          '' , -- ShippingAddress1 - varchar(50)
		          '' , -- ShippingAddress2 - varchar(50)
		          '' , -- ShippingAddress3 - varchar(50)
		          '' , -- ShippingCity - varchar(50)
		          '' , -- ShippingState - varchar(50)
		          '' , -- ShippingCounty - varchar(50)
		          '' , -- ShippingZip - varchar(50)
		          '' , -- ShippingZipExtended - varchar(10)
		          GETDATE() , -- OLTP_InsertDate - datetime
		          null , -- OLTP_UpdateDate - datetime
		          0 , -- UpdateCheckSum - int
		          NULL , -- BalanceDue - money
		          'POUND'  -- Currency - varchar(10)
		        )

				INSERT SalesResultsDetails
				        ( CompanyLocationId ,
				          FranchiseName ,
				          LocationId ,
				          LocationName ,
				          OrderId ,
				          OrderActive ,
				          OrderStatusId ,
				          InvoiceNumber ,
				          OrderCompletionDate ,
				          OrderClosedDate ,
				          OrderBuiltDate ,
				          OrderCreatedDate ,
				          AccountId ,
				          CompanyName ,
				          IndustryType ,
				          CustomerType ,
				          ReferredByTypeId ,
				          CustomerOrigin ,
				          SalesPersonId ,
				          SalesPersonName ,
				          EnteredByUserId ,
				          CostOfGoodsSold ,
				          AdditionalCosts ,
				          Amount ,
				          NewSubtotal ,
				          ShippingAmount ,
				          PostageAmount ,
				          TaxesPrice ,
				          MasterAccountId ,
				          MasterAccountName ,
				          MasterAccountSortName ,
				          OrderContactName ,
				          BillingAddress1 ,
				          BillingAddress2 ,
				          BillingAddress3 ,
				          BillingCity ,
				          BillingState ,
				          BillingCounty ,
				          BillingZip ,
				          BillngZipExtended ,
				          ShippingAddress1 ,
				          ShippingAddress2 ,
				          ShippingAddress3 ,
				          ShippingCity ,
				          ShippingState ,
				          ShippingCounty ,
				          ShippingZip ,
				          ShippingZipExtended ,
				          OLTP_InsertDate ,
				          OLTP_UpdateDate ,
				          UpdateCheckSum
				        )
				VALUES
				        ( @CompanyLocation , -- CompanyLocationId - char(8)
				          @CompanyName , -- FranchiseName - varchar(64)
				          0 , -- LocationId - int
				          '' , -- LocationName - varchar(50)
				          @CorebridgeOrder , -- OrderId - int
				          1 , -- OrderActive - int
				          1 , -- OrderStatusId - int
				          @InvoiceNumber , -- InvoiceNumber - varchar(50)
				          @CompletedDate , -- OrderCompletionDate - datetime
				          null , -- OrderClosedDate - datetime
				          @CompletedDate , -- OrderBuiltDate - datetime
				          @CompletedDate , -- OrderCreatedDate - datetime
				          @MAXAccountId , -- AccountId - int
				          @CustomerName , -- CompanyName - varchar(50)
				          'Unknown' , -- IndustryType - varchar(100)
				          '' , -- CustomerType - varchar(100)
				          0 , -- ReferredByTypeId - int
				          '' , -- CustomerOrigin - varchar(50)
				          0 , -- SalesPersonId - int
				          '' , -- SalesPersonName - varchar(500)
				          0 , -- EnteredByUserId - int
				          NULL , -- CostOfGoodsSold - decimal
				          NULL , -- AdditionalCosts - decimal
				          @Amount , -- Amount - decimal
				          NULL , -- NewSubtotal - decimal
				          NULL , -- ShippingAmount - decimal
				          NULL , -- PostageAmount - decimal
				          NULL , -- TaxesPrice - decimal
				          0 , -- MasterAccountId - int
				          '' , -- MasterAccountName - varchar(50)
				          '' , -- MasterAccountSortName - varchar(50)
				          @OrderContact , -- OrderContactName - varchar(127)
				          '' , -- BillingAddress1 - varchar(50)
				          '' , -- BillingAddress2 - varchar(50)
				          '' , -- BillingAddress3 - varchar(50)
				          '' , -- BillingCity - varchar(50)
				          '' , -- BillingState - varchar(50)
				          '' , -- BillingCounty - varchar(50)
				          '' , -- BillingZip - varchar(50)
				          '' , -- BillngZipExtended - varchar(10)
				          '' , -- ShippingAddress1 - varchar(50)
				          '' , -- ShippingAddress2 - varchar(50)
				          '' , -- ShippingAddress3 - varchar(50)
				          '' , -- ShippingCity - varchar(50)
				          '' , -- ShippingState - varchar(50)
				          '' , -- ShippingCounty - varchar(50)
				          '' , -- ShippingZip - varchar(50)
				          '' , -- ShippingZipExtended - varchar(10)
				          GETDATE() , -- OLTP_InsertDate - datetime
				          null , -- OLTP_UpdateDate - datetime
				          0  -- UpdateCheckSum - int
				        )	

    END

GO
