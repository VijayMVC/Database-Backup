/****** Object:  StoredProcedure [dbo].[z360core_Rep_SalesDashboard]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[z360core_Rep_SalesDashboard] 
(
@dateto datetime, 
@franchise varchar(7),
@OpenDate datetime
)
AS
BEGIN

SET NOCOUNT ON;

 print 'begin: ' 
print convert(varchar(30),getdate()) + ':' +  convert(varchar(30),datepart(ss,getdate())) + + ':' +  convert(varchar(30),datepart(ms,getdate()))

declare @lastFinished datetime
declare @difference float
SET @lastFinished = getdate()

DECLARE @date datetime, @dateLY datetime, @datePLY datetime
SET @date = dateadd(hh,-13, @dateto)

DECLARE @dailyCloseoutEnd DATETIME
Select @dailyCloseoutEnd= Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @date and zw_franchise_id = @franchise
DECLARE @dailyCloseoutStart  DATETIME
Select @dailyCloseoutStart = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @dailyCloseoutEnd and zw_franchise_id = @franchise
DECLARE @monthlyCloseout DATETIME
Select @monthlyCloseout = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'M' and Date < @date and zw_franchise_id = @franchise
If datediff(dd, @monthlyCloseout, @dailyCloseoutEnd) < 1
	BEGIN 
		Select @monthlyCloseout = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'M' and Date < @monthlyCloseout and zw_franchise_id = @franchise
	END
DECLARE @yearlyCloseout DATETIME
Select @yearlyCloseout = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'Y' and Date < @date and zw_franchise_id = @franchise
DECLARE @preMonthlyCloseout DATETIME
Select @preMonthlyCloseout = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'M' and Date < @monthlyCloseout and zw_franchise_id = @franchise

SET @dateLY =  cast( month(@dailyCloseoutEnd) as varchar(2)) + '/' + cast(day(@dailyCloseoutEnd) as varchar(2)) + '/' + cast((year(@dailyCloseoutEnd)-1) as varchar(4)) + '  10:59:59' 
SET @datePLY =  cast( month(@dailyCloseoutEnd) as varchar(2)) + '/' + cast(day(@dailyCloseoutEnd) as varchar(2)) + '/' + cast((year(@dailyCloseoutEnd)-2) as varchar(4)) + '  10:59:59' 

DECLARE @rolling12Start DATETIME
Select @rolling12Start = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @dateLY and zw_franchise_id = @franchise
DECLARE @dailyCloseoutEndLY DATETIME
Select @dailyCloseoutEndLY= Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @dateLY and zw_franchise_id = @franchise
DECLARE @dailyCloseoutStartLY  DATETIME
Select @dailyCloseoutStartLY = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @dailyCloseoutEndLY and zw_franchise_id = @franchise
DECLARE @monthlyCloseoutLY DATETIME
Select @monthlyCloseoutLY = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'M' and Date < @dateLY and zw_franchise_id = @franchise
DECLARE @yearlyCloseoutLY DATETIME
Select @yearlyCloseoutLY = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'Y' and Date < DATEADD(d, 0, DATEDIFF(d, 0, @yearlyCloseout)) and zw_franchise_id = @franchise
if year(@yearlyCloseoutLY) - year(@yearlyCloseout) =0
begin
set	@yearlyCloseoutLY = DATEADD(yy, -1, DATEDIFF(d, 0, @yearlyCloseout))	
end
DECLARE @rolling12StartLY DATETIME
Select @rolling12StartLY = Coalesce(Max( Date ), '1/1/1900' ) FROM [Closeout Database] WHERE CloseoutType = 'D' and Date < @datePLY  and zw_franchise_id = @franchise

DECLARE	@DaysInMonth FLOAT /* Float needed for currency division */
SET @DaysInMonth = DAY(DATEADD(d, -DAY(DATEADD(m,1,@date)),DATEADD(m,1,@date)))
DECLARE @RollingTwelveDate DATETIME
SET @RollingTwelveDate = DATEADD(year, -1, @date)
declare @beginningOfMonth datetime
set @beginningOfMonth = [dbo].[ufn_GetFirstDayOfMonth] ( @dailyCloseoutEnd )
DECLARE @FractionOfMonth FLOAT
SET @FractionOfMonth = convert(float,datediff(day,@monthlyCloseout,@dailyCloseoutEnd))/convert(float,@DaysInMonth)
DECLARE @maxYear smallint
SELECT @maxYear = max(year) FROM [Sales Goals Database] WHERE zw_franchise_id = @franchise and Year <= DATEPART(yy, getdate())




