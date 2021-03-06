/****** Object:  StoredProcedure [dbo].[excel_SSS_vs_Royalty]    Script Date: 5/15/2018 12:09:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[excel_SSS_vs_Royalty]
    (
      @Country VARCHAR(2) = 'US' ,
      @ReportMonthint INT = 1 ,
      @ReportYearint INT = 2015 ,
      @ReportDate DATE = NULL
    )
AS
    SET NOCOUNT ON

    IF OBJECT_ID('tempdb..#Temp') IS NOT NULL
        DROP TABLE #Temp


    IF OBJECT_ID('tempdb..#Loader') IS NOT NULL
        DROP TABLE #Loader


    IF OBJECT_ID('tempdb..#Loaded') IS NOT NULL
        DROP TABLE #Loaded

    IF OBJECT_ID('tempdb..#MissingTemp') IS NOT NULL
        DROP TABLE #MissingTemp


--DECLARE @Country VARCHAR(2) 
--SET @Country = 'US' 
--DECLARE @ReportMonthint INT 
--SET @ReportMonthint = 5 
--DECLARE @ReportYearint INT 
--SET @ReportYearint = 2016 
--DECLARE @ReportDate DATE


    DECLARE @MissingDays INT
    SET @MissingDays = 0
    DECLARE @MissingDate DATE

    DECLARE @Month INT
    DECLARE @Year INT
    DECLARE @FirstRun BIT = 1

    DECLARE @LastYearMonth DATETIME 
    DECLARE @ThisYearMonth DATETIME
    DECLARE @LastYearEndMonth DATETIME
    DECLARE @ThisYearEndMonth DATETIME
    DECLARE @LastYearMontha DATETIME
    DECLARE @ThisYearMontha DATETIME
    DECLARE @LastYearEndMontha DATETIME
    DECLARE @ThisYearEndMontha DATETIME 

    DECLARE @ReportYear INT

    DECLARE @Message VARCHAR(80)

    DECLARE @ReportMonth DATETIME


    IF @ReportDate IS NULL
        BEGIN    
            SET @ReportDate = GETDATE()	  
        END

    IF @ReportMonth IS NULL
        BEGIN
	
            SET @ReportMonth = DATEADD(MONTH, -1, @ReportDate)
            SET @ReportMonth = CAST(@ReportMonthint AS VARCHAR(2)) + '/1/'
                + CAST(@ReportYearint AS VARCHAR(4))
        END


    SET @MissingDate = DATEADD(DAY, -1 * @MissingDays, @ReportDate)

    IF @ReportYear IS NULL
        BEGIN  
            SET @ReportYear = YEAR(@ReportDate)
        END

        --SELECT
        --   GLFact.ZW_Franchise_ID ,
        --    MAX(GLFact.TransactionDateTime) AS Last_TransactionDateTime
        --INTO
        --    #MissingTemp
        --FROM
        --    tempGL GLFact WITH (NOLOCK)
        --GROUP BY
        --    GLFact.ZW_Franchise_ID
        --HAVING
        --    MAX(GLFact.TransactionDateTime) > @MissingDate

    SET @Month = @ReportMonthint --1
    SET @Year = @ReportYearint --YEAR(DATEADD(YEAR, -1, GETDATE()))

--WHILE ( @Year <= YEAR(GETDATE()) )
--    BEGIN
--        WHILE ( @Month <= 12 )
--            BEGIN
				--PROC goes Here
                --SET @Message = 'Working on ' + CAST(@Month AS CHAR(2)) + '/'
                --    + CAST(@Year AS CHAR(4))
                --RAISERROR(@Message, 0, 1) WITH NOWAIT 
				          
    SET @LastYearMonth = CAST(@Month AS CHAR(2)) + '/1/'
        + CAST(@Year - 1 AS CHAR(4))
    SET @ThisYearMonth = CAST(@Month AS CHAR(2)) + '/1/'
        + CAST(@Year AS CHAR(4))
    SET @ThisYearEndMonth = CASE WHEN DATEADD(MONTH, 1, @ThisYearMonth) > GETDATE()
                                 THEN GETDATE() - 1
                                 ELSE DATEADD(MONTH, 1, @ThisYearMonth)
                            END 
    SET @LastYearEndMonth = CASE WHEN DATEADD(MONTH, 1, @ThisYearMonth) > GETDATE()
                                 THEN DATEADD(DAY, DAY(GETDATE() - 1),
                                              @LastYearMonth)
                                 ELSE DATEADD(MONTH, 1, @LastYearMonth)
                            END 
                
    SET @LastYearMontha = DATEADD(HOUR, -13, @LastYearMonth)
    SET @ThisYearMontha = DATEADD(HOUR, -13, @ThisYearMonth)
    SET @LastYearEndMontha = DATEADD(HOUR, -13, @LastYearEndMonth)
    SET @ThisYearEndMontha = DATEADD(HOUR, -13, @ThisYearEndMonth);

    WITH    Centers
              AS ( SELECT   Store.StoreFact.CenterKey ,
                            Store.StoreFact.ZW_Franchise_ID ,
                            Store.StoreFact.StoreNumber ,
                            Store.StoreFact.OpenStatus ,
                            Store.CountryDim.CountryName AS CountryName ,
                            Store.CountryDim.CountryCode ,
                            Store.StoreFact.StoreOpenDate ,
                            System.StoreControl.DataSource ,
                            System.StoreControl.AsOfDate
                   FROM     Store.StoreFact
                            INNER JOIN Store.CountryDim ON Store.StoreFact.CountryKey = Store.CountryDim.CountryKey
                            LEFT JOIN System.StoreControl ON Store.StoreFact.ZW_Franchise_ID = System.StoreControl.ZW_Franchise_ID
                                    --INNER JOIN #MissingTemp LastGLTransaction ON LastGLTransaction.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
                   WHERE    Store.StoreFact.OpenStatus = 'Open'
                                    --AND Store.StoreFact.StoreOpenDate <= @LastYearMonth
                            AND Store.CountryDim.CountryCode = @Country
									-- excludes 105 and 106 and 900's centers
                            AND ISNULL(Store.StoreFact.ExcludeFromPickedUP, 0) <> 1
                 )
        SELECT  Centers.CountryCode ,
                Centers.StoreNumber ,
                Centers.ZW_Franchise_ID ,
                ISNULL(Centers.DataSource, 'FSI') AS DataSource ,
                ISNULL(Sum13.Amount, 0) AS [13PickedUP] ,
                ISNULL(Sum14.Amount, 0) AS [14PickedUP]
        INTO    #Temp
        FROM    Centers
                LEFT JOIN ( SELECT  GLFact.ZW_Franchise_ID ,
                                    SUM(GLFact.Amount) AS Amount
                            FROM    tempGL GLFact WITH ( NOLOCK )
                                    JOIN Centers ON GLFact.ZW_Franchise_ID = Centers.ZW_Franchise_ID
                            WHERE   GLFact.TransactionDateTime >= @LastYearMonth
                                    AND GLFact.TransactionDateTime < @LastYearEndMonth
                            GROUP BY GLFact.ZW_Franchise_ID
                          ) Sum13 ON Sum13.ZW_Franchise_ID = Centers.ZW_Franchise_ID
                LEFT JOIN ( SELECT  GLFact.ZW_Franchise_ID ,
                                    SUM(GLFact.Amount) AS Amount
                            FROM    tempGL GLFact WITH ( NOLOCK )
                                    JOIN Centers ON GLFact.ZW_Franchise_ID = Centers.ZW_Franchise_ID
                            WHERE   GLFact.TransactionDateTime >= @ThisYearMonth
                                    AND GLFact.TransactionDateTime < @ThisYearEndMonth
                            GROUP BY GLFact.ZW_Franchise_ID
                          ) Sum14 ON Sum14.ZW_Franchise_ID = Centers.ZW_Franchise_ID

    IF ( @FirstRun = 1 )
        BEGIN
            SELECT  @Month AS intMonth ,
                    @Year AS EndYear ,
                    CountryCode ,
                    StoreNumber ,
                    ZW_Franchise_ID ,
  --                          ISNULL(DataSource, 'FSI') AS DataSource ,
                    [13PickedUP] AS LastYear ,
                    [14PickedUP] AS ThisYear
            INTO    #Loader
            FROM    #Temp
            SET @FirstRun = 0
        END	
    ELSE
        INSERT  INTO #Loader
                SELECT  @Month AS intMonth ,
                        @Year AS EndYear ,
                        CountryCode ,
                        StoreNumber ,
                        ZW_Franchise_ID ,
   --                             ISNULL(DataSource, 'FSI') AS DataSource ,
                        [13PickedUP] AS LastYear ,
                        [14PickedUP] AS ThisYear
                FROM    #Temp;

 --  SELECT * FROM #Temp

    DROP TABLE #Temp
    --            SET @Month = @Month + 1
    --        END
    --    SET @Year = @Year + 1
    --    SET @Month = 1
    --END

 
    SELECT  loader.EndYear ,
            loader.intMonth ,
            loader.CountryCode ,
            COUNT(ALL loader.StoreNumber) AS CentersReporting ,
            SUM(loader.LastYear) AS Sum_LastYear ,
            LastYearWorking.WorkDays AS LastYearWorkingDays ,
            SUM(loader.ThisYear) AS Sum_ThisYear ,
            WorkingDaysYTD.WorkDays AS ThisYearWorkingDays ,  	
   --   -- @AVGBusinessDaySalesLastYear  
            ( SUM(loader.LastYear) / LastYearWorking.WorkDays ) AS AVGBusinessDaySalesLastYear , 
	     --   --@AVGBusinessDaySalesThisYear  
            ( SUM(loader.ThisYear) / WorkingDaysYTD.WorkDays ) AS AVGBusinessDaySalesThisYear ,
   	       --@AVGBusinessDaySalesDiff  
            ( ( SUM(loader.ThisYear) / WorkingDaysYTD.WorkDays )
              - ( SUM(loader.LastYear) / LastYearWorking.WorkDays ) ) AS AVGBusinessDaySalesDiff ,
				
	  --@AVGSalesDiffPercentage  
            ( ( ( SUM(loader.ThisYear) / WorkingDaysYTD.WorkDays )
                - ( SUM(loader.LastYear) / LastYearWorking.WorkDays ) )
              / ( SUM(loader.LastYear) / LastYearWorking.WorkDays ) ) AS AVGSalesDiffPercentage
    INTO    #Loaded
    FROM    #Loader loader
            INNER JOIN ( SELECT YEAR(System.Calendar.dt) AS intYear ,
                                MONTH(System.Calendar.dt) AS intMonth ,
                                COUNT(*) AS WorkDays
                         FROM   System.Calendar
                         WHERE  System.Calendar.IsWorkDay = 1
                                AND System.Calendar.dt < GETDATE() - 1
                         GROUP BY YEAR(System.Calendar.dt) ,
                                MONTH(System.Calendar.dt)
                       ) WorkingDaysYTD ON WorkingDaysYTD.intYear = loader.EndYear
                                           AND WorkingDaysYTD.intMonth = loader.intMonth
            INNER JOIN ( SELECT YEAR(System.Calendar.dt) AS intYear ,
                                MONTH(System.Calendar.dt) AS intMonth ,
                                COUNT(*) AS WorkDays
                         FROM   System.Calendar
                         WHERE  System.Calendar.IsWorkDay = 1
                                AND System.Calendar.dt < DATEADD(YEAR, -1,
                                                              ( GETDATE() - 1 ))
                         GROUP BY YEAR(System.Calendar.dt) ,
                                MONTH(System.Calendar.dt)
                       ) LastYearWorking ON LastYearWorking.intYear = loader.EndYear
                                            - 1
                                            AND LastYearWorking.intMonth = loader.intMonth
    GROUP BY loader.intMonth ,
            loader.EndYear ,
            loader.CountryCode ,
            LastYearWorking.WorkDays ,
            WorkingDaysYTD.WorkDays
    ORDER BY loader.CountryCode ,
            loader.EndYear ,
            loader.intMonth

--SELECT * FROM #Loader ORDER BY 5

/************************************ current year vs prior year ********************************************************/

		
		/* prior year  So EndYear 2013 means 2012 is prior year */
