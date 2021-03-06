/****** Object:  StoredProcedure [dbo].[SalesComparison]    Script Date: 5/15/2018 12:09:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[SalesComparison]
( 
@Country varchar(2) = 'US',
@ReportDate datetime = NULL
)
AS
SET NOCOUNT ON

DECLARE @MonthNum int
DECLARE @SalesMonthLastYear datetime
DECLARE @SalesMonthThisYear datetime
DECLARE @EndDateLastYear datetime
DECLARE @EndDateThisYear datetime
DECLARE @StoreCount int
DECLARE @Sales money
DECLARE @TotalSalesLastYear money
DECLARE @TotalSalesThisYear money

IF @ReportDate IS NULL
BEGIN
	SET @ReportDate = DATEADD(dd, -1, GETDATE())
END

SET @SalesMonthThisYear = CAST((CAST(Year(@ReportDate) AS varchar(4)) + '-01-01 00:00:00.000') AS datetime)
SET @SalesMonthLastYear = DATEADD(yy,-1,@SalesMonthThisYear)
SET @TotalSalesLastYear = 0
SET @TotalSalesThisYear = 0
SET @MonthNum = 1

CREATE TABLE #MonthlySales (
[Year] int,
[Month] int,
[StoreCount] int,
[Sales] money )

WHILE @MonthNum <= DATEPART(month, @ReportDate) 
BEGIN
	IF @MonthNum = DATEPART(month, @ReportDate)
	BEGIN
		SET @EndDateLastYear = DATEADD(dd, DATEPART(day, @ReportDate), @SalesMonthLastYear)
		SET @EndDateThisYear = DATEADD(dd, DATEPART(day, @ReportDate), @SalesMonthThisYear)
	END
	ELSE
	BEGIN
		SET @EndDateLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
		SET @EndDateThisYear = DATEADD(mm, 1, @SalesMonthThisYear)
	END

	--Last Year
	SELECT @Sales = SUM(g.RoyaltyAmt), @StoreCount = COUNT(DISTINCT(s.StoreKey)) FROM GL_Fact g
	JOIN DateDim d ON g.DateKey = d.DateKey
	JOIN StoreDim s ON g.StoreKey = s.StoreKey
	WHERE g.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND s.CountryCode = @Country AND s.Operational <> 'Closed'
	AND s.T_WebNumber > 0 AND s.T_WebNumber NOT IN (849,898,900,901,902,903,904,905,906,907,908,909,981,982,983,984,985,986,987,988,989)
	AND s.StoreOpenDate <= @SalesMonthLastYear AND d.ActualDate >= @SalesMonthLastYear AND d.ActualDate < @EndDateLastYear
	AND ((SELECT SUM(gl.RoyaltyAmt) FROM GL_Fact gl
			JOIN DateDim dd ON gl.DateKey = dd.DateKey
			JOIN StoreDim store ON gl.StoreKey = store.StoreKey
			WHERE gl.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND store.StoreKey = s.StoreKey
			AND dd.ActualDate >= @SalesMonthThisYear AND dd.ActualDate < @EndDateThisYear) > 0)
	AND ((SELECT SUM(gl.RoyaltyAmt) FROM GL_Fact gl
			JOIN DateDim dd ON gl.DateKey = dd.DateKey
			JOIN StoreDim store ON gl.StoreKey = store.StoreKey
			WHERE gl.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND store.StoreKey = s.StoreKey
			AND dd.ActualDate >= @SalesMonthLastYear AND dd.ActualDate < @EndDateLastYear) > 0)

	INSERT INTO #MonthlySales ([Year], [Month], [StoreCount], [Sales]) VALUES (DATEPART(year, @SalesMonthLastYear), @MonthNum, @StoreCount, @Sales)
	SET @TotalSalesLastYear = @TotalSalesLastYear + @Sales
	
	--This Year
	SELECT @Sales = SUM(g.RoyaltyAmt), @StoreCount = COUNT(DISTINCT(s.StoreKey)) FROM GL_Fact g
	JOIN DateDim d ON g.DateKey = d.DateKey
	JOIN StoreDim s ON g.StoreKey = s.StoreKey
	WHERE g.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND s.CountryCode = @Country AND s.Operational <> 'Closed'
	AND s.T_WebNumber > 0 AND s.T_WebNumber NOT IN (849,898,900,901,902,903,904,905,906,907,908,909,981,982,983,984,985,986,987,988,989)
	AND s.StoreOpenDate <= @SalesMonthLastYear AND d.ActualDate >= @SalesMonthThisYear AND d.ActualDate < @EndDateThisYear
	AND ((SELECT SUM(gl.RoyaltyAmt) FROM GL_Fact gl
			JOIN DateDim dd ON gl.DateKey = dd.DateKey
			JOIN StoreDim store ON gl.StoreKey = store.StoreKey
			WHERE gl.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND store.StoreKey = s.StoreKey
			AND dd.ActualDate >= @SalesMonthThisYear AND dd.ActualDate < @EndDateThisYear) > 0)
	AND ((SELECT SUM(gl.RoyaltyAmt) FROM GL_Fact gl
			JOIN DateDim dd ON gl.DateKey = dd.DateKey
			JOIN StoreDim store ON gl.StoreKey = store.StoreKey
			WHERE gl.AccountCode IN (4001, 4002, 4003, 4110, 4120) AND store.StoreKey = s.StoreKey
			AND dd.ActualDate >= @SalesMonthLastYear AND dd.ActualDate < @EndDateLastYear) > 0)

	INSERT INTO #MonthlySales ([Year], [Month], [StoreCount], [Sales]) VALUES (DATEPART(year, @SalesMonthThisYear), @MonthNum, @StoreCount, @Sales)
	SET @TotalSalesThisYear = @TotalSalesThisYear + @Sales

	SET @MonthNum = @MonthNum + 1
	SET @SalesMonthLastYear = DATEADD(mm, 1, @SalesMonthLastYear)
	SET @SalesMonthThisYear = DATEADD(mm, 1, @SalesMonthThisYear)
END

INSERT INTO #MonthlySales ([Year], [Month], [Sales]) VALUES (DATEPART(year, DATEADD(yy, -1, @ReportDate)), 13, @TotalSalesLastYear)
INSERT INTO #MonthlySales ([Year], [Month], [Sales]) VALUES (DATEPART(year, @ReportDate), 13, @TotalSalesThisYear)

SELECT [Year], [Month], [StoreCount], [Sales] FROM #MonthlySales
ORDER BY [Year], [Month]

DROP TABLE #MonthlySales

GO