--IF year(@yearlyCloseoutLY)< (Year(@dateto)-2) and (year(@openDate) not in (Year(@date), Year(@date)-1) or year(@openDate) is null)
--    BEGIN
--			Select ('Through Date of Last Closeouts: ' + Convert(varchar(20),dateadd(hh, 13, @dailyCloseoutEnd)) + '(D) --- ' 
--			+ Convert(varchar(20),dateadd(hh, 13,@monthlyCloseout)) + '(M) --- '
--			+ Convert(varchar(20),dateadd(hh, 13, @yearlyCloseout)) + '(Y)') as DateUsed,
--			'1/1/1900' dateto, 
--			@dailyCloseoutStart dailyCloseoutStart, 
--			@dailyCloseoutEnd dailyCloseoutEnd, 
--			@monthlyCloseout monthlyCloseout,
--			@yearlyCloseoutLY
--        RETURN
--    END

DECLARE @yesterday DATE
SET @yesterday = DATEADD(d, -1, @dateto)
DECLARE @beginMonth DATE
SET @beginMonth = CAST(MONTH(@yesterday) AS VARCHAR(2)) + '/1/'
    + CAST(YEAR(@yesterday) AS CHAR(4))
DECLARE @endMonth DATE
SET @endMonth = DATEADD(d, -1, DATEADD(m, 1, @beginMonth))
DECLARE @beginYear DATE
SET @beginYear = '1/1/' + CAST(YEAR(@yesterday) AS CHAR(4))
set @yearlyCloseout = @beginYear
DECLARE @endYear DATE
SET @endYear = DATEADD(d, -1, DATEADD(yy, 1, @beginMonth))
set @yearlyCloseoutLY=DateAdd(yy, -1, @yearlyCloseout)
DECLARE @MTD_Days FLOAT	
SET @MTD_Days = CAST(DATEDIFF(d, @beginMonth, @endMonth) AS FLOAT)
DECLARE @YTD_Days FLOAT
SET @YTD_Days = CAST(DATEDIFF(d, @beginYear, @yesterday) AS FLOAT)

IF year(@yearlyCloseoutLY)< (Year(@dateto)-2)  and Year(@openDate) in (Year(@date), Year(@date)-1)
	BEGIN
		IF year(@openDate) = Year(@date)
			BEGIN
				set @yearlyCloseout = DateAdd(dd, datename(dy,@Date)* -1, @date)
				set @yearlyCloseoutLY = DateAdd(yy, -1, @yearlyCloseout)
			END
		IF year(@openDate) = (Year(@date) - 1)
			BEGIN
				set @yearlyCloseoutLY = DateAdd(yy, -1, @yearlyCloseout)
			END
	END


/* CREATE TEMP TABLE FOR HOLDING CUSTOMER FIRST ORDER DATE*/
DECLARE @tFirstTimeCustomersYTD TABLE ( CustomerID int, FirstOrderDate datetime )
INSERT into @tFirstTimeCustomersYTD
SELECT customerID, COALESCE( min(OrderDate), '1900-01-01' )
FROM [ORDER Database]
WHERE zw_franchise_id = @franchise and status <> 'voided'
GROUP BY customerID
HAVING COALESCE( min(OrderDate), '1900-01-01' ) >= @yearlyCloseoutLY

print 'end create temp'
PRINT ''

SET @difference = DATEDIFF(ms, @lastFinished, getdate() )
print CAST(@difference as varchar(7)) + ' milliseconds'
SET @lastFinished = getdate()

/* Use Temp Table to get count of YTD First Time Customers and Previous YTD too */
DECLARE @CustYTD int, @CustYTDLY int
SELECT 
	 @CustYTD = COUNT(CASE WHEN FirstOrderDate BETWEEN @yearlyCloseout AND @dailyCloseoutEnd THEN CustomerID END),
	@CustYTDLY = COUNT(CASE WHEN FirstOrderDate BETWEEN @yearlyCloseoutLY AND @dailyCloseoutEndLY THEN CustomerID END)
