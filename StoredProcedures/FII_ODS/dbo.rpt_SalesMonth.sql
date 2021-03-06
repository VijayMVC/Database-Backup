/****** Object:  StoredProcedure [dbo].[rpt_SalesMonth]    Script Date: 5/15/2018 12:09:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE [dbo].[rpt_SalesMonth] -- 'SA', '11/04/2013'
    (
      @Country VARCHAR(2)='US',	
      @ReportDate DATETIME = NULL
    )
AS 
    SET NOCOUNT ON
	                /* used by Orders Picked Up report */

					  /* modified to use new ODS, also added more countries to split them from US.  Based on proc from original DW - efw 20130213 */
DECLARE @MonthNum INT
DECLARE @SalesMonthLastYear DATETIME
DECLARE @SalesMonthThisYear DATETIME
DECLARE @EndDateLastYear DATETIME
DECLARE @EndDateThisYear DATETIME
DECLARE @FirstOfNextMonth DATETIME
DECLARE @FirstOfNextMonthLastYear DATETIME
DECLARE @StoreCount INT
DECLARE @Sales MONEY
DECLARE @TotalSalesLastYear MONEY
DECLARE @TotalSalesThisYear MONEY

SET @FirstOfNextMonth = DATEADD(month,1,DATEADD(month, DATEDIFF(month, +1, GETDATE()), 0) )
SET @FirstOfNextMonthLastYear = DATEADD(year,-1,@FirstOfNextMonth)

 /* first day of current month  to prevent future entries from appearing  */

IF @ReportDate IS NULL 
    BEGIN
    
        SET @ReportDate = DATEADD(dd, -1, GETDATE())
    END

SET @SalesMonthThisYear = CAST(( CAST(YEAR(@ReportDate) AS VARCHAR(4))
                                 + '-01-01 00:00:00.000' ) AS DATETIME)
SET @SalesMonthLastYear = DATEADD(yy, -1, @SalesMonthThisYear)
SET @TotalSalesLastYear = 0
SET @TotalSalesThisYear = 0
SET @MonthNum = 1
		

CREATE TABLE #MonthlySales
    (
      [Year] INT
    , [Month] INT
    , [StoreCount] INT
    , [Sales] MONEY
    )

