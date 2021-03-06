/****** Object:  StoredProcedure [dbo].[rpt_MonthlySalesPerson]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE [dbo].[rpt_MonthlySalesPerson]
    (
      @CenterKey INT = NULL
    , @StartDate DATETIME = NULL
    , @EndDate DATETIME = NULL
    )
AS 
    SET NOCOUNT ON 
					
/* Added UTC conversion to date logic to account for the way Cyrious stores order dates */
    IF @StartDate IS NULL 
        BEGIN	    
            SET @StartDate = DATEADD(YY, -1, DATEADD(mm, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)))   /* FOM One year ago */
        END
    
    IF @EndDate IS NULL 
        BEGIN	    
            SET @EndDate = DATEADD(s, -1, DATEADD(mm, DATEDIFF(m, 0, GETDATE()), 0))   /* EOM Prior Month to last second */
        END  			  

     SELECT  S.StoreNumber AS Center
	      , O.ZW_Franchise_ID AS WebNumber
          , E.LastName
          , E.FirstName

      /*, E.SalesPerson*/
          , E.IsActive
          , MONTH( d.PickedUpDate) 'Month'
          , YEAR(  d.PickedUpDate)'Year'
          , SUM(O.SignSales) 'SignSales'
          , SUM(O.AVISales) 'AVISales'
          , SUM(O.InstallSales) 'InstallSales'
          , SUM(O.ProductionCat1Sales) 'ProductionCat1Sales'
          , SUM(O.ProductionCat2Sales) 'ProductionCat2Sales'
          , SUM(O.ProductionCat3Sales) 'ProductionCat3Sales'
          , SUM([ShippingCharge]) 'shipping'
			/*, SUM([WriteoffAmount])'writeoff'
			  , SUM([DiscountAmount])'discount'*/
          , SUM(O.ItemsTotal) 'ItemsTotal'
          , SUM(O.SalesSubtotal) 'SalesSubtotal'
          , SUM(O.SalesTotal) 'SalesTotal'
          , COUNT(O.OrderID) 'NumberOfTickets'
    FROM    Orders.OrderHeaderFact O
	JOIN [FII_ODS].[Orders].[OrderHeaderFactOffSetDates] D ON O.OrderHeaderKey = D.OrderHeaderKey
            JOIN Contact.EmployeeFact E ON O.SalePersonKey = E.EmployeeKey
            JOIN Store.StoreFact S ON O.CenterKey = S.CenterKey
    WHERE   S.OpenStatus IN ( 'open', 'new' )

            AND  d.PickedUpDate >= @StartDate
            AND  d.PickedUpDate < @EndDate
            --AND O.SalesSubtotal > 0            /* The Cyrious reports INCLUDE 0$ Sales */
            AND 1 = CASE WHEN ( @CenterKey IS NULL ) THEN 1
                         ELSE CASE WHEN ( S.StoreNumber = @CenterKey ) THEN 1
                                   ELSE 0
                              END
                    END
    GROUP BY S.StoreNumber, O.zw_franchise_id
          , E.LastName
          , E.FirstName
      /*, E.SalesPerson*/
          , E.IsActive
          , MONTH( d.PickedUpDate)
          , YEAR(  d.PickedUpDate)
    ORDER BY Center
          , LastName
          , FirstName
          , Year
          , Month



GO
