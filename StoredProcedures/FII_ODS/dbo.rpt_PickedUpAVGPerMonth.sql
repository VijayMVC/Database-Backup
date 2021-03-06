/****** Object:  StoredProcedure [dbo].[rpt_PickedUpAVGPerMonth]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





/****** Object:  StoredProcedure [dbo].[rpt_PickedUpAVGPerMonth]    Script Date: 7/29/2014 12:29:50 PM ******/

CREATE PROCEDURE [dbo].[rpt_PickedUpAVGPerMonth]
    (
     @Country VARCHAR(2) = 'US'
    ,@ReportDate DATETIME = NULL
    )
AS
    SET NOCOUNT ON
					 
					   
 --DECLARE @Country VARCHAR(50)  --='US',	
 --DECLARE @ReportDate DATETIME  --= NULL
 --SET @Country = 'US'

    DECLARE @MonthNum INT
    DECLARE @SalesMonthLastYear DATETIME
    DECLARE @SalesMonthThisYear DATETIME
    DECLARE @EndDateLastYear DATETIME
    DECLARE @EndDateThisYear DATETIME
    DECLARE @FirstOfNextMonth DATETIME
    DECLARE @FirstOfNextMonthLastYear DATETIME
    DECLARE @StoreCount INT
    DECLARE @Sales DECIMAL(19, 6)
    DECLARE @AvgSalesDifference DECIMAL(19, 6)

    DECLARE @TotalSalesLastYear DECIMAL(19, 6)
    DECLARE @TotalSalesThisYear DECIMAL(19, 6)
    DECLARE @TotalSalesDifference DECIMAL(19, 6)

    DECLARE @SalesDiffPercentage DECIMAL(19, 6)
    DECLARE @TotalAVGBusinessDaySalesDiffPercentage DECIMAL(19, 6)


    SET @FirstOfNextMonth = DATEADD(MONTH, 1,
                                    DATEADD(MONTH,
                                            DATEDIFF(MONTH, +1, GETDATE()), 0))

    SET @FirstOfNextMonthLastYear = DATEADD(YEAR, -1, @FirstOfNextMonth)

    DECLARE @AVGBusinessDaySalesLastYear DECIMAL(19, 6)
    DECLARE @AVGBusinessDaySalesThisYear DECIMAL(19, 6)
    DECLARE @TotalBusinessDaySalesLastYearAVG DECIMAL(19, 6)
    DECLARE @TotalBusinessDaySalesThisYearAVG DECIMAL(19, 6)
    DECLARE @TotalAVGBusinessDaySalesDiff DECIMAL(19, 6)
	
    DECLARE @WorkdaysThisYear INT
    DECLARE @WorkdaysLastYear INT
    DECLARE @TotalWorkdaysThisYear INT
    DECLARE @TotalWorkdaysLastYear INT

	  /* set up the account codes filter */
DECLARE @AccountsTable TABLE (AccountCode INT)
INSERT INTO @AccountsTable (AccountCode)
VALUES(4001),(4002),(4003),(4110),(4120) /*,(4165),(4401),(4410),(4410)*/
	

    IF @ReportDate IS NULL
        BEGIN
    
            SET @ReportDate = DATEADD(dd, -1, GETDATE())
        END

    SET @SalesMonthThisYear = CAST(( CAST(YEAR(@ReportDate) AS VARCHAR(4))
                                     + '-01-01 00:00:00.000' ) AS DATETIME)
    SET @SalesMonthLastYear = DATEADD(yy, -1, @SalesMonthThisYear)
    SET @TotalSalesLastYear = 0.000000
    SET @TotalSalesThisYear = 0.000000
    SET @TotalSalesDifference = 0.000000
    SET @AvgSalesDifference = 0.000000

    SET @TotalWorkdaysThisYear = 0
    SET @TotalWorkdaysLastYear = 0

    SET @TotalBusinessDaySalesLastYearAVG = 0.000000
    SET @TotalBusinessDaySalesThisYearAVG = 0.000000
    SET @MonthNum = 1
		
    CREATE  TABLE #MonthlySales
        (
         [Year] INT
        ,[Month] INT
        ,[StoreCount] INT
        ,[Sales] DECIMAL(19, 6)
        ,[BusinessDays] INT
        ,[AVGBusinessDaySales] DECIMAL(19, 6)
        ,[AVGBusinessDaySalesDiff] DECIMAL(19, 6)
        ,[SalesDiffPercentage] DECIMAL(19, 6)
        )

    WHILE @MonthNum <= DATEPART(MONTH, @ReportDate)
        BEGIN
            IF @MonthNum = DATEPART(MONTH, @ReportDate)
                BEGIN
                    SET @EndDateLastYear = DATEADD(dd,
                                                   DATEPART(day, @ReportDate),
                                                   @SalesMonthLastYear)
                    SET @EndDateThisYear = DATEADD(dd,
                                                   DATEPART(day, @ReportDate),
                                                   @SalesMonthThisYear)

                    SET @WorkdaysLastYear = ( SELECT
                                                COUNT(*)
                                              FROM
                                                [FII_ODS].[System].[Calendar]
                                              WHERE
                                                IsWorkDay = 1
                                                AND dt >= @SalesMonthLastYear
                                                AND dt < @EndDateLastYear
                                            )
                    SET @WorkdaysThisYear = ( SELECT
                                                COUNT(*)
                                              FROM
                                                [FII_ODS].[System].[Calendar]
                                              WHERE
                                                IsWorkDay = 1
                                                AND dt >= @SalesMonthThisYear
                                                AND dt < @EndDateThisYear
                                            )
                    SET @WorkdaysLastYear = CASE WHEN @WorkdaysLastYear = 0
                                                 THEN 1
                                                 ELSE @WorkdaysLastYear
                                            END
                    SET @WorkdaysThisYear = CASE WHEN @WorkdaysThisYear = 0
                                                 THEN 1
                                                 ELSE @WorkdaysThisYear
                                            END