--WHILE @MonthNum <= 12 --DATEPART(month, @ReportDate) /* efw */
WHILE @MonthNum <=DATEPART(month, @ReportDate)
    BEGIN
        IF @MonthNum = DATEPART(month, @ReportDate)
            BEGIN
                SET @EndDateLastYear = DATEADD(dd, DATEPART(day, @ReportDate),
                                               @SalesMonthLastYear)
                SET @EndDateThisYear = DATEADD(dd, DATEPART(day, @ReportDate),
                                               @SalesMonthThisYear)
            END
        ELSE
            BEGIN
                SET @EndDateLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
                SET @EndDateThisYear = DATEADD(mm, 1, @SalesMonthThisYear)
            END
			
			 
	/*--Last Year */
        SELECT  @Sales = SUM(g.Amount) * -1
              , @StoreCount = COUNT(DISTINCT ( g.ZW_Franchise_ID ))
        FROM    [FII_ODS].GL.GLFact g WITH ( NOLOCK )
                JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g.ZW_Franchise_ID = s.ZW_Franchise_ID
                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
        WHERE   g.AccountCode IN ( 4001, 4002, 4003, 4110, 4120 )
                AND s.StoreOpenDate <= @SalesMonthLastYear
                AND g.TransactionDateTime >= @SalesMonthLastYear
                AND g.TransactionDateTime < @EndDateLastYear
                AND c.CountryCode = @Country
                AND op.OperationalName <> 'Closed'
          AND  g.TransactionDateTime < @FirstOfNextMonthLastYear
		 
                AND ( ( SELECT  ( SUM(gl.Amount) * -1 )
                        FROM    [FII_ODS].GL.GLFact gl WITH ( NOLOCK )
                                JOIN [FII_ODS].Store.StoreFact sf WITH ( NOLOCK ) ON gl.ZW_Franchise_ID = sf.ZW_Franchise_ID
                                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON Sf.CountryKey = C.CountryKey
                                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON Sf.OperationalKey = OP.OperationalKey
                        WHERE   gl.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                    4120 )
                                AND s.ZW_Franchise_ID = gl.ZW_Franchise_ID
                                AND gl.TransactionDateTime >= @SalesMonthThisYear
                                AND gl.TransactionDateTime < @EndDateThisYear
                      ) > 0 )
                AND ( ( SELECT  ( SUM(gl.Amount) * -1 )
                        FROM    [FII_ODS].GL.GLFact gl WITH ( NOLOCK )
                                JOIN [FII_ODS].Store.StoreFact sf WITH ( NOLOCK ) ON gl.ZW_Franchise_ID = sf.ZW_Franchise_ID
                                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON Sf.CountryKey = C.CountryKey
                                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON Sf.OperationalKey = OP.OperationalKey
                        WHERE   gl.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                    4120 )
                                AND s.ZW_Franchise_ID = gl.ZW_Franchise_ID
                                AND gl.TransactionDateTime >= @SalesMonthLastYear
                                AND gl.TransactionDateTime < @EndDateLastYear
                      ) > 0 )
		  /**/

		  
								
				  
        INSERT  INTO #MonthlySales
                ( [Year]
                , [Month]
                , [StoreCount]
                , [Sales]
                
                )
        VALUES  ( DATEPART(year, @SalesMonthLastYear)
                , @MonthNum
                , @StoreCount
                , @Sales
                
                )
        SET @TotalSalesLastYear = @TotalSalesLastYear + @Sales
	
		/*--This Year */
        SELECT  @Sales = SUM(g.Amount) * -1
              , @StoreCount = COUNT(DISTINCT ( g.ZW_Franchise_ID ))
        FROM    [FII_ODS].GL.GLFact g WITH ( NOLOCK )
                JOIN [FII_ODS].Store.StoreFact s WITH ( NOLOCK ) ON g.ZW_Franchise_ID = s.ZW_Franchise_ID
                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON S.CountryKey = C.CountryKey
                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON S.OperationalKey = OP.OperationalKey
        WHERE   g.AccountCode IN ( 4001, 4002, 4003, 4110, 4120 )
                AND s.StoreOpenDate <= @SalesMonthLastYear
                AND g.TransactionDateTime >= @SalesMonthThisYear
                AND g.TransactionDateTime < @EndDateThisYear
                AND c.CountryCode = @Country
                AND op.OperationalName <> 'Closed'
				AND  g.TransactionDateTime < @FirstOfNextMonth

					   /**/
                AND ( ( SELECT  SUM(gl.Amount) * -1
                        FROM    [FII_ODS].GL.GLFact gl WITH ( NOLOCK )
                                JOIN [FII_ODS].Store.StoreFact sf WITH ( NOLOCK ) ON gl.ZW_Franchise_ID = sf.ZW_Franchise_ID
                                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON Sf.CountryKey = C.CountryKey
                                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON Sf.OperationalKey = OP.OperationalKey
                        WHERE   gl.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                    4120 )
                                AND s.ZW_Franchise_ID = gl.ZW_Franchise_ID
                                AND gl.TransactionDateTime >= @SalesMonthThisYear
                                AND gl.TransactionDateTime < @EndDateThisYear
                      ) > 0 )
                AND ( ( SELECT  SUM(gl.Amount) * -1
                        FROM    [FII_ODS].GL.GLFact gl WITH ( NOLOCK )
                                JOIN [FII_ODS].Store.StoreFact sf WITH ( NOLOCK ) ON g.ZW_Franchise_ID = sf.ZW_Franchise_ID
                                JOIN [FII_ODS].Store.CountryDim C WITH ( NOLOCK ) ON Sf.CountryKey = C.CountryKey
                                JOIN [FII_ODS].Store.OperationalDim OP WITH ( NOLOCK ) ON Sf.OperationalKey = OP.OperationalKey
                        WHERE   gl.AccountCode IN ( 4001, 4002, 4003, 4110,
                                                    4120 )
                                AND s.ZW_Franchise_ID = gl.ZW_Franchise_ID
                                AND gl.TransactionDateTime >= @SalesMonthLastYear
                                AND gl.TransactionDateTime < @EndDateLastYear
                      ) > 0 )
		  /**/						

        INSERT  INTO #MonthlySales
                ( [Year]
                , [Month]
                , [StoreCount]
                , [Sales]
                
                )
        VALUES  ( DATEPART(year, @SalesMonthThisYear)
                , @MonthNum
                , @StoreCount
                , @Sales
                
                )				  
        SET @TotalSalesThisYear = @TotalSalesThisYear + @Sales

        SET @MonthNum = @MonthNum + 1
        SET @SalesMonthLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
        SET @SalesMonthThisYear = DATEADD(mm, 1, @SalesMonthThisYear)
        
         /*   select @MonthNum,@SalesMonthLastYear, @SalesMonthThisYear , @EndDateLastYear ,@EndDateThisYear ,	@StoreCount	 ,@Sales  for debuggin */
			  
    END

  
INSERT  INTO #MonthlySales
        ( [Year]
        , [Month]
        , [Sales]
        )
VALUES  ( DATEPART(year, DATEADD(yy, -1, @ReportDate))
        , 13
        , @TotalSalesLastYear
        )
INSERT  INTO #MonthlySales
        ( [Year]
        , [Month]
        , [Sales]
        )
VALUES  ( DATEPART(year, @ReportDate)
        , 13
        , @TotalSalesThisYear
        )

SELECT  [Year]
      , [Month]
      , [StoreCount]
      , [Sales]
FROM    #MonthlySales
ORDER BY [Year]
      , [Month]

DROP TABLE #MonthlySales






GO
