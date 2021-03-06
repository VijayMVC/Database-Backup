/****** Object:  View [dbo].[WEB_Contact_Data_Contact1]    Script Date: 5/15/2018 12:13:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[WEB_Contact_Data_Contact1]
AS
SELECT DISTINCT 
                      dbo.CONTACT1.ACCOUNTNO, dbo.CONTACT1.KEY1, dbo.CONTACT1.KEY2, dbo.CONTACT1.KEY3, dbo.CONTACT1.KEY4, dbo.CONTACT1.KEY5, 
                      dbo.CONTACT1.CONTACT, dbo.CONTACT1.LASTNAME, dbo.CONTACT2.UWEBNUMBER, dbo.CONTACT1.ADDRESS1, dbo.CONTACT1.ADDRESS2, 
                      dbo.CONTACT1.CITY, dbo.CONTACT1.STATE, dbo.CONTACT1.ZIP, dbo.CONTACT1.COUNTRY, dbo.CONTACT1.PHONE1, dbo.CONTACT1.FAX, 
                      dbo.CONTACT2.UEMC, dbo.CONTACT2.UNAPAGRDT2, ISNULL(dbo.CONTSUPP.CONTSUPREF, '') + ISNULL(dbo.CONTSUPP.ADDRESS1, '') AS Expr1, 
                      dbo.MQ_Geo_Data.Lat, dbo.MQ_Geo_Data.Long, dbo.timezone.dst, dbo.timezone.tz
FROM         dbo.CONTACT1 INNER JOIN
                      dbo.CONTACT2 ON dbo.CONTACT1.ACCOUNTNO = dbo.CONTACT2.ACCOUNTNO LEFT OUTER JOIN
                      dbo.CONTSUPP ON dbo.CONTACT1.ACCOUNTNO = dbo.CONTSUPP.ACCOUNTNO AND dbo.CONTSUPP.RECTYPE = 'P' AND 
                      dbo.CONTSUPP.CONTACT = 'E-mail Address' AND SUBSTRING(dbo.CONTSUPP.ZIP, 2, 1) = '1' LEFT OUTER JOIN
                      dbo.MQ_Geo_Data ON dbo.CONTACT1.KEY1 = dbo.MQ_Geo_Data.Store_Num LEFT OUTER JOIN
                      dbo.timezone ON dbo.CONTACT1.ZIP + dbo.CONTACT1.CITY = dbo.timezone.zip + dbo.timezone.city
WHERE     (ISNUMERIC(dbo.CONTACT1.KEY1) = 1) AND (LEFT(dbo.CONTACT1.KEY4, 6) <> 'CLOSED') AND (ISNUMERIC(dbo.CONTACT2.UWEBNUMBER) = 1) AND 
                      (UPPER(dbo.CONTACT2.USTORETYPE) NOT IN ('CLOSED')) AND (dbo.CONTACT2.USTOREOPD IS NOT NULL)



GO