--SELECT
--    L.EndYear - 1 AS [Year] ,  /* 2013 for 2014 compare */  /* labels are jacked */
--    L.intMonth AS [Month] ,
--    L.CentersReporting AS StoreCount ,
--    L.Sum_LastYear AS [Sales] ,
--    L.LastYearWorkingDays AS BusinessDays ,
--    L.AVGBusinessDaySalesLastYear AS AVGBusinessDaySales ,
--    0.000000 AS AVGBusinessDaySalesDiff ,
--    0.000000 AS SalesDiffPercentage
--FROM
--    #Loaded L
--WHERE
--    L.EndYear = @ReportYear --YEAR(GETDATE()) 
--UNION
--    	/* current year compares to prior year  */
--SELECT
--    L.EndYear AS [Year] ,
--    L.intMonth AS [Month] ,
--    L.CentersReporting AS StoreCount ,
--    L.Sum_ThisYear AS [Sales] ,
--    L.ThisYearWorkingDays AS BusinessDays ,
--    L.AVGBusinessDaySalesThisYear AS AVGBusinessDaySales ,
--    L.AVGBusinessDaySalesDiff AS AVGBusinessDaySalesDiff ,
--    L.AVGSalesDiffPercentage AS SalesDiffPercentage
--FROM
--    #Loaded L
--WHERE
--    L.EndYear = @ReportYear
--UNION
--	/* prior year totals */
--SELECT
--    L.EndYear - 1 AS [Year] ,
--    13 AS [Month] ,
--    NULL AS StoreCount ,
--    SUM(L.Sum_LastYear) AS [Sales] ,
--    SUM(L.LastYearWorkingDays) AS BusinessDays ,
--    SUM(L.Sum_LastYear) / SUM(L.LastYearWorkingDays) AS AVGBusinessDaySales ,
--    0.000000 AS AVGBusinessDaySalesDiff ,
--    0.000000 AS SalesDiffPercentage
--FROM
--    #Loaded L
--WHERE
--    L.EndYear = @ReportYear
--GROUP BY
--    L.EndYear
--UNION
--	/* current year totals */
--SELECT
--    L.EndYear AS [Year] ,
--    13 AS [Month] ,
--    NULL AS StoreCount ,
--    SUM(L.Sum_ThisYear) AS [Sales] ,
--    SUM(L.ThisYearWorkingDays) AS BusinessDays ,
--    SUM(L.Sum_ThisYear) / SUM(L.ThisYearWorkingDays) AS AVGBusinessDaySales ,
--    SUM(L.Sum_ThisYear) / SUM(L.ThisYearWorkingDays) - SUM(L.Sum_LastYear)
--    / SUM(L.LastYearWorkingDays) AS AVGBusinessDaySalesDiff ,
--    ( SUM(L.Sum_ThisYear) / SUM(L.ThisYearWorkingDays) - SUM(L.Sum_LastYear)
--      / SUM(L.LastYearWorkingDays) ) / ( SUM(L.Sum_LastYear)
--                                         / SUM(L.LastYearWorkingDays) ) AS SalesDiffPercentage
--FROM
--    #Loaded L
--WHERE
--    L.EndYear = @ReportYear
--GROUP BY
--    L.EndYear;
		
