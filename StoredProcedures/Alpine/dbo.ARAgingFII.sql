/****** Object:  StoredProcedure [dbo].[ARAgingFII]    Script Date: 5/15/2018 12:09:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:		<Frank Whitlock>
-- Create date: <07/23/2013>
-- Description:	<Aging report for FII>
-- Example: ARAgingFII 11501,NULL,NULL,'ALL','05/31/2013','USA'
-- or ARAgingFII NULL,NULL,NULL,'ALL','05/31/2013','USA'
-- MOD - add city, political division, country 01/28/2014 - efw
-- =============================================
CREATE PROCEDURE [dbo].[ARAgingFII]

( @storenumber VARCHAR(20)
 ,@storerange1 VARCHAR(20)
 ,@storerange2 VARCHAR(20)
 ,@fbc VARCHAR(200)
 ,@AsOfDate DATETIME
 ,@country VARCHAR(100)
)
as

 -- change To correct country code!
 /* currently used
Australia
Brazil
Canada
Colombia
Mexico
Undefined
United Kingdom
USA
*/


IF @storenumber = '' 
    SELECT  @storenumber = NULL
IF @storerange1 = '' 
    SELECT  @storerange1 = NULL
IF @storerange2 = '' 
    SELECT  @storerange2 = NULL

IF @AsOfDate = '' 
    SELECT  @AsOfDate = NULL

--picked fbc
IF @fbc = 'All' 
    BEGIN
        SET @fbc = '%'
    END


DECLARE @curDateFirst DATETIME
  , @curDateLast DATETIME

SET @curDateLast = DATEADD(m, DATEDIFF(m, 0, DATEADD(m, 1, GETDATE())), -1)
PRINT @curDateLast
SET @curDateFirst = DATEADD(m, DATEDIFF(m, 0, GETDATE()), 0)
PRINT @curDateFirst



SELECT  innerTable.StoreNumber
      , innerTable.WebNumber
	  , innerTable.City , innerTable.PoliticalDiv, innerTable.Country
      , innerTable.[Owner]
	  , innerTable.[CenterName]
      , innerTable.FBC
      , innerTable.RoyaltyPeriodID
      , innerTable.EndDate
      , innerTable.TotalSales
      , ISNULL(paymentCompany.RoyaltyCompanyType,2) AS RoyaltyCompanyType /* because there may not be a payment for this royalty period */
      , innerTable.CurrentFIIDUE 
      , innerTable.FIIDUE
      , innerTable.FIIRoyalty
      , innerTable.FIIReduction
      , SUM(CASE WHEN paymentCompany.FullName = 'FII' 
	             THEN paid.Amount
                 ELSE 0
            END) AS FIIPAID
