/****** Object:  StoredProcedure [dbo].[usp_FM_GetStoreETSync]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[usp_FM_GetStoreETSync]
AS 
    SELECT
        Store.StoreFact.CenterKey ,
        Store.StoreFact.ZW_Franchise_ID ,
        Store.StoreFact.StoreNumber ,
        Store.StoreFact.Status ,
        Store.StoreFact.Email ,
        Store.StoreFact.StoreTypeKey ,
        Store.StoreFact.OpenStatus ,
        Store.StoreFact.Zip ,
        Store.StoreFact.Address ,
        Store.StoreFact.Phone ,
        Store.StoreFact.StateKey ,
        Store.CityDim.CityName ,
        Store.CountryDim.CountryName ,
        Store.StateDim.StateName ,
        Store.FastMailDim.IS_OYB ,
        Store.FastMailDim.IsModified ,
        Store.FastMailDim.LastUpdated ,
        Store.FastMailDim.ET_BUID ,
        Store.FastMailDim.ET_UserID ,
        Store.CountryDim.CountryCode ,
        Store.VanityNameDim.VanityNameName
		--,
        --      Store.OwnerDim.OwnerName
    FROM
        Store.StoreFact
        INNER JOIN Store.CityDim ON Store.StoreFact.CityKey = Store.CityDim.CityKey
        INNER JOIN Store.CountryDim ON Store.StoreFact.CountryKey = Store.CountryDim.CountryKey
        INNER JOIN Store.FastMailDim ON Store.StoreFact.CenterKey = Store.FastMailDim.CenterKey
       left  JOIN Store.StateDim ON Store.StoreFact.StateKey = Store.StateDim.StateKey
        JOIN Store.VanityNameDim ON Store.StoreFact.VanityNameKey = Store.VanityNameDim.VanityNameKey
--              Left Join
--  Store.OwnerDim On Store.OwnerDim.StoreNumber = Store.StoreFact.StoreNumber
    RETURN 0


GO