--DROP TABLE #Loaded;
--DROP TABLE #Loader;

    IF OBJECT_ID('tempdb..#Royalty') IS NOT NULL
        DROP TABLE #Royalty

    SELECT  Driver.StoreNumber ,
            Driver.PeriodEndDate ,
            SUM(Driver.TotalSales) AS TotalSales
			INTO #Royalty
    FROM    ( SELECT    Royalty.CenterSales.StoreNumber ,
                        Royalty.CenterSales.PeriodEndDate ,
                        Royalty.CenterSales.TotalSales
              FROM      Royalty.CenterSales
              WHERE     Royalty.CenterSales.PeriodEndDate = DATEADD(d,-1,DATEADD(m,1,@ThisYearMonth))
              UNION
              SELECT    vw_Store.StoreNumber ,
                        DATEADD(d,-1,DATEADD(m,1,@ThisYearMonth)) AS PeriodEndDate ,
                        0.00 AS TotalSales
              FROM      vw_Store
              WHERE     vw_Store.Status = '1'
            ) Driver
    GROUP BY Driver.StoreNumber ,
            Driver.PeriodEndDate
  
  
    SELECT  Store.StoreFact.ZW_Franchise_ID AS 'ZW ID' ,
            Royalty.StoreNumber AS 'Store Number' ,
            CONVERT(VARCHAR(10), Store.StoreFact.StoreOpenDate, 101) AS StoreOpenDate ,
            MONTH(Royalty.PeriodEndDate) AS Month ,
            YEAR(Royalty.PeriodEndDate) AS Year ,
            Royalty.TotalSales AS 'Royalty Sales' ,
            ISNULL(ODS.ThisYear, 0) AS 'ODS Sales' ,
            CAST(ISNULL(Royalty.TotalSales, 0)
            - ISNULL(ODS.ThisYear, 0) AS MONEY) AS 'RS-ODS' ,
            CAST(ABS(ISNULL(Royalty.TotalSales, 0)
                     - ISNULL(ODS.ThisYear, 0)) AS MONEY) AS 'Absolute Diff' ,
            Shipping.Shipping_Amount ,
    --Voids.void_amount AS 'Void Amount' ,
    --0 AS 'Diff with Voids' ,
            ISNULL(System.StoreControl.DataSource, 'FSI') AS Source ,
            CONVERT(VARCHAR(10), CASE WHEN System.StoreControl.AsOfDate = '1/1/2100'
                                      THEN NULL
                                      ELSE System.StoreControl.AsOfDate
                                 END, 101) AS 'Keystone Begin Date' ,
            CONVERT(VARCHAR(10), System.StoreControl.CoreDate, 101) AS 'Core Begin Date' ,
            ODS.LastYear AS 'LY ODS Sales' ,
            CenterSalesLY.TotalSales AS 'LY Royalty Sales' ,
            CONVERT(VARCHAR(10), Royalty.PeriodEndDate, 101) AS PeriodEndDate , 