--PRINT '@MonthNum' 
--PRINT @MonthNum
--PRINT '@EndDateLastYear'  
--PRINT @EndDateLastYear
--PRINT '@EndDateThisYear'  
--PRINT @EndDateThisYear
--PRINT '@WorkdaysLastYear'  
--PRINT @WorkdaysLastYear
--PRINT '@WorkdaysThisYear'  
--PRINT @WorkdaysThisYear

                END
            ELSE
                BEGIN
                    SET @EndDateLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
                    SET @EndDateThisYear = DATEADD(mm, 1, @SalesMonthThisYear)

                    SET @WorkdaysLastYear = ( SELECT
                                                COUNT(*)
                                              FROM
                                                [FII_ODS].[System].[Calendar]
                                              WHERE
                                                IsWorkDay = 1
                                                AND dt >= @SalesMonthLastYear
                                                AND dt < @EndDateLastYear
                                            )
                    SET @WorkdaysThisYear = ( SELECT
                                                COUNT(*)
                                              FROM
                                                [FII_ODS].[System].[Calendar]
                                              WHERE
                                                IsWorkDay = 1
                                                AND dt >= @SalesMonthThisYear
                                                AND dt < @EndDateThisYear
                                            )

--PRINT '@MonthNum' 
--PRINT @MonthNum
--PRINT '@EndDateLastYear'  
--PRINT @EndDateLastYear
--PRINT '@EndDateThisYear'  
--PRINT @EndDateThisYear
--PRINT '@WorkdaysLastYear'  
--PRINT @WorkdaysLastYear
--PRINT '@WorkdaysThisYear'  
--PRINT @WorkdaysThisYear

                END

	/*--Last Year */
            SELECT
                @Sales = SUM(g.Amount) * -1
            ,   @AVGBusinessDaySalesLastYear = ( SUM(g.Amount) * -1 )
                / @WorkdaysLastYear
            ,   @StoreCount = COUNT(DISTINCT ( g.ZW_Franchise_ID ))
            FROM
                [FII_ODS].GL.GLFact g WITH ( NOLOCK )
                INNER JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g.CenterKey = s.CenterKey  --g.ZW_Franchise_ID = s.ZW_Franchise_ID
                INNER JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                INNER JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
            WHERE
                     g.AccountCode IN (select AccountCode from @AccountsTable )
                AND s.StoreOpenDate <= @SalesMonthLastYear
                AND g.TransactionDateTime >= @SalesMonthLastYear
                AND g.TransactionDateTime < @EndDateLastYear
                AND c.CountryCode = @Country
                AND op.OperationalName <> 'Closed'
                AND g.TransactionDateTime < @FirstOfNextMonthLastYear
                AND ( ( SELECT
                            SUM(g2.Amount) * -1
                        FROM
                            [FII_ODS].GL.GLFact g2 WITH ( NOLOCK )
                            JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g2.CenterKey = s.CenterKey  --g.ZW_Franchise_ID = s.ZW_Franchise_ID g2.ZW_Franchise_ID = s.ZW_Franchise_ID
                            JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                            JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
                        WHERE
                            g2.AccountCode IN (select AccountCode from @AccountsTable )
                            AND g.CenterKey = g2.CenterKey -- g.ZW_Franchise_ID =  g2.ZW_Franchise_ID
                            AND g2.TransactionDateTime >= @SalesMonthThisYear
                            AND g2.TransactionDateTime < @EndDateThisYear
                      ) > 0 )
                AND ( ( SELECT
                            SUM(g3.Amount) * -1
                        FROM
                            [FII_ODS].GL.GLFact g3 WITH ( NOLOCK )
                            JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g3.CenterKey = s.CenterKey -- g3.ZW_Franchise_ID = s.ZW_Franchise_ID
                            JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                            JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
                        WHERE
                            g3.AccountCode IN (select AccountCode from @AccountsTable )
                            AND g.CenterKey = g3.CenterKey --  g.ZW_Franchise_ID =  g3.ZW_Franchise_ID
                            AND g3.TransactionDateTime >= @SalesMonthLastYear
                            AND g3.TransactionDateTime < @EndDateLastYear
                      ) > 0 )
			
		
            SET @AvgSalesDifference = 0.000000 
            SET @SalesDiffPercentage = 0.000000 							
				  
            INSERT  INTO #MonthlySales
                    ( [Year]
                    ,[Month]
                    ,[StoreCount]
                    ,[Sales]
                    ,[BusinessDays]
                    ,[AVGBusinessDaySales]
                    ,[AVGBusinessDaySalesDiff]
                    ,[SalesDiffPercentage]
                    )
            VALUES
                    ( DATEPART(year, @SalesMonthLastYear)
                    ,@MonthNum
                    ,@StoreCount
                    ,@Sales
                    ,@WorkdaysLastYear
                    ,@AVGBusinessDaySalesLastYear
                    ,@AVGSalesDifference
                    ,@SalesDiffPercentage
                    )
            SET @TotalSalesLastYear = @TotalSalesLastYear + @Sales
	
            SET @TotalWorkdaysLastYear = @TotalWorkdaysLastYear
                + @WorkdaysLastYear

            SET @TotalBusinessDaySalesLastYearAVG = @TotalBusinessDaySalesLastYearAVG
                + @TotalSalesLastYear
	
		/*--This Year */
            SELECT
                @Sales = SUM(g.Amount) * -1
            ,   @AVGBusinessDaySalesThisYear = ( SUM(g.Amount) * -1 )
                / @WorkdaysThisYear
            ,   @StoreCount = COUNT(DISTINCT ( g.ZW_Franchise_ID ))
            FROM
                [FII_ODS].GL.GLFact g WITH ( NOLOCK )
                INNER JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g.CenterKey = s.CenterKey
                INNER JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                INNER JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
            WHERE
                g.AccountCode IN (select AccountCode from @AccountsTable )
                AND s.StoreOpenDate <= @SalesMonthLastYear
                AND g.TransactionDateTime >= @SalesMonthThisYear
                AND g.TransactionDateTime < @EndDateThisYear
                AND c.CountryCode = @Country
                AND op.OperationalName <> 'Closed'
                AND g.TransactionDateTime < @FirstOfNextMonth
                AND ( ( SELECT
                            SUM(g2.Amount) * -1
                        FROM
                            [FII_ODS].GL.GLFact g2 WITH ( NOLOCK )
                            JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g2.CenterKey = s.CenterKey
                            JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                            JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
                        WHERE
                            g2.AccountCode IN (select AccountCode from @AccountsTable )
                            AND g.CenterKey = g2.CenterKey
                            AND g2.TransactionDateTime >= @SalesMonthThisYear
                            AND g2.TransactionDateTime < @EndDateThisYear
                      ) > 0 )
                AND ( ( SELECT
                            SUM(g3.Amount) * -1
                        FROM
                            [FII_ODS].GL.GLFact g3 WITH ( NOLOCK )
                            JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g3.CenterKey = s.CenterKey
                            JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                            JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
                        WHERE
                            g3.AccountCode IN (select AccountCode from @AccountsTable )
                            AND g.CenterKey = g3.CenterKey
                            AND g3.TransactionDateTime >= @SalesMonthLastYear
                            AND g3.TransactionDateTime < @EndDateLastYear
                      ) > 0 )
			
			
            SET @AvgSalesDifference = @AVGBusinessDaySalesThisYear
                - @AVGBusinessDaySalesLastYear
		

          /* --  SET @SalesDiffPercentage = @AvgSalesDifference
                / @AVGBusinessDaySalesThisYear	 changed per Ron Herbert 20141027 - efw*/		
				
	           SET @SalesDiffPercentage = @AvgSalesDifference
                / @AVGBusinessDaySalesLastYear	 
				