FROM @tFirstTimeCustomersYTD

-----------------------------------------------------------------

DECLARE @customercount TABLE ( CustomerID int, OrderID int)
declare @NoInvoicesYTD int, @NoInvoicesYTDLY int, @FirstOrderDate datetime, @SalesSubtotal money
DEclare @TotalInvoicesYTD money, @TotalInvoicesYTDLY money
DECLARE @overridesYTD int, @overridesYTDLY int, @orderOverrides int

SET @NoInvoicesYTD = 0
SET @NoInvoicesYTDLY = 0
SET @TotalInvoicesYTD = 0
SET @TotalInvoicesYTDLY = 0
SET @overridesYTD = 0
SET @overridesYTDLY = 0

DECLARE @OrderID INT
declare @customerID int

DECLARE ordercur CURSOR LOCAL  FAST_FORWARD FOR
select o.OrderId, o.CustomerId, o.SalesSubtotal
from [Order Database] o
where  o.orderDate >= @yearlyCloseoutLY
and o.zw_franchise_id = @franchise

OPEN ordercur

FETCH NEXT FROM ordercur
INTO @OrderID, @customerID, @SalesSubtotal

WHILE @@FETCH_STATUS = 0
BEGIN
	/* must 'reset' this as the SELECT assignment doesn't seem to clear it out on its own */
	SET @FirstOrderDate = '1900-01-01'

	SELECT @FirstOrderDate = COALESCE(FirstOrderDate, '1900-01-01')
	FROM @tFirstTimeCustomersYTD
	WHERE customerID = @customerID

	SET @orderOverrides = 0
		
	IF( @FirstOrderDate BETWEEN @yearlyCloseoutLY AND @dailyCloseoutEnd ) 
	BEGIN
			SELECT @orderOverrides =
				SUM( CAST(BasePriceOverriden as tinyint) + CAST(OverRidden as tinyint) + CAST(AVOverridden as tinyint) )
			FROM [Order Details Database] /* WITH (INDEX(Idx_OrderID_FranchiseID)) */
			WHERE OrderID = @OrderID
			AND zw_franchise_id = @franchise
			GROUP BY OrderID OPTION (Fast 5)

			IF( @orderOverrides > 0)
				SET @orderOverrides = 1
	END

	IF( @FirstOrderDate BETWEEN @yearlyCloseout AND @dailyCloseoutEnd ) 
		BEGIN
			SET @NoInvoicesYTD = @NoInvoicesYTD + 1
			SET @TotalInvoicesYTD = @TotalInvoicesYTD + @SalesSubtotal
			SET @overridesYTD = @overridesYTD + @orderOverrides
		END
	ELSE IF( @FirstOrderDate BETWEEN @yearlyCloseoutLY AND @dailyCloseoutEndLY ) 
		BEGIN
			SET @NoInvoicesYTDLY = @NoInvoicesYTDLY + 1
			SET @TotalInvoicesYTDLY = @TotalInvoicesYTDLY + @SalesSubtotal
			SET @overridesYTDLY = @overridesYTDLY + @orderOverrides
		END

FETCH NEXT FROM ordercur
INTO @OrderID, @customerId, @SalesSubtotal
END

CLOSE ordercur

DEALLOCATE ordercur

PRINT ''
print 'finish order cursor'
SET @difference = DATEDIFF(ms, @lastFinished, getdate() )
print CAST(@difference as varchar(7)) + ' milliseconds'
SET @lastFinished = getdate()
PRINT ''

-- TAF
--SET @yearlyCloseout=CAST('1/1/'+STR(year(@dateto)) AS DATETIME)
--PRINT @yearlyCloseout
--PRINT ''



/*-----------------------------------------------------------------------------------------------------------------*/


SELECT * FROM
(
SELECT 
('Through Date of Last Closeouts: ' + Convert(varchar(20),dateadd(hh, 12, @dailyCloseoutEnd)) + '(D) --- ' 
+ Convert(varchar(20),dateadd(hh, 13,@monthlyCloseout)) + '(M) --- '
+ Convert(varchar(20),dateadd(hh, 13, @yearlyCloseout)) + '(Y)') as DateUsed,
@date dateto, 
@dailyCloseoutStart dailyCloseoutStart, 
@dailyCloseoutEnd dailyCloseoutEnd, 
@monthlyCloseout monthlyCloseout,
isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120)  and  DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
THEN Amount 
ELSE 0 END ),0) DailyPlacedAmount,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd
	THEN Amount
