/****** Object:  StoredProcedure [dbo].[usp_FM_GetContactsETSync]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE PROCEDURE [dbo].[usp_FM_GetContactsETSync]
AS
--Updated by AJM 08/13/2014 to remove order fact table
-- Updated on 03/21/2018 : Replace Customer.LastPickedUpDate As LastOrderDate to Customer.LastOrderDate As LastOrderDate
-- Updated on 03/22/2018 : Replace Customer.LastPickedUpDate As LastPickedUpDate to Customer.LastOrderDate As LastPickedUpDate
Select Top 10000
  Contact.ContactKey,
  Customer.CenterKey,
  Customer.CustomerID,
  Customer.ZW_Franchise_ID,
  Contact.CompanyNameDim.CompanyNameName,
  Customer.City,
  Customer.State,
  Contact.ZipDim.ZipName,
  Contact.CountyDim.CountyName,
  Contact.CountryDim.CountryName,
  Customer.Prospect,
  Customer.CreateDate,
  --Customer.LastPickedUpDate As LastOrderDate,
  Customer.LastOrderDate As LastOrderDate,
  --Customer.LastPickedUpDate As LastPickedUpDate,
   Customer.LastOrderDate As LastPickedUpDate,
  Customer.LastSaleAmount As SalesSubtotal,
  Customer.ActiveCustomer,
  Contact.EmployeeFact.FirstName As SalesPersonFirstName,
  Contact.EmployeeFact.LastName As SalesPersonLastName,
  Contact.FirstName,
  Contact.LastName,
  Contact.Title,
  Contact.PareaCode + Contact.PhoneNumber As PhoneNumber,
  Contact.PhoneExtention,
  Contact.FareaCode + Contact.FaxNumber As FaxNumber,
  Contact.EmailAddress,
  Contact.BirthMonth,
  Contact.BirthDay,
  Contact.FastMailDim.IsModified,
  Contact.FastMailDim.LastUpdated,
  IsNull(Contact.IndustryTypeDim.CleanedIndustry, 'UNASSIGNED') As
  CleanedIndustry,
  Contact.IndustryTypeDim.IndustryTypeName,
  Contact.IsActive,
  Contact.DoNotEmail
From
  (Select
    *
  From
    (Select
      Contact.ContactKey,
      Contact.EmailAddress,
      Row_Number() Over (Partition By Contact.EmailAddress Order By
      Contact.DoNotEmail Desc, Contact.FastMailDim.IsModified Desc, OLTP_UpdateDate) As RowNbr,
      Contact.FastMailDim.IsModified,
      Contact.DoNotEmail
    From
      Contact.ContactFact Contact Inner Join
      Contact.FastMailDim
        On Contact.ContactKey = Contact.FastMailDim.ContactKey) EmailPartition
  Where
    EmailPartition.RowNbr = 1 And
    EmailPartition.EmailAddress Is Not Null) UniqueEmails Left Join
  Contact.ContactFact Contact With(NoLock)
    On UniqueEmails.ContactKey = Contact.ContactKey Join
  Contact.CustomerFact Customer With(NoLock)
    On Contact.CustomerKey = Customer.CustomerKey Left Join
  Contact.CompanyNameDim With(NoLock)
    On Customer.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey Left Join
  Contact.CountryDim With(NoLock)
    On Customer.CountryKey = Contact.CountryDim.CountryKey Left Join
  Contact.CountyDim With(NoLock)
    On Customer.CountyKey = Contact.CountyDim.CountyKey Left Join
  Contact.ZipDim With(NoLock)
    On Customer.ZipKey = Contact.ZipDim.ZipKey Left Join
  Contact.IndustryDim With(NoLock)
    On Customer.IndustryTypeID = Contact.IndustryDim.IndustryTypeID And
    Customer.ZW_Franchise_ID = Contact.IndustryDim.ZW_Franchise_ID Left Join
  Contact.IndustryTypeDim With(NoLock)
    On Contact.IndustryDim.IndustryTypeKey =
    Contact.IndustryTypeDim.IndustryTypeKey Left Join
  Contact.EmployeeFact With(NoLock)
    On Customer.SalesPersonKey = Contact.EmployeeFact.EmployeeKey Join
  Contact.FastMailDim With(NoLock)
    On Contact.ContactKey = Contact.FastMailDim.ContactKey
Where
  Contact.FastMailDim.IsModified = 1
Order By
  LastOrderDate






GO