--print '@SalesDiffPercentage ' PRINT @SalesDiffPercentage
--print '@AvgSalesDifference ' PRINT @AvgSalesDifference
--PRINT '@AVGBusinessDaySalesThisYear ' PRINT @AVGBusinessDaySalesThisYear		
--PRINT '@AVGBusinessDaySalesLASTYear ' PRINT @AVGBusinessDaySalesLastYear	

            INSERT  INTO #MonthlySales
                    ( [Year]
                    ,[Month]
                    ,[StoreCount]
                    ,[Sales]
                    ,[BusinessDays]
                    ,[AVGBusinessDaySales]
                    ,[AVGBusinessDaySalesDiff]
                    ,[SalesDiffPercentage]
                    )
            VALUES
                    ( DATEPART(year, @SalesMonthThisYear)
                    ,@MonthNum
                    ,@StoreCount
                    ,@Sales
                    ,@WorkdaysThisYear
                    ,@AVGBusinessDaySalesThisYear
                    ,@AVGSalesDifference
                    ,@SalesDiffPercentage
                    )		
		
							  
            SET @TotalSalesThisYear = @TotalSalesThisYear + @Sales

            SET @TotalWorkdaysThisYear = @TotalWorkdaysThisYear
                + @WorkdaysThisYear

            SET @TotalBusinessDaySalesThisYearAVG = @TotalBusinessDaySalesThisYearAVG
                + @TotalSalesThisYear

            SET @MonthNum = @MonthNum + 1
            SET @SalesMonthLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
            SET @SalesMonthThisYear = DATEADD(mm, 1, @SalesMonthThisYear)       
       			  
        END

    SET @TotalBusinessDaySalesLastYearAVG = @TotalSalesLastYear
        / @TotalWorkdaysLastYear

    SET @TotalBusinessDaySalesThisYearAVG = @TotalSalesThisYear
        / @TotalWorkdaysThisYear


    SET @TotalAVGBusinessDaySalesDiff = @TotalBusinessDaySalesThisYearAVG
        - @TotalBusinessDaySalesLastYearAVG
	
		  /***********/
	--PRINT '@TotalBusinessDaySalesThisYearAVG:' 
	--PRINT @TotalBusinessDaySalesThisYearAVG
    --PRINT '@TotalBusinessDaySalesLastYearAVG:' 
	--PRINT @TotalBusinessDaySalesLastYearAVG
	--PRINT '@TotalAVGBusinessDaySalesDiff:'     
	--PRINT @TotalAVGBusinessDaySalesDiff
		/*************/
	
    /*SET @TotalAVGBusinessDaySalesDiffPercentage = @TotalAVGBusinessDaySalesDiff
        / @TotalBusinessDaySalesThisYearAVG per Ron Herbert 20141027 */

		SET @TotalAVGBusinessDaySalesDiffPercentage = @TotalAVGBusinessDaySalesDiff
        / @TotalBusinessDaySalesLastYearAVG 
	  
    INSERT  INTO #MonthlySales
            ( [Year]
            ,[Month]
            ,[Sales]
            ,[BusinessDays]
            ,[AVGBusinessDaySales]
            ,[AVGBusinessDaySalesDiff]
            ,[SalesDiffPercentage]
            )
    VALUES
            ( DATEPART(YEAR, DATEADD(yy, -1, @ReportDate))
            ,13
            ,@TotalSalesLastYear
            ,@TotalWorkdaysLastYear
            ,@TotalBusinessDaySalesLastYearAVG
            ,0.000000
            ,0.000000
            )
    INSERT  INTO #MonthlySales
            ( [Year]
            ,[Month]
            ,[Sales]
            ,[BusinessDays]
            ,[AVGBusinessDaySales]
            ,[AVGBusinessDaySalesDiff]
            ,[SalesDiffPercentage]
            )
    VALUES
            ( DATEPART(YEAR, @ReportDate)
            ,13
            ,@TotalSalesThisYear
            ,@TotalWorkdaysThisYear
            ,@TotalBusinessDaySalesThisYearAVG  /* should be divided by number of total business days */
            ,@TotalAVGBusinessDaySalesDiff
            ,@TotalAVGBusinessDaySalesDiffPercentage
            )

    SELECT
        [Year]
    ,   [Month]
    ,   [StoreCount]
    ,   [Sales]
    ,   [BusinessDays]
    ,   [AVGBusinessDaySales]
    ,   [AVGBusinessDaySalesDiff]
    ,   [SalesDiffPercentage]
    FROM
        #MonthlySales
    ORDER BY
        [Year]
    ,   [Month]

	  
    DROP TABLE #MonthlySales
	



GO
