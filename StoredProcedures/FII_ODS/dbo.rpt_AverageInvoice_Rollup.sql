/****** Object:  StoredProcedure [dbo].[rpt_AverageInvoice_Rollup]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[rpt_AverageInvoice_Rollup]                --   [rpt_AverageInvoice_Rollup] 'US',NULL,'01/01/2012','12/31/2013'
    ( 

	  @CountryCode VARCHAR(3)=NULL,
   	  @CenterKey INT=NULL,		
      @StartDate DATETIME = NULL,
      @EndDate DATETIME = NULL  
      
    )
AS 

    SET NOCOUNT ON
				  
IF ISNULL(@CountryCode,'') =''
    BEGIN	    
        SET @CountryCode ='US'
    END    
    	
IF @StartDate IS NULL 
    BEGIN	    
        SET @StartDate =DATEADD(mm, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0))   /* FOM Prior month */
    END
    
IF @EndDate IS NULL 
    BEGIN	    
        SET @EndDate =DATEADD(ms, -3, DATEADD(mm, DATEDIFF(m, 0, GETDATE()), 0))   /* EOM Prior Month to last second */
    END
 	 	

SELECT  REPLACE(REPLACE(REPLACE(REPLACE(o.[ZW_Franchise_ID], 'FSI000', ''), 'FSI00', ''), 'FSI0', ''), 'FSI', '') AS [ZW_Franchise_ID]
 ,SF.StoreNumber
 ,VN.VanityNameName																														

	  , CAST(DATEPART(YEAR,O.PickedUpDate) AS CHAR(4)) AS RollupYear
      , CAST(AVG(o.SalesSubtotal) AS DECIMAL(13, 2)) AS AvgPickedUpSubtotal
      , COUNT(o.salestotal) AS NumberOfSales    	 
      , CAST(SUM(o.TaxableAmount) AS DECIMAL(13, 2)) AS TaxableAmount
      , CAST(SUM(o.TaxExemptAmount) AS DECIMAL(13, 2)) AS TaxExemptAmount
	  , CAST(SUM(o.ShippingCharge) AS DECIMAL(13, 2)) AS ShippingAmount
      , CAST(SUM(o.SalesSubtotal) AS DECIMAL(13, 2)) AS SalesSubtotal	
      , CAST(SUM(o.TaxTotal) AS DECIMAL(13, 2)) AS TaxTotal
      , CAST(SUM(o.salestotal) AS DECIMAL(13, 2)) AS TotalSales
  
FROM    [FII_ODS].[Orders].[OrderHeaderFact] O        
		JOIN [FII_ODS].[dbo].[SSIS_StoreFact] SF ON SF.CenterKey = O.CenterKey
		JOIN [FII_ODS].[Store].[VanityNameDim] VN ON VN.VanityNameKey = SF.VanityNameKey 
        JOIN [FII_ODS].Store.CountryDim C ON SF.CountryKey = C.CountryKey
        JOIN [FII_ODS].Contact.CustomerFact CF ON CF.CustomerKey = O.CustomerKey
        JOIN [FII_ODS].Store.OperationalDim OP ON SF.OperationalKey = OP.OperationalKey
        JOIN [FII_ODS].[System].[ZipCode] ZC ON ZC.zip = SF.Zip
WHERE   op.OperationalName <> 'Closed' 
        AND SF.StoreNumber <> '350101'  /* Grieser test center */     
                AND c.CountryCode = @CountryCode
                     AND  @StartDate <= O.PickedUpDate
	        AND  @EndDate > O.PickedUpDate
                AND 1 = CASE WHEN ( @CenterKey IS NULL ) THEN 1
                             ELSE CASE WHEN ( SF.CenterKey = @CenterKey )
                                       THEN 1
                                       ELSE 0
                                  END
                        END
		        
GROUP BY o.ZW_Franchise_ID,SF.StoreNumber,VN.VanityNameName	
,CAST(DATEPART(YEAR,O.PickedUpDate) AS CHAR(4)) 


ORDER BY 1,5 desc		 
		


GO
