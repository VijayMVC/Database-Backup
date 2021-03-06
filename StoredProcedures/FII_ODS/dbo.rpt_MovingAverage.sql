/****** Object:  StoredProcedure [dbo].[rpt_MovingAverage]    Script Date: 5/15/2018 12:09:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC rpt_MovingAverage (@ReportDate DATE='2/15/16',@MovingDay INT=42)
as
DECLARE @ReportDays INT,@Counter INT
--SET @ReportDate = '2/15/16'
--SET @MovingDay = 42
SET @ReportDays = 90
SET @Counter=0

CREATE TABLE #Reporter (ZW_Franchise_ID CHAR(7),DayAve FLOAT,This MONEY,Last MONEY,ReportDate DATE)


WHILE (@Counter<@ReportDays)

BEGIN

IF DATEPART(WEEKDAY,@ReportDate)=1 SET @ReportDate = DATEADD(DAY,-2,@ReportDate);

INSERT INTO #Reporter
SELECT
    *
FROM
    ( SELECT
        'All' AS ZW_Franchise_ID ,
        ( SUM(ISNULL(tmpGLDailyComps.ThisYear, 0))
          - SUM(ISNULL(tmpGLDailyComps.LastYear, 0)) )
        / SUM(ISNULL(tmpGLDailyComps.LastYear, 0)) * 100 AS DayAve ,
		SUM(ISNULL(tmpGLDailyComps.ThisYear, 0)) AS This,SUM(ISNULL(tmpGLDailyComps.LastYear, 0)) AS Last,@ReportDate AS ReportDate
      FROM
        tmpGLDailyComps
      WHERE
        tmpGLDailyComps.CountryCode = 'US'
        AND tmpGLDailyComps.PK_Date >= DATEADD(d, -1*@MovingDay, @ReportDate)
        AND tmpGLDailyComps.PK_Date <= @ReportDate
      UNION ALL
Select
  Driver.ZW_Franchise_ID,
  Driver.DayAve,
  Driver.This,
  Driver.Last,@ReportDate AS ReportDate
From
  (Select
    tmpGLDailyComps.ZW_Franchise_ID,
    (Sum(tmpGLDailyComps.ThisYear) - Sum(tmpGLDailyComps.LastYear)) /
    Sum(tmpGLDailyComps.LastYear) * 100 As DayAve,
    Sum(IsNull(tmpGLDailyComps.ThisYear, 0)) As This,
    Sum(IsNull(tmpGLDailyComps.LastYear, 0)) As Last
  From
    tmpGLDailyComps
  Where
    tmpGLDailyComps.CountryCode = 'US' And
    tmpGLDailyComps.PK_Date >= DATEADD(d, -1*@MovingDay, @ReportDate) And
    tmpGLDailyComps.PK_Date <= @ReportDate
  Group By
    tmpGLDailyComps.ZW_Franchise_ID) Driver
  Join Store.StoreFact
    On Store.StoreFact.ZW_Franchise_ID = Driver.ZW_Franchise_ID
  Inner Join (Select
    Royalty.CenterSales.StoreNumber,
    Max(Royalty.CenterSales.PeriodEndDate) As Max_PeriodEndDate
  From
    Royalty.CenterSales
  Group By
    Royalty.CenterSales.StoreNumber) Royalty
    On Royalty.StoreNumber = Store.StoreFact.StoreNumber
Where
  Royalty.Max_PeriodEndDate > DateAdd(m, -1, GetDate()) And
  Store.StoreFact.Status = 1 And
  Store.StoreFact.StoreOpenDate < DateAdd(m, -26, @ReportDate) 
    ) Lister
WHERE Lister.DayAve IS NOT null
ORDER BY
    Lister.ZW_Franchise_ID

SET @Counter=@Counter+1

SET @ReportDate = DATEADD(DAY,-1,@ReportDate)

END	--(@Counter<@ReportDays)

SELECT * FROM #Reporter WHERE ZW_Franchise_ID='All'

DROP TABLE #Reporter
GO
