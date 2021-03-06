/****** Object:  View [dbo].[SSIS_ContactFact_StageLoad]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[SSIS_ContactFact_StageLoad]
AS
    SELECT
        [Staging].[dbo].[ContactFact].* ,
        AlternateAddressKey ,
        Store.CenterKey 
		--,
        --[Contact].[CustomerFact].CustomerKey
    FROM
        [Staging].[dbo].[ContactFact]
        LEFT JOIN [Contact].[AlternateAddressDim]  ON [Contact].[AlternateAddressDim].[AlternateAddressName] = [ContactFact].[AlternateAddress]
        LEFT JOIN Store.StoreFact Store  ON ContactFact.ZW_Franchise_ID = Store.ZW_Franchise_ID
        LEFT JOIN [Contact].[CustomerFact] ON Store.ZW_Franchise_ID = CustomerFact.ZW_Franchise_ID
                                                              AND Staging.dbo.ContactFact.CustomerID = Contact.CustomerFact.CustomerID





GO
