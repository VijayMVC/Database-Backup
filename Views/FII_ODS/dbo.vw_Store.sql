/****** Object:  View [dbo].[vw_Store]    Script Date: 5/15/2018 12:13:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON











CREATE VIEW [dbo].[vw_Store]
AS
    SELECT
        Store.StoreFact.ZW_Franchise_ID ,
        CONVERT(INT, SUBSTRING(Store.StoreFact.ZW_Franchise_ID, 4, 4)) AS WebNumber ,
        Store.StoreFact.StoreNumber ,
        Store.VanityNameDim.VanityNameName AS VanityName ,
        Store.StoreFact.OpenStatus ,
        Store.StoreFact.Status ,
        Store.StoreFact.Address ,
        Store.CityDim.CityName ,
        ISNULL(Store.StateDim.StateName, '') AS StateName ,
        Store.StoreFact.Zip ,
        Store.CountryDim.CountryName ,
        Store.CountryDim.CountryCode ,
        System.CountryCodes.Country ,
        Store.StoreFact.Region ,
        Store.RegionDim.RegionName ,
        Store.StoreFact.Phone ,
        Store.StoreFact.FAX ,
        Store.StoreFact.FBC ,
        Store.StoreFact.GoldmineId ,
        Store.StoreFact.RoyaltyFIIpercent ,
        Store.StoreFact.RoyaltyNACpercent ,
        Store.StoreFact.Alert ,
        Store.StoreFact.LimitedServices ,
        Store.StoreFact.COD ,
        Store.StoreFact.Pacesetter ,
        Store.StoreFact.StoreOpenDate ,
        Store.StoreFact.Email ,
        Store.StoreFact.Reportable ,
        Store.StoreFact.ASI ,
        Store.StoreFact.EquipmentPackage ,
        Store.StoreFact.Router ,
        Store.StoreFact.LastConvention ,
        Store.StoreFact.OutsideSalesRep ,
        Store.StoreFact.Luminate ,
        Store.StoreFact.TrafficCount ,
        Store.StoreFact.SingleOwner ,
        Store.StoreFact.OwnerCount ,
        Store.StoreFact.Landlord ,
        Store.StoreFact.FAC ,
        Store.StoreFact.NAC ,
        Store.StoreFact.TAC ,
        Store.StoreFact.SquareFeet ,
        Store.StoreTypeDim.StoreTypeName ,
        Store.STBLevelDim.STBLevelName ,
        Store.LocationTypeDim.LocationTypeName ,
        Store.OperationalDim.OperationalName ,
        Store.StoreFact.CenterKey ,
        Store.StoreFact.ResaleOpenDate
    FROM
        Store.StoreFact WITH ( NOLOCK )
        JOIN Store.OperationalDim WITH ( NOLOCK ) ON Store.StoreFact.OperationalKey = Store.OperationalDim.OperationalKey
        JOIN Store.LocationTypeDim WITH ( NOLOCK ) ON Store.StoreFact.LocationTypeKey = Store.LocationTypeDim.LocationTypeKey
        JOIN Store.STBLevelDim WITH ( NOLOCK ) ON Store.StoreFact.STBLevelKey = Store.STBLevelDim.STBLevelKey
        JOIN Store.StoreTypeDim WITH ( NOLOCK ) ON Store.StoreFact.StoreTypeKey = Store.StoreTypeDim.StoreTypeKey
        LEFT JOIN Store.CountryDim WITH ( NOLOCK ) ON Store.CountryDim.CountryKey = Store.StoreFact.CountryKey
        LEFT JOIN Store.CountryRegion WITH ( NOLOCK ) ON Store.CountryDim.CountryKey = Store.CountryRegion.CountryKey
        LEFT JOIN Store.RegionDim WITH ( NOLOCK ) ON Store.CountryRegion.RegionKey = Store.RegionDim.RegionKey
        LEFT JOIN Store.StateDim WITH ( NOLOCK ) ON Store.StoreFact.StateKey = Store.StateDim.StateKey
        LEFT JOIN Store.VanityNameDim WITH ( NOLOCK ) ON Store.StoreFact.VanityNameKey = Store.VanityNameDim.VanityNameKey
        LEFT JOIN Store.CityDim WITH ( NOLOCK ) ON Store.CityDim.CityKey = Store.StoreFact.CityKey
        LEFT JOIN System.CountryCodes WITH ( NOLOCK ) ON Store.CountryDim.CountryCode = System.CountryCodes.CountryCode




GO
