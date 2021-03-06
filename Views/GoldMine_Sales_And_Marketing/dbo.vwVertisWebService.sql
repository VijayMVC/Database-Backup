/****** Object:  View [dbo].[vwVertisWebService]    Script Date: 5/15/2018 12:13:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vwVertisWebService]
AS
SELECT     CAST(ISNULL(c2.UWEBNUMBER, '') AS int) AS 'Webnumber', CAST(ISNULL(c1.KEY1, '') AS int) AS 'Storenumber', dbo.A1Zip.Zipcode AS A1Zip, 
                      ISNULL(c1.CONTACT, '') AS 'Contact', ISNULL(c1.LASTNAME, '') AS 'Lastname', ISNULL(c1.KEY2, '') AS 'FieldFBC', ISNULL(c2.USDS, '') AS 'OfficeFBC', 
                      ISNULL(c2.UFMM, '') AS 'MSM', c2.USTOREOPD AS 'OpeningDate', CASE WHEN (c1.ADDRESS2 = '') THEN ISNULL(c1.ADDRESS1, '') 
                      WHEN (c1.ADDRESS2 IS NULL) THEN ISNULL(c1.ADDRESS1, '') ELSE ISNULL(c1.ADDRESS1, '') + ', ' + ISNULL(c1.ADDRESS2, '') END AS 'Address', 
                      ISNULL(c1.CITY, '') AS 'City', ISNULL(c1.STATE, '') AS 'State', ISNULL(c1.ZIP, '') AS 'Zip', CASE WHEN (c1.country = '') 
                      THEN 'United States' ELSE ISNULL(c1.COUNTRY, 'United States') END AS 'Country', ISNULL(c2.UREGION, '') AS 'Region', ISNULL(c1.PHONE1, '') 
                      AS 'Phone1', ISNULL(c1.EXT1, '') AS 'Ext1', ISNULL(c1.PHONE2, '') AS 'Phone2', ISNULL(c1.EXT2, '') AS 'Ext2', ISNULL(c1.FAX, '') AS 'Fax', 
                      'www.fastsigns.com/' + c2.UWEBNUMBER AS 'CenterWebURL', ISNULL(c2.UWEBNUMBER, '') + '@fastsigns.com' AS 'CenterEmail', 
                      ISNULL(cs.CONTSUPREF, '') + ISNULL(cs.ADDRESS1, '') AS 'FranchiseeEmail', ISNULL(c1.KEY4, '') AS 'Operational', ISNULL(c1.KEY5, '') 
                      AS 'Compliance', ISNULL(c2.USHARINTN1, '') AS 'Shareholder1', ISNULL(c2.USHAREINT1, '0.0') AS 'Interest1', ISNULL(c2.USHARINTN2, '') 
                      AS 'Shareholder2', ISNULL(c2.USHAREINT2, '0.0') AS 'Interest2', ISNULL(c2.USHARINTN3, '') AS 'Shareholder3', ISNULL(c2.USHAREINT3, '0.0') 
                      AS 'Interest3', ISNULL(c2.USHARINTN4, '') AS 'Shareholder4', ISNULL(c2.USHAREINT4, '0.0') AS 'Interest4', ISNULL(c2.USHARINTN5, '') 
                      AS 'Shareholder5', ISNULL(c2.USHAREINT5, '0.0') AS 'Interest5', ISNULL(c2.USHARINTN6, '') AS 'Shareholder6', ISNULL(c2.USHAREINT6, '0.0') 
                      AS 'Interest6'
FROM         dbo.CONTACT1 AS c1 LEFT OUTER JOIN
                      dbo.A1Zip ON CAST(ISNULL(c1.KEY1, '') AS int) = dbo.A1Zip.StoreNumber LEFT OUTER JOIN
                      dbo.CONTACT2 AS c2 ON c1.ACCOUNTNO = c2.ACCOUNTNO LEFT OUTER JOIN
                      dbo.CONTSUPP AS cs ON c1.ACCOUNTNO = cs.ACCOUNTNO AND cs.RECTYPE = 'P' AND cs.CONTACT = 'E-mail Address' AND 
                      cs.ZIP LIKE '_1%'
WHERE     (ISNUMERIC(c1.KEY1) = 1) AND (ISNUMERIC(c2.UWEBNUMBER) = 1) AND (c1.KEY4 NOT LIKE 'Closed') AND (c2.UWEBNUMBER <> '900') AND 
                      (c1.CONTACT NOT LIKE 'training%') AND (c1.CONTACT NOT LIKE 'fastsigns%') AND (c1.CONTACT NOT LIKE 'IT developer%') AND 
                      (c1.ADDRESS1 NOT LIKE 'coming soon%') AND (c1.COUNTRY IS NULL OR
                      c1.COUNTRY = '' OR
                      c1.COUNTRY = 'canada') AND (c2.USTORETYPE NOT IN ('Production', 'Special'))
and ((c1.KEY5 is not null and c1.key5 not like '%Ltd%') or c1.key5 is null)



GO
