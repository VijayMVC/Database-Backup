/****** Object:  View [dbo].[vw_LeaseExpiration]    Script Date: 5/15/2018 12:13:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vw_LeaseExpiration]
AS
SELECT     [CONTACT1].[KEY1], [CONTACT1].[CONTACT] AS Contact1, [CONTACT1].[CITY], [CONTACT1].[STATE] AS State1, 
                      CASE WHEN ISDATE(CONTSUPP.LINKACCT) = 1 THEN CONVERT(CHAR(10), CAST(CONTSUPP.LINKACCT AS DATETIME), 101) ELSE '' END AS LINKACCT,
                       [CONTACT1].[KEY4], [CONTACT1].[COUNTRY] AS Country1, [CONTACT2].[UREGION], [CONTACT2].[USTORETYPE], [CONTSUPP].[CONTSUPREF], 
                      [CONTSUPP].[TITLE], [CONTSUPP].[COUNTRY], [CONTSUPP].[ZIP], [CONTSUPP].[EXT], [CONTSUPP].[STATE], [CONTSUPP].[ADDRESS1], 
                      [CONTSUPP].[ADDRESS2], [CONTSUPP].[RECTYPE], [CONTSUPP].[CONTACT], [User] = ('Printed by: ' + { fn UCASE({ fn USER () }) })
FROM         ([GoldMine_Sales_And_Marketing].[dbo].[CONTACT1] [CONTACT1] INNER JOIN
                      [GoldMine_Sales_And_Marketing].[dbo].[CONTACT2] [CONTACT2] ON [CONTACT1].[ACCOUNTNO] = [CONTACT2].[ACCOUNTNO]) LEFT OUTER JOIN
                      [GoldMine_Sales_And_Marketing].[dbo].[contsupp] [CONTSUPP] ON [CONTACT2].[ACCOUNTNO] = [CONTSUPP].[ACCOUNTNO]
WHERE     CONTSUPP.RECTYPE = 'P' AND CONTSUPP.CONTACT = 'LEASE INFORMATION' AND LEFT(UPPER(Contact1.KEY4), 6) <> 'CLOSED'



GO