ELSE 0 END ),0) TotalAmountPlacedMTD,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @yearlyCloseout and @dailyCloseoutEnd 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @yearlyCloseout and @dailyCloseoutEnd
	THEN Amount
ELSE 0 END ),0) CurrentYTD,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between  @rolling12Start and @dailyCloseoutEnd 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between  @rolling12Start and @dailyCloseoutEnd
	THEN Amount
ELSE 0 END ),0) CurrentRollingTwelve,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120)  and  DATETIME between @dailyCloseoutStartLY and @dailyCloseoutEndLY
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @dailyCloseoutStartLY and @dailyCloseoutEndLY
THEN Amount 
ELSE 0 END ),0) PreviousYearYesterday,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseoutLY and @dailyCloseoutEndLY 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @monthlyCloseoutLY and @dailyCloseoutEndLY
	THEN Amount
ELSE 0 END ),0) PreviousYearMTD,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @yearlyCloseoutLY and @dailyCloseoutEndLY 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between @yearlyCloseoutLY and @dailyCloseoutEndLY
	THEN Amount
ELSE 0 END ),0) PreviousYearYTD,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between  @rolling12StartLY and @dailyCloseoutEndLY 
THEN -Amount 
WHEN AccountCode IN (1250, 1260) and DATETIME between  @rolling12StartLY and @dailyCloseoutEndLY
	THEN Amount
ELSE 0 END ),0) PreviousYearRollingTwelve,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120)  and  DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
THEN -Amount 
ELSE 0 END ),0) DailyPickedUp,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd 
THEN -Amount 
ELSE 0 END ),0) MTDPickedUp,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @yearlyCloseout and @dailyCloseoutEnd 
THEN -Amount 
ELSE 0 END ),0) YTDPickedUp,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between  @rolling12Start and @dailyCloseoutEnd 
THEN -Amount 
ELSE 0 END ),0) R12PickedUp,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120)  and  DATETIME between @dailyCloseoutStartLY and @dailyCloseoutEndLY
THEN -Amount 
ELSE 0 END ),0) DailyPickedUpLY,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseoutLY and @dailyCloseoutEndLY 
THEN -Amount 
ELSE 0 END ),0) MTDPickedUpLY,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @yearlyCloseoutLY and @dailyCloseoutEndLY 
THEN -Amount 
ELSE 0 END ),0) YTDPickedUpLY,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between  @rolling12StartLY and @dailyCloseoutEndLY 
THEN -Amount 
ELSE 0 END ),0) R12PickedUpLY,


isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
THEN -Amount 
WHEN AccountCode IN (1260) and DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
	THEN Amount
ELSE 0 END ),0) DailyBuiltAmount,

isnull(Sum( CASE WHEN AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd
THEN -Amount 
WHEN AccountCode IN (1260) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd
	THEN Amount
ELSE 0 END ),0) TotalAmountBuiltMTD,

isnull(Sum(CASE WHEN  AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd
THEN -Amount 
ELSE 0 END),0) DailyPickedUpAmount,

isnull(Sum(CASE WHEN  AccountCode IN (4001, 4002, 4003, 4110, 4120) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd
THEN -Amount 
ELSE 0 END),0) TotalAmountPickedUpMTD,

isnull(Sum(CASE WHEN AccountCode IN (1100) and DATETIME between @dailyCloseoutStart and @dailyCloseoutEnd 
THEN Amount
ELSE 0 END ),0) DailyPaymentAmount,

isnull(Sum(CASE WHEN AccountCode IN (1100) and DATETIME between @monthlyCloseout and @dailyCloseoutEnd 
THEN Amount
ELSE 0 END ),0) TotalAmountPaymentMTD,

isnull(Sum(CASE WHEN AccountCode in (4001, 4003, 4110, 4120) and SubAccountCode = 100 and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN -Amount
	ELSE 0
END),0) SignSales,

