/****** Object:  View [dbo].[vw_CenterInfo]    Script Date: 5/15/2018 12:13:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vw_CenterInfo]
AS
Select
  Store.StoreFact.CenterKey,
  Store.StoreFact.ZW_Franchise_ID,
  Store.StoreFact.StoreNumber,
  Store.StoreFact.OpenStatus,
  Store.CountryDim.CountryName As CountryName,
  Store.CountryDim.CountryCode,
  Store.StoreFact.StoreOpenDate,
  System.ZipCode.city,
  System.ZipCode.state,
  System.ZipCode.timezone,
  System.ZipCode.dst,
  System.ZipCode.zip,
  System.StoreControl.DataSource,
  System.StoreControl.AsOfDate
From
  Store.StoreFact WITH ( NOLOCK )
  Inner Join Store.CountryDim WITH ( NOLOCK ) On Store.StoreFact.CountryKey =
    Store.CountryDim.CountryKey
  Left Join System.ZipCode WITH ( NOLOCK ) On Store.StoreFact.Zip = System.ZipCode.zip
  Left Join System.StoreControl WITH ( NOLOCK ) On Store.StoreFact.ZW_Franchise_ID =
    System.StoreControl.ZW_Franchise_ID

GO
