/****** Object:  StoredProcedure [dbo].[rpt_WeeklyOrdersAndSalesByCenterKey]    Script Date: 5/15/2018 12:09:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
     CREATE PROCEDURE [dbo].[rpt_WeeklyOrdersAndSalesByCenterKey]
    (
      @CountryName VARCHAR(50)='USA',
      @CenterKey INT=NULL,		
      @StartDate DATETIME = NULL,
      @EndDate DATETIME = NULL
    )
AS 
/* This is calculating Monday as the start of week and Sunday as the end of week */
    SET NOCOUNT ON   
	    
IF @CountryName IS NULL 
    BEGIN	    
        SET @CountryName ='USA'
    END
    	
IF @StartDate IS NULL 
    BEGIN	    
        SET @StartDate =DATEADD(yy, -1, GETDATE())
    END
    
IF @EndDate IS NULL 
    BEGIN	    
        SET @EndDate =DATEADD(dd, -1, GETDATE())
    END

			  CREATE TABLE #WeeklyOrdersPlaced
                (
                  [Center] VARCHAR(7)
                , SalesTotal MONEY
                , [Year] INT
                , [Week] INT
                , [Week_Start] DATE
                , [Week_End] DATE
                )

              CREATE TABLE #WeeklyOrdersPickedUp
                (
                  [Center] VARCHAR(7)
                , SalesTotal MONEY
                , [Year] INT
                , [Week] INT
                , [Week_Start] DATE
                , [Week_End] DATE
                )


              INSERT    INTO #WeeklyOrdersPlaced
                        SELECT  oh.[ZW_Franchise_ID]

                              , SUM(oh.[SalesSubtotal]) AS SalesTotal
                              , DATEPART(yy, oh.[OrderDate]) AS 'Year'
                              , DATEPART(wk, oh.[OrderDate]) AS 'Week #'
                              , CAST(DATEADD(DAY,
                                             -( DATEPART(dw, oh.[OrderDate])
                                                - 2 ), oh.[OrderDate]) AS DATE) AS week_start
                              , CAST(DATEADD(DAY,
                                             8 - ( DATEPART(dw, oh.[OrderDate]) ),
                                             oh.[OrderDate]) AS DATE) AS week_end
                        FROM    [Orders].[OrderHeaderFact] OH
                        WHERE   OH.CenterKey = @CenterKey
                                AND ( oh.[OrderDate] >= @StartDate )
                        GROUP BY oh.[ZW_Franchise_ID]

                              , DATEPART(yy, oh.[OrderDate])
                              , DATEPART(wk, oh.[OrderDate])
                              , CAST(DATEADD(DAY,
                                             -( DATEPART(dw, oh.[OrderDate])
                                                - 2 ), oh.[OrderDate]) AS DATE)
                              , CAST(DATEADD(DAY,
                                             8 - ( DATEPART(dw, oh.[OrderDate]) ),
                                             oh.[OrderDate]) AS DATE)
                        ORDER BY week_start


              INSERT    INTO #WeeklyOrdersPickedUp
                        SELECT  oh.[ZW_Franchise_ID]

                              , SUM(oh.[SalesSubtotal]) AS SalesTotal
                              , DATEPART(yy, oh.[PickedUpDate]) AS 'Year'
                              , DATEPART(wk, oh.[PickedUpDate]) AS 'Week #'
                              , CAST(DATEADD(DAY,
                                             -( DATEPART(dw, oh.[PickedUpDate])
                                                - 2 ), oh.[PickedUpDate]) AS DATE) AS week_start
                              , CAST(DATEADD(DAY,
                                             8 - ( DATEPART(dw,
                                                            oh.[PickedUpDate]) ),
                                             oh.[PickedUpDate]) AS DATE) AS week_end
                        FROM    [Orders].[OrderHeaderFact] OH
                        WHERE   OH.CenterKey = @CenterKey
                                AND ( ISNULL(oh.[PickedUpDate], '1900-01-01 00:00:00.000') >=@StartDate )
                        GROUP BY oh.[ZW_Franchise_ID]
          , DATEPART(yy, oh.[PickedUpDate])
                              , DATEPART(wk, oh.[PickedUpDate])
                              , CAST(DATEADD(DAY,
                                             -( DATEPART(dw, oh.[PickedUpDate])
                                                - 2 ), oh.[PickedUpDate]) AS DATE)
                              , CAST(DATEADD(DAY,
                                             8 - ( DATEPART(dw,
                                                            oh.[PickedUpDate]) ),
                                             oh.[PickedUpDate]) AS DATE)
                        ORDER BY week_start

              SELECT  O.Center
			          , O.SalesTotal AS Orders
                      , P.SalesTotal AS PickedUp
                      , o.[Year]
                      , o.[Week]
                      , o.Week_Start AS WeekStart
                      , o.Week_End AS WeekEnd
              FROM      #WeeklyOrdersPlaced o
                        JOIN #WeeklyOrdersPickedUp P ON P.Center = o.Center
                                                        AND o.[Week] = P.[Week]
                                                        AND o.[Year] = P.[Year]
                                                        AND o.Week_Start = P.Week_Start
                                                        AND o.Week_End = P.Week_End 

		
              DROP TABLE #WeeklyOrdersPlaced
              DROP TABLE #WeeklyOrdersPickedUp



GO
