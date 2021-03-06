/****** Object:  View [dbo].[vwPrimaryOwnersContact_All]    Script Date: 5/15/2018 12:13:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/* and isNULL( CONTACT1.Country,'') in ('','Canada') 	
and  IsNull(CONTSUPP.CONTSUPREF,'')+IsNull(CONTSUPP.ADDRESS1,'') <> ''
and 	CONTACT1.ADDRESS1 + isNULL(CONTACT1.ADDRESS2,'') NOT LIKE '%Coming soon%'*/
CREATE VIEW [dbo].[vwPrimaryOwnersContact_All]
AS
SELECT DISTINCT 
                      dbo.CONTACT1.KEY1, dbo.CONTACT1.KEY3, dbo.CONTACT1.COMPANY, dbo.CONTACT1.CONTACT, dbo.CONTACT2.UWEBNUMBER, 
                      dbo.CONTACT1.ADDRESS1, ISNULL(dbo.CONTACT1.ADDRESS2, '') AS Address2, dbo.CONTACT1.CITY, dbo.CONTACT1.STATE, dbo.CONTACT1.ZIP, 
                      dbo.CONTACT1.COUNTRY, dbo.CONTACT1.PHONE1 AS Phone, ISNULL(dbo.CONTACT1.FAX, '') AS Fax, ISNULL(dbo.CONTSUPP.CONTSUPREF, '') 
                      + ISNULL(dbo.CONTSUPP.ADDRESS1, '') AS Email
FROM         dbo.CONTACT1 INNER JOIN
                      dbo.CONTACT2 ON dbo.CONTACT1.ACCOUNTNO = dbo.CONTACT2.ACCOUNTNO LEFT OUTER JOIN
                      dbo.CONTSUPP ON dbo.CONTACT1.ACCOUNTNO = dbo.CONTSUPP.ACCOUNTNO AND dbo.CONTSUPP.RECTYPE = 'P' AND 
                      dbo.CONTSUPP.CONTACT = 'E-mail Address' AND SUBSTRING(dbo.CONTSUPP.ZIP, 2, 1) = '1'
WHERE     (ISNUMERIC(dbo.CONTACT1.KEY1) = 1) AND (LEFT(dbo.CONTACT1.KEY4, 6) <> 'CLOSED') AND (dbo.CONTACT2.USTORETYPE NOT IN ('MASTER', 
                      'CLOSED')) AND (dbo.CONTACT2.USTORETYPE NOT IN ('MASTER', 'SPECIAL')) AND (dbo.CONTACT2.USTOREOPD IS NOT NULL) AND 
                      (dbo.CONTACT1.CONTACT NOT LIKE '%Developer%') AND (dbo.CONTACT1.CONTACT NOT LIKE '%National%') AND 
                      (dbo.CONTACT1.CONTACT NOT LIKE '%FASTSIGNS%') AND (dbo.CONTACT1.CONTACT NOT LIKE '%Monson%') AND 
                      (dbo.CONTACT1.CONTACT NOT LIKE '%Grieser%') AND (dbo.CONTACT1.CONTACT NOT LIKE 'Training%')



GO