--    KeystoneRoyalty.sales_total - KeystoneRoyalty.royalty_sales_total AS [Keystone Royalty Report]
            CB_royalty.Sum_Amount AS CB_Royalty ,
            CASE WHEN Store.StoreFact.CompStart <= DATEADD(m, -12,
                                                           CAST(@Month AS VARCHAR(2))
                                                           + '/1/'
                                                           + CAST(@Year AS [CHAR](4)))
                 THEN 'Comp'
                 ELSE ''
            END AS CompStatus ,
            CASE WHEN PickedUpDetail.StoreNumber IS NULL THEN ''
                 ELSE 'YES'
            END AS PickedUp
    FROM  #Royalty   Royalty  --Royalty.CenterSales
            JOIN Store.StoreFact ON Store.StoreFact.StoreNumber = Royalty.StoreNumber
            LEFT JOIN Store.CountryDim ON CountryDim.CountryKey = StoreFact.CountryKey
            LEFT JOIN ( SELECT  intMonth ,
                                EndYear ,
                                CountryCode ,
                                StoreNumber ,
                                ZW_Franchise_ID ,
                                ThisYear ,
                                ABS(LastYear - ThisYear) AS Diff ,
                                LastYear
                        FROM    #Loader
                      ) ODS ON ODS.StoreNumber = Royalty.StoreNumber
                               AND DATEADD(DAY, -1,
                                           DATEADD(MONTH, 1,
                                                   CAST(ODS.intMonth AS VARCHAR(2))
                                                   + '/1/'
                                                   + CAST(ODS.EndYear AS VARCHAR(4)))) = Royalty.PeriodEndDate
            LEFT JOIN System.StoreControl ON System.StoreControl.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
            LEFT JOIN Royalty.CenterSales CenterSalesLY ON Royalty.StoreNumber = CenterSalesLY.StoreNumber
                                                           AND ( DATEADD(YEAR,
                                                              -1,
                                                              Royalty.PeriodEndDate) = CenterSalesLY.PeriodEndDate
                                                              OR DATEADD(DAY,
                                                              -1,
                                                              DATEADD(YEAR, -1,
                                                              DATEADD(DAY, 1,
                                                              Royalty.PeriodEndDate))) = CenterSalesLY.PeriodEndDate
                                                              )
            LEFT JOIN ( SELECT  MySQLStaging.dbo.jobs.franchise_id ,
                                YEAR(iv.created_on) AS EndYear ,
                                MONTH(iv.created_on) AS intMonth ,
                                SUM(iv.amount_due) AS void_amount
                        FROM    MySQLStaging.dbo.invoice_void iv
                                INNER JOIN MySQLStaging.dbo.jobs ON iv.job_id = MySQLStaging.dbo.jobs.job_id
                        WHERE   iv.royalty_impact = 1
                        GROUP BY MySQLStaging.dbo.jobs.franchise_id ,
                                YEAR(iv.created_on) ,
                                MONTH(iv.created_on)
                      ) Voids ON Voids.franchise_id = ODS.ZW_Franchise_ID
                                 AND Voids.intMonth = ODS.intMonth
                                 AND Voids.EndYear = ODS.EndYear
            LEFT JOIN ( SELECT  *
                        FROM    MySQLStaging.dbo.franchise_royalty
                      ) KeystoneRoyalty ON KeystoneRoyalty.franchise_id = ODS.ZW_Franchise_ID
                                           AND KeystoneRoyalty.period_start_date = CAST(ODS.intMonth AS VARCHAR(2))
                                           + '/1/'
                                           + CAST(ODS.EndYear AS VARCHAR(4))
            LEFT JOIN ( SELECT  vw_Locations.ZW_Franchise_ID ,
                                SUM(SalesResultsAllDispositions.Amount) AS Shipping_Amount
                        FROM    CoreBridgeCentral.dbo.SalesResultsAllDispositions
                                INNER JOIN CoreBridgeCentral.dbo.vw_Locations ON vw_Locations.Value = SalesResultsAllDispositions.CompanyLocationId
                        WHERE   SalesResultsAllDispositions.GL_Account LIKE '%ship%'
                                AND YEAR(SalesResultsAllDispositions.OrderCompletionDate) = @ReportYearint
                                AND MONTH(SalesResultsAllDispositions.OrderCompletionDate) = @ReportMonthint
                        GROUP BY vw_Locations.ZW_Franchise_ID
                        HAVING  SUM(SalesResultsAllDispositions.Amount) <> 0
                      ) Shipping ON Shipping.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
            LEFT JOIN ( SELECT  vw_Locations.ZW_Franchise_ID ,
                                RoyaltyReports.RoyaltyPeriod ,
                                SUM(RoyaltyReports.Amount) AS Sum_Amount
                        FROM    [CoreBridgeCentral].dbo.RoyaltyReports RoyaltyReports
                                INNER JOIN [CoreBridgeCentral].dbo.vw_Locations vw_Locations ON vw_Locations.Value = RoyaltyReports.CompanyLocationId
                        WHERE   ( RoyaltyReports.RoyaltyGroupName LIKE '% - FII' --= 'Group 3 - FII'  --PlanID = 5 OR RoyaltyReports.PlanID = 6 (Must include group 9 also) TAF 10/12/16
                                  )
                                AND RoyaltyPeriod = DATEADD(MONTH, 1,
                                                            CAST(@Month AS VARCHAR(2))
                                                            + '/1/'
                                                            + CAST(@Year AS VARCHAR(4)))
                        GROUP BY vw_Locations.ZW_Franchise_ID ,
                                RoyaltyReports.RoyaltyPeriod
                      ) CB_royalty ON CB_royalty.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
            LEFT JOIN ( SELECT  *
                        FROM    fn_InPickedUp(@Country, @Month, @Year)
                      ) PickedUpDetail ON Royalty.StoreNumber = PickedUpDetail.StoreNumber
    WHERE   Store.CountryDim.CountryCode = @Country
	--Store.StoreFact.CountryKey = 8
            AND Royalty.PeriodEndDate > @ReportMonth
            AND Royalty.PeriodEndDate < DATEADD(MONTH, 1,
                                                            @ReportMonth)
		--AND Store.StoreFact.OpenStatus = 'Open'
            AND ISNULL(Store.StoreFact.ExcludeFromPickedUP, 0) <> 1
    UNION
    SELECT DISTINCT
            Store.StoreFact.ZW_Franchise_ID ,
            Royalty.CenterSales.StoreNumber ,
            CONVERT(VARCHAR(10), Store.StoreFact.StoreOpenDate, 101) AS StoreOpenDate ,
            MONTH(Royalty.CenterSales.PeriodEndDate) AS intMonth ,
            YEAR(Royalty.CenterSales.PeriodEndDate) AS EndYear ,
            Royalty.CenterSales.TotalSales AS RoyaltySales ,
            0 AS ODSSales ,
            ISNULL(Royalty.CenterSales.TotalSales, 0) - 0 AS 'RS-ODS' ,
            ABS(ISNULL(Royalty.CenterSales.TotalSales, 0) - 0) AS 'Absolute Diff' ,
            NULL ,
    --NULL ,
    --0 ,
            ISNULL(System.StoreControl.DataSource, 'N/A') AS DataSource ,
            CONVERT(VARCHAR(10), CASE WHEN System.StoreControl.AsOfDate = '1/1/2100'
                                      THEN NULL
                                      ELSE System.StoreControl.AsOfDate
                                 END, 101) AS 'Keystone Begin Date' ,
            CONVERT(VARCHAR(10), System.StoreControl.CoreDate, 101) AS 'Core Begin Date' ,
            0 ,
            CenterSalesLY.TotalSales AS RoyaltySalesLY ,
            CONVERT(VARCHAR(10), Royalty.CenterSales.PeriodEndDate, 101) AS PeriodEndDate , 
    --NULL,
            CB_royalty.Sum_Amount AS CB_Royalty ,
            CASE WHEN Store.StoreFact.CompStart <= DATEADD(m, -12,
                                                           CAST(@Month AS VARCHAR(2))
                                                           + '/1/'
                                                           + CAST(@Year AS [CHAR](4)))
                 THEN 'Comp'
                 ELSE ''
            END AS CompStatus ,
            CASE WHEN PickedUpDetail.StoreNumber IS NULL THEN ''
                 ELSE 'YES'
            END AS PickedUp
    FROM    Royalty.CenterSales
            JOIN Store.StoreFact ON Store.StoreFact.StoreNumber = Royalty.CenterSales.StoreNumber
            LEFT JOIN System.StoreControl ON System.StoreControl.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
            LEFT JOIN Store.CountryDim ON CountryDim.CountryKey = StoreFact.CountryKey
            LEFT JOIN ( SELECT  intMonth ,
                                EndYear ,
                                CountryCode ,
                                StoreNumber ,
                                ZW_Franchise_ID ,
                                ThisYear ,
                                ABS(LastYear - ThisYear) AS Diff ,
                                LastYear
                        FROM    #Loader
                      ) ODS ON ODS.StoreNumber = Royalty.CenterSales.StoreNumber
            INNER JOIN Royalty.CenterSales CenterSalesLY ON Royalty.CenterSales.StoreNumber = CenterSalesLY.StoreNumber
                                                            AND DATEADD(YEAR,
                                                              -1,
                                                              Royalty.CenterSales.PeriodEndDate) = CenterSalesLY.PeriodEndDate
            LEFT JOIN ( SELECT  vw_Locations.ZW_Franchise_ID ,
                                RoyaltyReports.RoyaltyPeriod ,
                                SUM(RoyaltyReports.Amount) AS Sum_Amount
                        FROM    [CoreBridgeCentral].dbo.RoyaltyReports RoyaltyReports
                                INNER JOIN [CoreBridgeCentral].dbo.vw_Locations vw_Locations ON vw_Locations.Value = RoyaltyReports.CompanyLocationId
                        WHERE   ( RoyaltyReports.RoyaltyGroupName LIKE '% - FII' --= 'Group 3 - FII'  --PlanID = 5 OR RoyaltyReports.PlanID = 6 (Must include group 9 also) TAF 10/12/16
                                  )
                                AND RoyaltyPeriod = DATEADD(MONTH, 1,
                                                            CAST(@Month AS VARCHAR(2))
                                                            + '/1/'
                                                            + CAST(@Year AS VARCHAR(4)))
                        GROUP BY vw_Locations.ZW_Franchise_ID ,
                                RoyaltyReports.RoyaltyPeriod
                      ) CB_royalty ON CB_royalty.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
            LEFT JOIN ( SELECT  *
                        FROM    fn_InPickedUp(@Country, @Month, @Year)
                      ) PickedUpDetail ON Royalty.CenterSales.StoreNumber = PickedUpDetail.StoreNumber
    WHERE   Store.CountryDim.CountryCode = @Country
	--Store.StoreFact.CountryKey = 8
            AND Royalty.CenterSales.PeriodEndDate > @ReportMonth
            AND Royalty.CenterSales.PeriodEndDate < DATEADD(MONTH, 1,
                                                            @ReportMonth)
            AND intMonth IS NULL
            AND System.StoreControl.DataSource IS NULL
            AND Store.StoreFact.OpenStatus = 'Open'
            AND ISNULL(Store.StoreFact.ExcludeFromPickedUP, 0) <> 1
    ORDER BY 1 ,
            PeriodEndDate


			DROP TABLE #Royalty

GO
