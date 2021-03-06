/****** Object:  StoredProcedure [dbo].[rpt_PickedUpBySalesPerson]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[rpt_PickedUpBySalesPerson]
    (
      @CenterKey INT = NULL
    , @SalesPerson INT=NULL   
    , @StartDate DATETIME = NULL
    , @EndDate DATETIME = NULL
    )
AS 
    SET NOCOUNT ON 
					
    IF @StartDate IS NULL 
        BEGIN	    
            SET @StartDate = DATEADD(YY, -1, DATEADD(mm, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)))   /* FOM One year ago */
        END
    
    IF @EndDate IS NULL 
        BEGIN	    
            SET @EndDate = DATEADD(s, -1, DATEADD(mm, DATEDIFF(m, 0, GETDATE()), 0))   /* EOM Prior Month to last second */
        END  			  

SELECT  Orders.OrderHeaderFactOffSetDates.PickedUpDate AS [UTC Date]
      , SUBSTRING(Contact.CompanyNameDim.CompanyNameName, 1, 16) AS [CompanyName]
      , Orders.OrderHeaderFact.OrderID
      , SUBSTRING(Orders.DescriptionDim.DescriptionName, 1, 16) AS [Description]
      , Orders.StatusDim.StatusName
      , Orders.OrderHeaderFact.ProductionCat1Sales
      , Orders.OrderHeaderFact.ProductionCat2Sales
      , Orders.OrderHeaderFact.ProductionCat3Sales
      , Orders.OrderHeaderFact.DiscountAmount
      , Orders.OrderHeaderFact.SalesSubtotal
      , Orders.OrderHeaderFact.BalanceOutstanding
      , Contact.EmployeeFact.EmployeeKey
      , Contact.EmployeeFact.FirstName
      , Contact.EmployeeFact.LastName
      , store.StoreFact.*
FROM    Store.StoreFact
        INNER JOIN Orders.OrderHeaderFact ON Orders.OrderHeaderFact.CenterKey = Store.StoreFact.CenterKey
        INNER JOIN Orders.OrderHeaderFactOffSetDates ON Orders.OrderHeaderFact.OrderHeaderKey = Orders.OrderHeaderFactOffSetDates.OrderHeaderKey
        INNER JOIN Contact.EmployeeFact ON Orders.OrderHeaderFact.SalePersonKey = Contact.EmployeeFact.EmployeeKey
        INNER JOIN Contact.CustomerFact ON Orders.OrderHeaderFact.CustomerKey = Contact.CustomerFact.CustomerKey
        LEFT JOIN Contact.CompanyNameDim ON Contact.CustomerFact.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey
        LEFT JOIN Orders.DescriptionDim ON Orders.OrderHeaderFact.DescriptionKey = Orders.DescriptionDim.DescriptionKey
        INNER JOIN Orders.StatusDim ON Orders.OrderHeaderFact.StatusKey = Orders.StatusDim.StatusKey
WHERE   Store.StoreFact.OpenStatus IN ( 'open', 'new' )
        AND Orders.OrderHeaderFactOffSetDates.PickedUpDate >= @StartDate
        AND Orders.OrderHeaderFactOffSetDates.PickedUpDate < @EndDate
            --AND Orders.OrderHeaderFact.SalesSubtotal > 0            /* The Cyrious reports INCLUDE 0$ Sales */
        AND 1 = CASE WHEN ( @CenterKey IS NULL ) THEN 1
                     ELSE CASE WHEN ( Orders.OrderHeaderFact.[CenterKey] = @CenterKey )
                               THEN 1
                               ELSE 0
                          END
                END
        AND Store.StoreFact.CenterKey = @CenterKey
        AND ( Contact.EmployeeFact.EmployeeKey = @SalesPerson
              OR @SalesPerson = 0
            )
ORDER BY Orders.OrderHeaderFact.PickedUpDate
      , Contact.CompanyNameDim.CompanyNameName
		


GO
