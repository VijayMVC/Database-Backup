/****** Object:  View [dbo].[vwStoreCountry]    Script Date: 5/15/2018 12:13:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vwStoreCountry]
AS
SELECT     cs.StoreNumber, cr.FullName, ca.City, cpd.ShortName
FROM         dbo.COR_STORES AS cs INNER JOIN
                      dbo.COR_STORES_ADDRESSES_LINK AS cral ON cs.StoreID = cral.StoreID INNER JOIN
                      dbo.COR_ADDRESSES AS ca ON cral.AddressID = ca.AddressID INNER JOIN
                      dbo.COR_POLITICAL_DIVISION AS cpd ON ca.PoliticalDivisionID = cpd.PoliticalDivisionID INNER JOIN
                      dbo.COR_COUNTRIES AS cc ON cpd.CountryID = cc.CountryID INNER JOIN
                      dbo.COR_INTERNATIONAL_REGIONS AS cr ON cc.InternationalRegionID = cr.InternationalRegionID


GO
