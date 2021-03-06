/****** Object:  StoredProcedure [dbo].[sp_ImportDMCustomersByYearMonth]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE [dbo].[sp_ImportDMCustomersByYearMonth]
	@Year int,
	@Month int

AS

BEGIN
	SET NOCOUNT ON;
	
	delete from DMCustomers
	where year(OrderDate) = @Year  and month(OrderDate) = @Month 

insert into DMCustomers
(WebNo, FirstName, LastName, Address1, Address2, City, State, ZipCode, Country, OrderDate,
SalesAmt, Phone, CustomerID, PhoneExtension, CountyName, FullName, Email, CompanyName, Industry, Source)

	SELECT	DISTINCT	
	O.T_WebNumber					
	,	LTRIM(RTRIM(COALESCE(CO.FirstName,'')))				
	,	LTRIM(RTRIM(COALESCE(CO.LastName,'')))				
	,	LTRIM(RTRIM(C.BillingAddress1	))				
	,	LTRIM(RTRIM(COALESCE(C.BillingAddress2,'')))			
	,	LTRIM(RTRIM(C.City))						
	,	LTRIM(RTRIM(C.[State]))						
	,	LTRIM(RTRIM(C.Zip))						
	,	LTRIM(RTRIM(C.CountryCode)) 
	,	O.T_OrderDate 
	,	O.SalesAmt
	,   CO.PhoneNumber					
	,	C.CustomerKey					
	,	CO.PhoneExtention				
	,	LTRIM(RTRIM(C.County))						
	,	LTRIM(RTRIM(COALESCE(CO.ContactName,'')))			
	,	LTRIM(RTRIM(COALESCE(CO.EmailAddress,'')))			
	,	LTRIM(RTRIM(C.CompanyName)) 
	,	LTRIM(RTRIM(C.IndustryName))				
	,	LTRIM(RTRIM(C.OriginName))				
	
	FROM	[01DALSPRODSQL1].[datawarehouse].[dbo].[OrderFact] O
			JOIN [01dalsprodsql1].[datawarehouse].dbo.[OrderDim] OD ON OD.OrderKey = O.OrderKey
			LEFT JOIN [01dalsprodsql1].[datawarehouse].dbo.[CustomerDim] C	ON C.CustomerKey = O.CustomerKey
			LEFT JOIN [01dalsprodsql1].[datawarehouse].dbo.[ContactDim] CO	ON CO.ContactKey = O.ContactKey
			
			WHERE OD.PickedUpDate IS NOT NULL AND C.CountryCode IN ('US','CA')
			AND O.T_OrderDate IN (SELECT MAX(fact.T_OrderDate) FROM [01DALSPRODSQL1].[datawarehouse].[dbo].[OrderFact] fact WHERE fact.ContactKey = CO.ContactKey)
			AND O.T_WebNumber > 0 AND 
year(O.T_OrderDate ) = @Year  and month(O.T_OrderDate ) = @Month 
			AND ((LEN(LTRIM(RTRIM(COALESCE(C.BillingAddress1,'')))) > 1) OR (LEN(LTRIM(RTRIM(COALESCE(C.BillingAddress2,'')))) > 1))
			AND CO.ContactName NOT IN ('A .', '. .','* *', '- -', 'cash customer', 'cash sale', 'cash cash', 'cash .', 'cash *', 'dead customer', 'none none', 'none .')
			AND CO.ContactName NOT LIKE '%(none)%'
			AND CO.ContactName NOT LIKE '%FASTSIGNS%'
			AND C.CompanyName NOT IN ('cash', 'cash customer', 'cash sale', 'cash cash', 'cash .', 'cash *', 'dead customer', 'none none', 'none .')
			AND C.CompanyName NOT LIKE '%(none)%'
			AND C.CompanyName NOT LIKE '%FASTSIGNS%'
			AND C.BillingAddress1 NOT IN ('cash', 'cash customer', 'cash sale', 'cash cash', 'cash .', 'cash *', 'dead customer', 'none none', 'none .')
			AND C.BillingAddress1 NOT LIKE '%(none)%'
			AND C.BillingAddress1 NOT LIKE '%DO NOT SEND%'
			AND C.BillingAddress1 NOT LIKE '%FASTSIGNS%'
			AND COALESCE(C.BillingAddress2,'') NOT LIKE '%FASTSIGNS%'
			AND COALESCE(C.BillingAddress2,'') NOT LIKE '%DO NOT SEND%'




END


GO
