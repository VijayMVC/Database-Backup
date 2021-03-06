/****** Object:  StoredProcedure [dbo].[excel_RPM_Percent]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE excel_RPM_Percent
AS 
    BEGIN

        DECLARE @BeginDate DATETIME
        SET @BeginDate = '1/1/2014'
        DECLARE @EndDate DATETIME
        SET @EndDate = GETDATE()

        SELECT
            Stores.ZW_Franchise_ID ,
            0 AS RPM ,
            StoreOpenDate ,
            ResaleOpenDate ,
            TimeDim.*
        INTO
            #Dates
        FROM
            System.TimeDim
            CROSS JOIN ( SELECT DISTINCT
                            Orders.OrderHeaderFact.ZW_Franchise_ID
                         FROM
                            Orders.OrderHeaderFact
                         WHERE
                            OLTP_UpdateDate >= @BeginDate
                            AND OLTP_UpdateDate < @EndDate
                       ) Stores
            JOIN Store.StoreFact ON Stores.ZW_Franchise_ID = StoreFact.ZW_Franchise_ID
                                    AND StoreFact.Status > 0
            LEFT JOIN System.StoreControl ON StoreFact.ZW_Franchise_ID = StoreControl.ZW_Franchise_ID
        WHERE
            ( ( PK_Date >= @BeginDate
                AND PK_Date >= Store.StoreFact.StoreOpenDate
                AND ISNULL(Store.StoreFact.ResaleOpenDate, '1/1/1980') <= Store.StoreFact.StoreOpenDate
              )
              OR ( PK_Date >= @BeginDate
                   AND PK_Date >= Store.StoreFact.ResaleOpenDate
                   AND ISNULL(Store.StoreFact.ResaleOpenDate, '1/1/1980') > Store.StoreFact.StoreOpenDate
                 )
            )
            AND PK_Date < @EndDate
            AND ISNULL(System.StoreControl.AsOfDate, GETDATE() + 1) > GETDATE()


        UPDATE
            #Dates
        SET 
            RPM = 1
        FROM
            #Dates
            JOIN ( SELECT DISTINCT
                    Orders.OrderHeaderFact.ZW_Franchise_ID ,
                    CAST(CONVERT([Char](10), Orders.OrderHeaderFact.OLTP_UpdateDate, 101) AS DATETIME) AS Orders
                   FROM
                    Orders.OrderHeaderFact
                 ) OH ON #Dates.ZW_Franchise_ID = OH.ZW_Franchise_ID
                         AND OH.Orders = #Dates.PK_Date 
 
 
        SELECT
            zw_franchise_id ,
            StoreOpenDate ,
            ResaleOpenDate ,
            CONVERT(CHAR(10), PK_date, 101) AS ProcessDate ,
            DATENAME(dw, pk_date) AS Weekday ,
            DATEPART(dw, pk_date) AS DayNumber ,
	--DATEPART(dw,pk_date),
            RPM AS Records
        INTO
            #Data
        FROM
            #Dates
        WHERE
            DATEPART(dw, pk_date) > 1
            AND DATEPART(dw, pk_date) < 7
        ORDER BY
            PK_Date

        SELECT
            zw_franchise_id ,
            Weekday ,
            DayNumber ,
            SUM(1) AS WorkingDays ,
            SUM(CASE WHEN Records > 0 THEN 1
                     ELSE 0
                END) AS Records ,
            AVG(CASE WHEN Records > 0 THEN 1.00
                     ELSE 0.00
                END) * 100 AS PercentReport ,
            StoreOpenDate ,
            ResaleOpenDate
        FROM
            #Data
        GROUP BY
            zw_franchise_id ,
            Weekday ,
            DayNumber ,
            StoreOpenDate ,
            ResaleOpenDate
        ORDER BY
            1 ,
            3

        DROP TABLE #Dates
        DROP TABLE #Data


    END

GO
