/****** Object:  StoredProcedure [dbo].[usp_IL_GetClosestVendors]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:           <Alex,Montminy>
-- Create date: <8/16/2016>
-- Description:      <Gets nearby location for installer locator>
-- =============================================
CREATE PROCEDURE [dbo].[usp_IL_GetClosestVendors] 
       -- Add the parameters for the stored procedure here
    @lat FLOAT, @long FLOAT
AS
    BEGIN
        IF @lat IS NULL
            BEGIN
                SET @lat = 1;
                SET @long = 1;
            END
        DECLARE @location GEOGRAPHY;

        SET @location = GEOGRAPHY::Point(@lat, @long, 4326);

       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        SELECT
            [GeoLocation].STDistance(@location) AS Distance ,
            [GeoLocation].STDistance(@location) / 1609.344 AS Distance2 ,
            [status_activity] ,
            [vendor_company] ,
            [Name] ,
            [addr_street_1] ,
            [addr_street_2] ,
            [addr_city] ,
            [addr_state] ,
            [addr_ZIP] ,
            [addr_country] ,
            --[addr_status] ,
            [vendor_type] ,
            [Email] ,
            Phone ,
            [Extension] ,
            [Fax] ,
            [GeoLocation] ,
            [lat] ,
            [long] ,
            web ,
			[WebNumber],
            recordid
        FROM
            ( SELECT
                * ,
                ROW_NUMBER() OVER ( PARTITION BY Phone ORDER BY Name ) AS row_number
              FROM
                dbo.vw_VendorList
              WHERE
                GeoLocation IS NOT NULL
                AND [GeoLocation].STDistance(@location) / 1609.344 < 50
                AND [status_activity] != 'InActive'
                AND Phone IS NOT NULL
            ) AS rows
        WHERE
            row_number = 1
        ORDER BY
            Distance2 ASC
END


GO
