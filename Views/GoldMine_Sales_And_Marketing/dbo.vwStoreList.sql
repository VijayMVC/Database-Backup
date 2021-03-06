/****** Object:  View [dbo].[vwStoreList]    Script Date: 5/15/2018 12:13:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vwStoreList]
AS
SELECT     c1.key1, CASE WHEN u_Country = '' THEN 'USA' ELSE u_Country END AS u_Country, CASE WHEN ISNUMERIC(c1.key3) = 1 THEN cast(c1.KEY3 AS INT)
                       ELSE 0 END AS key3, c1.Contact, LastName, c1.AccountNO, 
                      CASE WHEN c1.key2 LIKE '%Closed%' THEN 'Closed' WHEN c1.key3 LIKE '%Closed%' THEN 'Closed' WHEN C1.contact = 'Accounts Program National' THEN
                       'Special' WHEN C1.contact IN ('Catherine Monson', 'Tom Grieser', 'IT Developer', 'FASTSIGNS', 'Garth Allison', 'Andrew McKay') 
                      THEN 'Master' WHEN c1.Key3 IN ('619', '849', '898', '899', '900', '901', '904', '905', '906', '907', '908', '909', '998', '999') 
                      THEN 'Master' WHEN c1.contact LIKE '%Training%' THEN 'Training' WHEN c1.key1 LIKE '%co-op%' THEN 'Co-op' WHEN ISNUMERIC(c1.Key3) 
                      = 1 THEN 'Open' WHEN ISNULL(c1.KEY3, '') = '' THEN 'NA' END AS StoreStatus,
                          (SELECT     ISNULL(C2.UStoreType, '')
                            FROM          CONTACT2 C2
                            WHERE      c1.ACCOUNTNO = c2.ACCOUNTNO) AS StoreType, ISNULL([ADDRESS1], '') + ISNULL(' ' + [ADDRESS2], '') + ISNULL(' ' + [ADDRESS3], '') 
                      AS StoreAddress, CITY, STATE, ZIP, U_LASTNAME, KEY4, CAST(NOTES AS varchar(2000)) [NOTES], MERGECODES, PHONE1, U_CONTACT, 
                      c2.USTOREOPD AS OpenDate, c2.URESALEOPD AS ReSaleOpendate, c2.UFSTML AS FastMailDate, c2.UFSTMLTYPE AS FMType
FROM         contact1 c1 JOIN
                      contact2 c2 ON c1.ACCOUNTNO = c2.ACCOUNTNO
WHERE     CASE WHEN ISNUMERIC(c1.key3) = 1 THEN cast(c1.KEY3 AS INT) ELSE 0 END <> 0



GO
