/****** Object:  View [dbo].[vw_FM_store]    Script Date: 5/15/2018 12:13:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vw_FM_store]
AS 
SELECT     Store.StoreFact.CenterKey, Store.StoreFact.ZW_Franchise_ID, Store.StoreFact.StoreNumber, Store.StoreFact.Status, Store.StoreFact.Email, 
                      Store.StoreFact.StoreTypeKey, Store.StoreFact.OpenStatus, Store.StoreFact.Zip, Store.StoreFact.Address, Store.StoreFact.Phone, Store.CityDim.CityName, 
                      Store.CountryDim.CountryName, Store.FastMailDim.IS_OYB, Store.FastMailDim.IsModified, Store.FastMailDim.LastUpdated
FROM         Store.StoreFact   WITH ( NOLOCK )  INNER JOIN
                      Store.CityDim   WITH ( NOLOCK ) ON Store.StoreFact.CityKey = Store.CityDim.CityKey INNER JOIN
                      Store.CountryDim   WITH ( NOLOCK ) ON Store.StoreFact.CountryKey = Store.CountryDim.CountryKey INNER JOIN
                      Store.FastMailDim   WITH ( NOLOCK ) ON Store.StoreFact.CenterKey = Store.FastMailDim.CenterKey

GO
