/****** Object:  StoredProcedure [dbo].[rpt_BI_Top10ProductCategories]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 1/24/2017
-- Description:	Top 10 Product Categories Report
-- =============================================
CREATE PROCEDURE [dbo].[rpt_BI_Top10ProductCategories]
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
                                 THEN FII_ODS.Orders.OrderDetailFact.ItemTotal
                                 ELSE 0.00
                            END) AS ytd ,
                        SUM(CASE WHEN O.PickedUpDate BETWEEN @LY
                                                     AND     DATEADD(YEAR, -1,
                                                              @dateto)
                                 THEN FII_ODS.Orders.OrderDetailFact.ItemTotal
                                 ELSE 0.00
                            END) AS lyytd ,
                        FII_ODS.Product.ProductCategoryFact.ProductCategoryName AS IndustryType
                      FROM
                        FII_ODS.Orders.OrderDetailFact
                        INNER JOIN FII_ODS.Orders.OrderHeaderFact O ON O.OrderHeaderKey = FII_ODS.Orders.OrderDetailFact.OrderHeaderKey
                        INNER JOIN FII_ODS.Product.ProductFact ON FII_ODS.Orders.OrderDetailFact.ProductKey = FII_ODS.Product.ProductFact.ProductKey
                        INNER JOIN FII_ODS.Product.ProductCategoryFact ON FII_ODS.Product.ProductFact.ZW_Franchise_ID = FII_ODS.Product.ProductCategoryFact.ZW_Franchise_ID
                                                              AND FII_ODS.Product.ProductFact.ProductCategoryID = FII_ODS.Product.ProductCategoryFact.ProductCategoryID
                        INNER JOIN FII_ODS.Store.StoreFact Store ON FII_ODS.Orders.OrderDetailFact.CenterKey = Store.CenterKey
                      WHERE
                        ( Store.Region = @Region
                          OR @Region = 'All'
                          OR @Region = 'All US'
                        )
                        AND ( Store.CountryKey = @CountryKey
                              OR @CountryKey IS NULL
                            )
                        AND O.PickedUpDate > @LY
                      GROUP BY
                        FII_ODS.Product.ProductCategoryFact.ProductCategoryName
                      UNION
                      SELECT
                        SUM(CASE WHEN O.OrderCompletionDate BETWEEN @TY AND @dateto
                                 THEN O.Amount
                                 ELSE 0.00
                            END) AS ytd ,
                        SUM(CASE WHEN O.OrderCompletionDate BETWEEN @LY
                                                            AND
                                                              DATEADD(YEAR, -1,
                                                              @dateto)
                                 THEN O.Amount
                                 ELSE 0.00
                            END) AS lyytd ,
                        O.ProductCategory AS IndustryType
                      FROM
                        CoreBridgeCentral.dbo.SalesResultsAllDispositions O
                        INNER JOIN CoreBridgeCentral.dbo.vw_Locations ON O.CompanyLocationId = CoreBridgeCentral.dbo.vw_Locations.Value
                        INNER JOIN CoreBridgeCentral.dbo.vw_Store Store ON CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID = Store.ZW_Franchise_ID
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
                        O.ProductCategory
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
                             THEN FII_ODS.Orders.OrderDetailFact.ItemTotal
                             ELSE 0.00
                        END) AS ytd ,
                    SUM(CASE WHEN O.PickedUpDate BETWEEN @LY
                                                 AND     DATEADD(YEAR, -1,
                                                              @dateto)
                             THEN FII_ODS.Orders.OrderDetailFact.ItemTotal
                             ELSE 0.00
                        END) AS lyytd ,
                    FII_ODS.Product.ProductCategoryFact.ProductCategoryName AS IndustryType
                FROM
                    FII_ODS.Orders.OrderDetailFact
                    INNER JOIN FII_ODS.Orders.OrderHeaderFact O ON O.OrderHeaderKey = FII_ODS.Orders.OrderDetailFact.OrderHeaderKey
                    INNER JOIN FII_ODS.Product.ProductFact ON FII_ODS.Orders.OrderDetailFact.ProductKey = FII_ODS.Product.ProductFact.ProductKey
                    INNER JOIN FII_ODS.Product.ProductCategoryFact ON FII_ODS.Product.ProductFact.ZW_Franchise_ID = FII_ODS.Product.ProductCategoryFact.ZW_Franchise_ID
                                                              AND FII_ODS.Product.ProductFact.ProductCategoryID = FII_ODS.Product.ProductCategoryFact.ProductCategoryID
                    INNER JOIN FII_ODS.Store.StoreFact Store ON FII_ODS.Orders.OrderDetailFact.CenterKey = Store.CenterKey
                WHERE
                    ( Store.Region = @Region
                      OR @Region = 'All'
                      OR @Region = 'All US'
                    )
                    AND ( Store.CountryKey = @CountryKey
                          OR @CountryKey IS NULL
                        )
                    AND O.PickedUpDate > @LY
                GROUP BY
                    FII_ODS.Product.ProductCategoryFact.ProductCategoryName
                ORDER BY
                    ytd DESC
            END
        IF @System = 'CoreBridge'
            BEGIN
                SELECT TOP 10
                    SUM(CASE WHEN O.OrderCompletionDate BETWEEN @TY AND @dateto
                             THEN O.Amount
                             ELSE 0.00
                        END) AS ytd ,
                    SUM(CASE WHEN O.OrderCompletionDate BETWEEN @LY
                                                        AND   DATEADD(YEAR, -1,
                                                              @dateto)
                             THEN O.Amount
                             ELSE 0.00
                        END) AS lyytd ,
                    O.ProductCategory AS IndustryType
                FROM
                    CoreBridgeCentral.dbo.SalesResultsAllDispositions O
                    INNER JOIN CoreBridgeCentral.dbo.vw_Locations ON O.CompanyLocationId = CoreBridgeCentral.dbo.vw_Locations.Value
                    INNER JOIN CoreBridgeCentral.dbo.vw_Store Store ON CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID = Store.ZW_Franchise_ID
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
                    O.ProductCategory
                ORDER BY
                    ytd DESC
            END
    END

GO