isnull(Sum(CASE WHEN AccountCode in (4001, 4003, 4110, 4120) and SubAccountCode = 200 and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN -Amount
	ELSE 0
END),0) ModifierSales,

isnull(Sum(CASE WHEN AccountCode in (4001, 4002, 4003, 4110, 4120) and SubAccountCode = 400 and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN -Amount
	ELSE 0
END),0) InstallSales,

isnull(Sum(CASE WHEN AccountCode in (4120) and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN Amount
WHEN AccountCode in (4001, 4003, 4110) and SubAccountCode = 300 and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN Amount
	ELSE 0
END),0) DiscountSales, 

isnull(Sum(CASE WHEN AccountCode in (4002) and SubAccountCode <> 400 and DateTime between @yearlyCloseout and @dailyCloseoutEnd
THEN -Amount
	ELSE 0
END),0) SubcontractSales
FROM [GL Database]
WHERE	DATETIME between  @rolling12StartLY and @dailyCloseoutEnd
		AND zw_franchise_id = @franchise
) tGL

Inner join 

( 
SELECT 
isnull(Sum(CASE WHEN  ClosedDate between @dailyCloseoutStart and @dailyCloseoutEnd 
THEN SalesSubTotal
ELSE 0 END),0) DailyClosedAmount,

isnull(Sum(CASE WHEN  ClosedDate between @monthlyCloseout and @dailyCloseoutEnd 
THEN SalesSubTotal
ELSE 0 END),0) TotalAmountClosedMTD,

--isnull (Sum(CASE WHEN  PickedUpDate between @yearlyCloseout and @dailyCloseoutEnd
--	THEN ProductionCat2Sales
--ELSE 0 END),0) SubcontractSales,

isnull (Avg(CASE WHEN OrderDate BETWEEN @yearlyCloseout AND @dailyCloseoutEnd
	THEN SalesSubTotal
END),0) YTDAvg,

isnull (Avg(CASE WHEN OrderDate BETWEEN @yearlyCloseoutLY AND @dailyCloseoutEndLY
	THEN SalesSubTotal
END),0) LYYTDAvg,

isnull (Avg(CASE WHEN OrderDate BETWEEN @rolling12Start AND @dailyCloseoutEnd
	THEN SalesSubTotal
END),0) LastTwelveMonths,

isnull (Avg(CASE WHEN OrderDate BETWEEN @rolling12StartLY AND @rolling12Start
	THEN SalesSubTotal
END),0) PreviousTwelveMonths,

ISNULL(SUM(CASE WHEN OrderDate < @monthlyCloseout AND OrderDate > @preMonthlyCloseout
    THEN SalesSubtotal
ELSE 0 END),0) AS LastMonthSales
FROM [Order Database]
WHERE (ClosedDate between @monthlyCloseout and @dailyCloseoutEnd AND [Order Database].zw_franchise_id = @franchise)
  or (PickedUpDate between @yearlyCloseout and @dailyCloseoutEnd
		AND [Order Database].zw_franchise_id = @franchise)
or (OrderDate BETWEEN @rolling12StartLY AND @dailyCloseoutEnd AND [Order Database].zw_franchise_id = @franchise)
) tOrder on 1 = 1

INNER JOIN

(Select
ISNULL(SUM(Amount),0) as WIP
FROM [Order Database] o
inner join [GL Database] g on g.orderID = o.orderId and g.zw_franchise_id = o.zw_franchise_id and g.accountcode in (1250,1260)
WHERE OrderDate < @dailyCloseoutEnd AND Status IN ('WIP', 'Built')and o.zw_franchise_id = @franchise) tWIP on 1=1

INNER JOIN 

(
SELECT ISNULL(SUM(CASE WHEN Month = DATEPART(mm, @dailyCloseoutEnd)
	THEN SalesTotal
ELSE 0 END), 0) AS MonthlySalesGoal,
ISNULL(SUM(CASE WHEN Month = DATEPART(mm, @dailyCloseoutEnd)
	THEN SalesTotal
ELSE 0 END), 0)/@DaysInMonth AS TYForecastYesterday,
ISNULL(SUM(CASE WHEN Month = DATEPART(mm, @dailyCloseoutEnd)
	THEN SalesTotal
ELSE 0 END),0) * @FractionOfMonth AS TYForecastMTD,
ISNULL(SUM(CASE WHEN Month < DATEPART(mm, @dailyCloseoutEnd)
	THEN SalesTotal
ELSE 0 END), 0) AS TYForecastToLastMonth,
ISNULL (SUM(SalesTotal),0) AS TYForecastRolling12
   FROM [Sales Goals Database]
     WHERE zw_franchise_id = @franchise and Year = @maxYear
) tSalesGoal on 1=1