INTO  #AlpineDueByRoyaltyPeriod
FROM    ( SELECT    cs.StoreNumber
                  , cs.WebNumber
				  , ca.City , cpd.FullName AS PoliticalDiv, cc.FullName AS Country
                  , dbo.GetStoreOwner(cs.StoreID) AS [Owner]
                  , cs.[VanityName] AS [CenterName]
                  , dbo.GetStoreFBC(cs.StoreID) AS [FBC]
                  , dbo.GetStoreDirector(cs.StoreID) AS [Director]
                  , srp.RoyaltyPeriodID
                  , srp.EndDate
                  , srr.RoyaltyReportID
                  , srr.TotalSales
                  , srr.FIIDue AS CurrentFIIDUE
                  , ( royalty.AllocationAmount * royalty.FIIPercent ) AS FIIROYALTY
                  , SUM(reduction.FIIAmount) AS FIIReduction
                  , ( ( royalty.AllocationAmount * royalty.FIIPercent )
                      + SUM(ISNULL(reduction.FIIAmount, 0)) ) AS FIIDUE

          FROM      COR_STORES cs
                    LEFT OUTER JOIN SLS_ROYALTY_PERIOD AS srp ON cs.StoreID = srp.StoreID
                                                              AND ( ( @AsOfDate IS NULL )
                                                              OR ( srp.EndDate <= @AsOfDate )
                                                              )
                    LEFT OUTER JOIN SLS_ROYALTY_REPORT AS srr ON srp.RoyaltyPeriodID = srr.RoyaltyPeriodID
                    LEFT OUTER JOIN SLS_ROYALTY_ALLOCATION AS royalty ON srr.RoyaltyReportID = royalty.RoyaltyReportID
                                           AND royalty.RoyaltyAllocationType = 2
                    LEFT OUTER JOIN SLS_ROYALTY_ALLOCATION AS reduction ON srr.RoyaltyReportID = reduction.RoyaltyReportID
                                                              AND reduction.RoyaltyAllocationType <> 2

INNER JOIN dbo.COR_STORES_ADDRESSES_LINK AS csal ON csal.StoreID = cs.StoreID
INNER JOIN dbo.COR_ADDRESSES AS ca ON ca.AddressID = csal.AddressID
INNER JOIN dbo.COR_POLITICAL_DIVISION AS cpd ON cpd.PoliticalDivisionID = ca.PoliticalDivisionID
INNER JOIN dbo.COR_COUNTRIES AS cc ON cc.CountryID = cpd.CountryID

          WHERE     ( ( @storenumber IS NULL )
                      OR ( cs.storeNumber = @storenumber )
                    )
                    AND ( ( @storeRange1 IS NULL )
                          OR ( cs.storeNumber >= @storeRange1 )
                        )
                    AND ( ( @storeRange2 IS NULL )
                          OR ( cs.storeNumber <= @storeRange2 )
                        )
                    AND ( ( @AsOfDate IS NULL )
                          OR ( srp.EndDate <= @AsOfDate )
                        )
                    AND ( ( @country IS NULL )
                          OR ( dbo.GetStoreInternationalRegion(cs.StoreID) = @country ) /* this is lame */
                          OR ( @storenumber IS NOT NULL )
                        )
          GROUP BY  cs.StoreID
                  , cs.StoreNumber
                  , cs.WebNumber
				  , ca.City , cpd.FullName , cc.FullName 
				  , cs.[VanityName]
                  , srp.RoyaltyPeriodID
                  , srp.EndDate
                  , srr.RoyaltyReportID
                  , srr.TotalSales
                  , srr.FIIDue
                  , royalty.AllocationAmount
                  , royalty.FIIPercent

        ) innerTable
        LEFT OUTER JOIN SLS_ROYALTY_DISTRIBUTION AS paid ON innerTable.RoyaltyPeriodID = paid.RoyaltyPeriodID AND paid.RoyaltyCompanyType = 2
        LEFT OUTER JOIN SLS_ROYALTY_COMPANY_TYPES AS paymentCompany ON paid.RoyaltyCompanyType = paymentCompany.RoyaltyCompanyType AND paid.RoyaltyCompanyType = 2
GROUP BY innerTable.StoreNumber
      , innerTable.WebNumber
	  , innerTable.City , innerTable.PoliticalDiv , innerTable.Country
      , innerTable.[Owner]
	  , innerTable.CenterName
      , innerTable.FBC
      , innerTable.RoyaltyPeriodID
      , innerTable.EndDate
      , innerTable.TotalSales
      , paymentCompany.RoyaltyCompanyType
      , innerTable.CurrentFIIDue
      , innerTable.FIIDue
      , innerTable.FIIRoyalty
      , innerTable.FIIReduction
ORDER BY ENDDATE


SELECT  SUM(RD.[Amount]) AS Payment
      , RD.[RoyaltyCompanyType]
      , RD.[RoyaltyPeriodID]
INTO #AlpineDueByRoyaltyPeriod_Step2
FROM    [dbo].[SLS_ROYALTY_DISTRIBUTION] RD
        LEFT OUTER JOIN [SLS_ROYALTY_PAYMENT] RP ON RP.[RoyaltyPaymentID] = RD.[RoyaltyPaymentID]
WHERE RP.RoyaltyPaymentReceived < @AsOfDate /* No payments after the As Of Date shoud be included */
GROUP BY RD.[RoyaltyCompanyType]
      , RD.[RoyaltyPeriodID]

