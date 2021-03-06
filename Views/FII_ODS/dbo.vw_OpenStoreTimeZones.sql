/****** Object:  View [dbo].[vw_OpenStoreTimeZones]    Script Date: 5/15/2018 12:13:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vw_OpenStoreTimeZones]  AS
SELECT
                Store.StoreFact.CenterKey ,
                Store.StoreFact.ZW_Franchise_ID ,
                Store.StoreFact.StoreNumber ,
                Store.StoreFact.OpenStatus ,
                Store.CountryDim.CountryName AS CountryName ,
                Store.CountryDim.CountryCode ,
                Store.StoreFact.StoreOpenDate ,
                System.ZipCode.city ,
                System.ZipCode.state ,
                System.ZipCode.timezone ,
                System.ZipCode.dst ,
                System.ZipCode.zip ,
                System.StoreControl.DataSource ,
                System.StoreControl.AsOfDate
               FROM
                Store.StoreFact   WITH ( NOLOCK ) 
                INNER JOIN Store.CountryDim   WITH ( NOLOCK ) ON Store.StoreFact.CountryKey = Store.CountryDim.CountryKey
                LEFT JOIN System.ZipCode   WITH ( NOLOCK ) ON Store.StoreFact.Zip = System.ZipCode.zip
                LEFT JOIN System.StoreControl   WITH ( NOLOCK ) ON Store.StoreFact.ZW_Franchise_ID = System.StoreControl.ZW_Franchise_ID
               WHERE
                Store.StoreFact.OpenStatus = 'Open'


GO
