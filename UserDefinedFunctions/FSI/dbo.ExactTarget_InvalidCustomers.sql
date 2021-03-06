/****** Object:  UserDefinedFunction [dbo].[ExactTarget_InvalidCustomers]    Script Date: 5/15/2018 12:14:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[ExactTarget_InvalidCustomers]
(
@zw_franchise_id char(7)
)
RETURNS 
 @ExactTargetInvalidCustomers TABLE 
(
zw_franchise_id char(7),
customerid int,
companyname varchar(50)
)
AS
BEGIN
	INSERT INTO @ExactTargetInvalidCustomers
	SELECT @zw_franchise_id, customerID, companyname
	FROM [customer database]
	WHERE zw_franchise_id = @zw_franchise_id
AND CompanyName IN (
'DUMP',
'Cash Customer',
'FASTSIGNS CUSTOMER',
'CASH',
'Miscellaneous',
'Dummy Customer',
'DELETED CUSTOMER ORDERS',
'Cash Sale',
'Dead Customer Bin',
'Cash',
'Cash',
'INACTIVE CUSTOMERS',
'Cash',
'Inactive Customers',
'CASH',
'Cash 1999-2/8/02',
'CASH',
'ZInvalid Customers',
'Cash',
'Personal',
'Deleted',
'DEAD FILE',
'CASH 111',
'Cash',
'Tradeshow Client',
'DEAD FILE',
'Cash 8/99-4/01',
'OLD CUSTOMERS - MOVED, OUT OF BUSINESS',
'Cash',
'personal',
'personal',
'Cash',
'Dead File',
'Cash Old 2',
'Cash',
'CASH CUSTOMER',
'CASH',
'Personal',
'xxx',
'Voided Companies',
'In House Sale',
'CASH Customer',
'Fastsigns, Fresno',
'Cash',
'Trade Show Client',
'***  Do Not Send',
'Cash',
'BUTCH''S Deleted CONTACTS',
'DEAD CUSTOMER FILE'
)
	RETURN 
END


GO
