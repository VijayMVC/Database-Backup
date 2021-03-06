/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_ContactFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_ContactFact]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.ContactID = U.ContactID 
 , F.CustomerID = U.CustomerID 
 , F.CustomerKey = U.CustomerKey 
 , F.FirstName = U.FirstName 
 , F.LastName = U.LastName 
 , F.Title = U.Title 
 , F.PhoneNumber = U.PhoneNumber 
 , F.PhoneExtention = U.PhoneExtention 
 , F.FaxNumber = U.FaxNumber 
 , F.EmailAddress = U.EmailAddress 
 , F.PareaCode = U.PareaCode 
 , F.FareaCode = U.FareaCode 
 , F.P2areaCode = U.P2areaCode 
 , F.P2PhoneNumber = U.P2PhoneNumber 
 , F.P2PhoneType = U.P2PhoneType 
 , F.P3areaCode = U.P3areaCode 
 , F.P3PhoneNumber = U.P3PhoneNumber 
 , F.P3PhoneType = U.P3PhoneType 
 , F.PrimaryContact = U.PrimaryContact 
 , F.APContact = U.APContact 
 , F.AlternateAddressKey = U.AlternateAddressKey 
 , F.SortOrder = U.SortOrder 
 , F.InvoicingContact = U.InvoicingContact 
 , F.BirthMonth = U.BirthMonth 
 , F.BirthDay = U.BirthDay 
 , F.IsActive = U.IsActive 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum 
 , F.[KeystoneContactKey] = U.[KeystoneContactKey]
 , F.[KeyStoneCustomerKey] = U.[KeyStoneCustomerKey]
FROM [Staging].[dbo].[ContactFactUpdate] U 
     JOIN [Contact].[ContactFact] F ON U.ContactKey = F.ContactKey 
 WHERE U.ContactKey > 0 
 
INSERT INTO  [Contact].[ContactFact] 
    ( ZW_Franchise_ID 
 , ContactID 
 , CustomerID 
 , CustomerKey 
 , FirstName 
 , LastName 
 , Title 
 , PhoneNumber 
 , PhoneExtention 
 , FaxNumber 
 , EmailAddress 
 , PareaCode 
 , FareaCode 
 , P2areaCode 
 , P2PhoneNumber 
 , P2PhoneType 
 , P3areaCode 
 , P3PhoneNumber 
 , P3PhoneType 
 , PrimaryContact 
 , APContact 
 , AlternateAddressKey 
 , SortOrder 
 , InvoicingContact 
 , BirthMonth 
 , BirthDay 
 , IsActive 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum
 , CenterKey 
 , KeystoneContactKey
 , KeyStoneCustomerKey
 ) SELECT ZW_Franchise_ID 
 , ContactID 
 , CustomerID 
 , CustomerKey 
 , FirstName 
 , LastName 
 , Title 
 , PhoneNumber 
 , PhoneExtention 
 , FaxNumber 
 , EmailAddress 
 , PareaCode 
 , FareaCode 
 , P2areaCode 
 , P2PhoneNumber 
 , P2PhoneType 
 , P3areaCode 
 , P3PhoneNumber 
 , P3PhoneType 
 , PrimaryContact 
 , APContact 
 , AlternateAddressKey 
 , SortOrder 
 , InvoicingContact 
 , BirthMonth 
 , BirthDay 
 , IsActive 
 , OLTP_InsertDate 
 , OLTP_InsertDate
 , UpdateCheckSum
 , CenterKey 
 , KeystoneContactKey
 , KeyStoneCustomerKey
 FROM [Staging].[dbo].[ContactFactUpdate] WHERE ContactKey = 0 

-- Added for FASTMAIL to add FASTMAILDim entries. TAF 7/13/13
INSERT INTO Contact.FastMailDim (ContactKey,IsModified,LastUpdated,IS_OYB) 
select ContactFact.ContactKey,1,GETDATE(),0
from
  Contact.ContactFact 
    LEFT Join
  Contact.FastMailDim On Contact.ContactFact.ContactKey =
   Contact.FastMailDim.ContactKey
Where
   Contact.FastMailDim.ContactKey IS NULL

--Update ContactID's for Keystone Records
UPDATE [Contact].[ContactFact] SET ContactID = ContactKey
WHERE ContactID IS NULL AND LEN(KeystoneContactKey)=32

-- Update Customer ID's fro Keystone Records
UPDATE [Contact].[ContactFact] SET CustomerID = F.CustomerID,
								CustomerKey = F.CustomerID
FROM contact.[ContactFact] U 
     JOIN [Contact].[CustomerFact] F ON U.KeystoneCustomerKey = F.KeystoneCustomerKey  
WHERE U.CustomerID IS NULL

-- Added to Update Contact Changes for FASTMAIL  
UPDATE FM SET IsModified=1  
FROM [Staging].[dbo].[ContactFactUpdate] U 
     JOIN [Contact].[ContactFact] F ON U.ContactKey = F.ContactKey
	 JOIN Contact.FastMailDim FM ON F.CustomerKey = FM.CustomerKey 
 WHERE U.ContactKey > 0 AND U.EmailAddress IS NOT null

TRUNCATE TABLE Staging.dbo.ContactFactUpdate 
GO
