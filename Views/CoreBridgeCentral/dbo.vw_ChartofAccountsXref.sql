/****** Object:  View [dbo].[vw_ChartofAccountsXref]    Script Date: 5/15/2018 12:13:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.vw_ChartofAccountsXref
AS
SELECT        [Account Name], [GL Account ], [Validated Account], IsValid, OLTP_InsertDate
FROM            FII_ODS.System.ChartofAccountsXref

GO
