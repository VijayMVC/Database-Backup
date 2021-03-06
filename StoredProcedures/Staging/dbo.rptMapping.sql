/****** Object:  StoredProcedure [dbo].[rptMapping]    Script Date: 5/15/2018 12:13:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC rptMapping (@CenterNumber INT)
as
DECLARE
    @Longitude FLOAT ,
    @Latitude FLOAT 
SET @Latitude = (SELECT
    VendorLocation.Lat
FROM
    [Staging].[dbo].[VendorGEO]
WHERE
    CenterNumber = @CenterNumber);
SET @Longitude = (SELECT
    VendorLocation.Long 
FROM
    [Staging].[dbo].[VendorGEO]
WHERE
    CenterNumber = @CenterNumber)

DECLARE @point GEOGRAPHY 
set @point = geography::Point(@Latitude, @Longitude, 4326);
DECLARE @dist INT = 80467.2;

SELECT
    *
FROM
    [Staging].[dbo].[VendorGEO]
WHERE
    @point.STDistance(VendorLocation) <= @dist
GO