/* currently only FII not NAC */
SELECT  rp.StoreNumber,rp.CenterName, rp.City , rp.PoliticalDiv , rp.Country
      , rp.enddate
      , @AsOfDate AS AsOfDate
      , DATEDIFF(DAY, rp.enddate, @AsOfDate) AS DaysBackFromReportAsOfDate
      , CASE WHEN DATEDIFF(DAY, rp.enddate, @AsOfDate) < 31
             THEN 'ZeroToThirty'
             WHEN DATEDIFF(DAY, rp.enddate, @AsOfDate) < 61
             THEN 'ThirtyToSixty'
             WHEN DATEDIFF(DAY, rp.enddate, @AsOfDate) < 91
             THEN 'SixtyToNinety'
             WHEN DATEDIFF(DAY, rp.enddate, @AsOfDate) < 121
             THEN 'NinetyToOneTwenty'
             ELSE 'MoreThanOneTwenty'
        END AS Bucket
      , rp.FIIDue
      , p.Payment
      , CurrentFIIDue
      , rp.FIIDUE - ISNULL(p.payment, 0) AS DueLessPayment
INTO   #AlpineDueByRoyaltyPeriod_Step3
FROM    #AlpineDueByRoyaltyPeriod RP
        LEFT OUTER JOIN #AlpineDueByRoyaltyPeriod_Step2 p ON RP.RoyaltyPeriodID = p.RoyaltyPeriodID
                                                            AND RP.RoyaltyCompanyType = p.RoyaltyCompanyType
        
WHERE   ( rp.royaltycompanytype IS NULL
          OR rp.royaltycompanytype = 2
        )
        AND ( rp.FIIDUE - ISNULL(p.payment, 0) > 0.01 ) /* OR rp.FIIDUE-ISNULL(p.payment,0) = 0)*/ /* OK'd by Tom for rounding issues up to .03 */
ORDER BY rp.storenumber
      , rp.enddate
	  


SELECT DISTINCT
        s3.AsOfDate
      , s3.StoreNumber
      , s3.CenterName
      , s3.City
      , s3.PoliticalDiv
      , s3.Country
      , ( SELECT    SUM(s4.DueLessPayment)
          FROM      #AlpineDueByRoyaltyPeriod_Step3 s4
          WHERE     s3.StoreNumber = s4.StoreNumber
                    AND s4.Bucket = 'ZeroToThirty'
        ) AS ZeroToThirty
      , ( SELECT    SUM(s4.DueLessPayment)
          FROM      #AlpineDueByRoyaltyPeriod_Step3 s4
          WHERE     s3.StoreNumber = s4.StoreNumber
                    AND s4.Bucket = 'ThirtyToSixty'
        ) AS ThirtyToSixty
      , ( SELECT    SUM(s4.DueLessPayment)
          FROM      #AlpineDueByRoyaltyPeriod_Step3 s4
          WHERE     s3.StoreNumber = s4.StoreNumber
                    AND s4.Bucket = 'SixtyToNinety'
        ) AS SixtyToNinety
      , ( SELECT    SUM(s4.DueLessPayment)
          FROM      #AlpineDueByRoyaltyPeriod_Step3 s4
          WHERE     s3.StoreNumber = s4.StoreNumber
                    AND s4.Bucket = 'NinetyToOneTwenty'
        ) AS NinetyToOneTwenty
      , ( SELECT    SUM(s4.DueLessPayment)
          FROM      #AlpineDueByRoyaltyPeriod_Step3 s4
          WHERE     s3.StoreNumber = s4.StoreNumber
                    AND s4.Bucket = 'MoreThanOneTwenty'
        ) AS MoreThanOneTwenty
      , SUM(DueLessPayment) AS Total
FROM    #AlpineDueByRoyaltyPeriod_Step3 s3
GROUP BY AsOfDate
      , StoreNumber
      , CenterName
      , s3.City
      , s3.PoliticalDiv
      , s3.Country

DROP TABLE  #AlpineDueByRoyaltyPeriod
DROP TABLE  #AlpineDueByRoyaltyPeriod_Step2
DROP TABLE  #AlpineDueByRoyaltyPeriod_Step3

GO
