/****** Object:  StoredProcedure [dbo].[usp_IS_customer_extract]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:		<Alex Gibson>
-- Create date: <02-08-2016>
-- Description:	<Pulls data from ODS tables to be placed into the the IS_Customer_Extract ETL package which will provide data for the CustomerExtract.csv 
--				  and to AWS>
-- =============================================
CREATE PROCEDURE dbo.usp_IS_customer_extract --EXECUTE dbo.usp_IS_customer_extract
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- 
	Select 
				''			AS	AddressID,
				''			AS  CityStateKey,
				''			AS  RecordTypeCode,
			e.CountryCode, 
				''			AS Statecode,
			b.[State]		AS StateAbbr,
				''			AS	CountyCode,
			h.[CountyName],
			g.ZipName		AS	[ZipCode],
				''			AS  Zip4,
				''			AS  CarrierRouteID,
				''			AS  DeliveryPoint,
				''			AS  CityNameAbbr,
			b.[City]		AS	CityName,
				''			AS	AddressPrimaryNo,
				''			AS  BuildingOrFirmName,
				''			AS  StreetPreDirection,
				''			AS  StreetName,
				''			AS  StreetSuffix,
				''			AS	StreetPostDirection,
				''			AS  AddressSecondaryAbbr,
				''			AS  AddressSecondaryNo,
		b.[BillingAddress1]	AS	FullAddressLine1,
		b.[BillingAddress2]	AS	FullAddressLine2,
				''			AS  CBSA,
				''			AS	CBSAType,
				''			AS	CensusTract,
				''			AS	CensusBlock,
				''			AS	Latitude,
				''			AS	Longitude,
		a.FirstName,			
				''			AS	Inital,
		a.LastName,
				''			AS  NamePrefix,
				''			AS  NameSuffix,
a.FirstName+' '+a.LastName	AS  FullName,
		a.EmailAddress		AS	Email,
		f.CompanyNameName	AS  CompanyName,
				''			AS  CompanyPhone1,
				''			AS  CompanyPhone2,
				''			AS  CompanyFax,
				''			AS	CompanyEmail,
				''			AS  CompanyURL,
SUBSTRING(b.ZW_Franchise_ID,CHARINDEX('I',b.ZW_Franchise_ID)+1, LEN(b.ZW_Franchise_ID)) AS WebNo,
		b.[CustomerKey]		AS	CustomerID,	
		d.IndustryTypeName	AS  Industry,	
				
				''			AS  Source,
		b.LastOrderDate,	
		a.[ZW_Franchise_ID]

 
FROM 
  (	SELECT CustomerKey,ZW_Franchise_ID, FirstName, LastName, EmailAddress  
	FROM Contact.ContactFact) a

  INNER JOIN Contact.CustomerFact b
  On a.CustomerKey = b.CustomerKey

  INNER JOIN Contact.IndustryDim c
  On b.IndustryTypeID = c.IndustryTypeID 
  AND a.ZW_Franchise_ID = c.ZW_Franchise_ID

  INNER JOIN Contact.IndustryTypeDim d
  On c.IndustryTypeKey = d.IndustryTypeKey

  LEFT OUTER JOIN	[Contact].[CountryDim] e
  ON 		b.CountryKey= e.CountryKey 
	
  LEFT OUTER JOIN	[Contact].[CompanyNameDim] f
  ON		b.[CompanyNameKey]	= f.CompanyNameKey

  LEFT OUTER JOIN	[Contact].[ZipDim] g
  ON		b.[ZipKey] = g.ZipKey

  LEFT OUTER JOIN	[Contact].[CountyDim] h
  ON		b.[CountyKey]=h.[CountyKey]

--Where
--  a.ZW_Franchise_ID = 'FSI0022'
Order By
  b.LastPickedUpDate Desc

END

GO