INNER JOIN 

(
select 
@CustYTD as FirstTimeCustomerYTD, 
@CustYTDLY as FirstTimeCustomerLYYTD,
@NoInvoicesYTD as NoOfInvoicesYTD,
(CASE WHEN  @NoInvoicesYTD=0 THEN 0.00 ELSE (@TotalInvoicesYTD / @NoInvoicesYTD) END) as InvoiceAvgYTD
)tCustomer on 1=1

INNER JOIN 

(
select 
@NoInvoicesYTDLY as NoOfInvoicesLYYTD,
(CASE WHEN @NoInvoicesYTDLY = 0 THEN 0.00 ELSE ( @TotalInvoicesYTDLY/@NoInvoicesYTDLY) END) as InvoiceAvgLYYTD
)tLYCustomer on 1=1

INNER JOIN 

(
select 
@overridesYTDLY as OverRidesLYYTD
)tLYOverride on 1=1

INNER JOIN 

(

SELECT @overridesYTD as OverRidesYTD

)tOverride on 1=1


INNER JOIN

(
SELECT
COUNT(Distinct CASE WHEN Prospect = 1
	THEN [Customer Database].CustomerID
END) AS YTDProspects,
COUNT(Distinct CASE WHEN ActiveCustomer = 1 AND Prospect = 0
    THEN [Customer Database].CustomerID
END) AS YTDCustomers
FROM [Customer Database]
WHERE [Customer Database].zw_franchise_id = @franchise and customerID > 0
) tProspect on 1 = 1

INNER JOIN

(
Select
COUNT(DISTINCT CASE WHEN ActiveCustomer = 1 AND Prospect = 0 and orderdate BETWEEN @rolling12Start AND @dailyCloseoutEnd
	THEN [Customer Database].CustomerID
END) AS R12Customers,

COUNT(CASE WHEN ActiveCustomer = 1 AND Prospect = 0 and orderdate BETWEEN @rolling12Start AND @dailyCloseoutEnd
	THEN OrderID
END) AS R12Orders,

COUNT(DISTINCT CASE WHEN ActiveCustomer = 1 AND Prospect = 0 and orderdate BETWEEN @rolling12StartLY AND @dailyCloseoutEndLY
	THEN [Customer Database].CustomerID
END) AS LR12Customers,

COUNT(CASE WHEN ActiveCustomer = 1 AND Prospect = 0 and orderdate BETWEEN @rolling12StartLY AND @dailyCloseoutEndLY
	THEN OrderID
END) AS LR12Orders

FROM [Customer Database]
Left Outer JOIN [Order Database] on [Customer Database].customerid = [Order Database].customerid and [Customer Database].zw_franchise_id = [Order Database].zw_franchise_id
WHERE [Customer Database].zw_franchise_id = @franchise and orderdate BETWEEN @rolling12StartLY and @dailyCloseoutEnd
) tCustomerProspect on 1=1

INNER JOIN 

(
SELECT ISNULL(SUM(PaymentAmount),0) AS Deposits
FROM [Payments Database]
INNER JOIN [Order Database] on [Order Database].OrderID = [Payments Database].OrderID and [Order Database].zw_franchise_id = [Payments Database].zw_franchise_id
WHERE [Payments Database].[zw_franchise_id] = @franchise
AND  Status IN ('WIP', 'Built', 'On Hold')
) tPayment on 1=1

Left Outer Join

(
SELECT MTDRanking, YTDRanking
FROM _zw_Ranking_data where zw_franchise_id = @franchise
)tRankings on 1=1

INNER JOIN 

(
SELECT Max(MTDRanking) as MTDoutof, Max(YTDRanking) as YTDoutof, Count(MTDRanking) as Outof
FROM _zw_Ranking_data
)tOutof on 1=1
END

GO
