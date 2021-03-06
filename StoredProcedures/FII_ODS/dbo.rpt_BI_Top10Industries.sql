/****** Object:  StoredProcedure [dbo].[rpt_BI_Top10Industries]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 1/19/2017
-- Description:	Top 10 industries Report
-- =============================================
CREATE PROCEDURE [dbo].[rpt_BI_Top10Industries]
	-- Add the parameters for the stored procedure here
    @Year CHAR(4) = '2016' ,
    @Region VARCHAR(15) = 'All US' ,
    @System VARCHAR(10) = 'All'
AS
    BEGIN
        SET NOCOUNT ON;
        DECLARE @intYear INT 
        SET @intYear = CAST(@Year AS INT)
        DECLARE @dateto DATETIME
        IF @Year = CAST(YEAR(GETDATE()) AS CHAR(4))
            SET @dateto = GETDATE()
        ELSE
            SET @dateto = '12/31/' + @Year

        DECLARE @CountryKey INT 
        DECLARE @CountryCode CHAR(2)
        IF @Region = 'All US'
            SET @CountryKey = 8
        ELSE
            SET @CountryKey = NULL

        IF @Region = 'All US'
            SET @CountryCode = 'US'
        ELSE
            SET @CountryCode = NULL
        
        DECLARE
            @TY DATE ,
            @LY DATE
        SET @TY = '1/1/' + CAST(@intYear AS CHAR(4))
        SET @LY = '1/1/' + CAST(@intYear - 1 AS CHAR(4))

        IF @System = 'All'
            BEGIN 
                SELECT TOP 10
                    SUM(data.ytd) AS ytd ,
                    SUM(data.lyytd) AS lyytd ,
                    data.IndustryType
                FROM
                    ( SELECT
                        SUM(CASE WHEN O.PickedUpDate BETWEEN @TY AND @dateto
                                 THEN O.SalesSubtotal
                                 ELSE 0
                            END) AS ytd ,
                        SUM(CASE WHEN O.PickedUpDate BETWEEN @LY
                                                     AND     DATEADD(YEAR, -1,
                                                              @dateto)
                                 THEN O.SalesSubtotal
                                 ELSE 0
                            END) AS lyytd ,
                        IT.CleanedIndustry AS IndustryType
                      FROM
                        FII_ODS.Orders.OrderHeaderFact O WITH ( NOLOCK )
                        INNER JOIN FII_ODS.Contact.CustomerFact CF WITH ( NOLOCK ) ON O.CustomerKey = CF.CustomerKey
                        INNER JOIN FII_ODS.Contact.IndustryDim ID WITH ( NOLOCK ) ON CF.IndustryTypeID = ID.IndustryTypeID
                                                              AND CF.ZW_Franchise_ID = ID.ZW_Franchise_ID
                        INNER JOIN FII_ODS.Contact.IndustryTypeDim IT WITH ( NOLOCK ) ON ID.IndustryTypeKey = IT.IndustryTypeKey
                        INNER JOIN FII_ODS.Store.StoreFact Store WITH ( NOLOCK ) ON Store.CenterKey = O.CenterKey
                      WHERE
                        ( Store.Region = @Region
                          OR @Region = 'All'
                          OR @Region = 'All US'
                        )
                        AND ( Store.CountryKey = @CountryKey
                              OR @CountryKey IS NULL
                            )
                        AND O.PickedUpDate > @LY
  --      AND O.ZW_Franchise_ID = @franchise
                      GROUP BY
                        IT.CleanedIndustry
                      UNION
                      SELECT
                        SUM(CASE WHEN O.OrderCompletionDate BETWEEN @TY AND @dateto
                                 THEN O.Amount
                                 ELSE 0
                            END) AS ytd ,
                        SUM(CASE WHEN O.OrderCompletionDate BETWEEN @LY
                                                            AND
                                                              DATEADD(YEAR, -1,
                                                              @dateto)
                                 THEN O.Amount
                                 ELSE 0
                            END) AS lyytd ,
                        O.IndustryType
                      FROM
                        CoreBridgeCentral.dbo.vw_Locations L WITH ( NOLOCK )
                        INNER JOIN CoreBridgeCentral.dbo.SalesResultsAllDispositions O
                        WITH ( NOLOCK ) ON L.Value = O.CompanyLocationId
                        INNER JOIN CoreBridgeCentral.dbo.vw_Store Store WITH ( NOLOCK ) ON Store.ZW_Franchise_ID = L.ZW_Franchise_ID
                      WHERE
                        ( Store.Region = @Region
                          OR @Region = 'All'
                          OR @Region = 'All US'
                        )
                        AND ( Store.CountryCode = @CountryCode
                              OR @CountryKey IS NULL
                            )
                        AND O.OrderCompletionDate >= @LY
                        AND O.OrderCompletionDate < @dateto
                      GROUP BY
                        O.IndustryType
                    ) data
                GROUP BY
                    data.IndustryType
                ORDER BY
                    ytd DESC
            END
        IF @System = 'Cyrious'
            BEGIN
                SELECT TOP 10
                    SUM(CASE WHEN O.PickedUpDate BETWEEN @TY AND @dateto
                             THEN O.SalesSubtotal
                             ELSE 0
                        END) AS ytd ,
                    SUM(CASE WHEN O.PickedUpDate BETWEEN @LY
                                                 AND     DATEADD(YEAR, -1,
                                                              @dateto)
                             THEN O.SalesSubtotal
                             ELSE 0
                        END) AS lyytd ,
                    IT.CleanedIndustry AS IndustryType
                FROM
                    FII_ODS.Orders.OrderHeaderFact O WITH ( NOLOCK )
                    INNER JOIN FII_ODS.Contact.CustomerFact CF WITH ( NOLOCK ) ON O.CustomerKey = CF.CustomerKey
                    INNER JOIN FII_ODS.Contact.IndustryDim ID WITH ( NOLOCK ) ON CF.IndustryTypeID = ID.IndustryTypeID
                                                              AND CF.ZW_Franchise_ID = ID.ZW_Franchise_ID
                    INNER JOIN FII_ODS.Contact.IndustryTypeDim IT WITH ( NOLOCK ) ON ID.IndustryTypeKey = IT.IndustryTypeKey
                    INNER JOIN FII_ODS.Store.StoreFact Store WITH ( NOLOCK ) ON Store.CenterKey = O.CenterKey
                WHERE
                    ( Store.Region = @Region
                      OR @Region = 'All'
                      OR @Region = 'All US'
                    )
                    AND ( Store.CountryKey = @CountryKey
                          OR @CountryKey IS NULL
                        )
                    AND O.PickedUpDate > @LY
  --      AND O.ZW_Franchise_ID = @franchise
                GROUP BY
                    IT.CleanedIndustry
                ORDER BY
                    ytd DESC
            END
        IF @System = 'CoreBridge'
            BEGIN
                SELECT TOP 10
                    SUM(CASE WHEN O.OrderCompletionDate BETWEEN @TY AND @dateto
                             THEN O.Amount
                             ELSE 0
                        END) AS ytd ,
                    SUM(CASE WHEN O.OrderCompletionDate BETWEEN @LY
                                                        AND   DATEADD(YEAR, -1,
                                                              @dateto)
                             THEN O.Amount
                             ELSE 0
                        END) AS lyytd ,
                    O.IndustryType
                FROM
                    CoreBridgeCentral.dbo.vw_Locations L WITH ( NOLOCK )
                    INNER JOIN CoreBridgeCentral.dbo.SalesResultsAllDispositions O
                    WITH ( NOLOCK ) ON L.Value = O.CompanyLocationId
                    INNER JOIN CoreBridgeCentral.dbo.vw_Store Store WITH ( NOLOCK ) ON Store.ZW_Franchise_ID = L.ZW_Franchise_ID
                WHERE
                    ( Store.Region = @Region
                      OR @Region = 'All'
                      OR @Region = 'All US'
                    )
                    AND ( Store.CountryCode = @CountryCode
                          OR @CountryKey IS NULL
                        )
                    AND O.OrderCompletionDate >= @LY
                    AND O.OrderCompletionDate < @dateto
                GROUP BY
                    IndustryType
                ORDER BY
                    ytd DESC
            END
    END

GO
