/****** Object:  StoredProcedure [dbo].[usp_CreateTimeDim]    Script Date: 5/15/2018 12:09:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[usp_CreateTimeDim]  AS

--delete contents of Date Dimension Table
TRUNCATE TABLE dbo.DateDim

--declare variables
DECLARE @DateKey INT
DECLARE @DT DATETIME
DECLARE @YEAR INT
DECLARE @QUARTER INT
DECLARE @QuarterName CHAR(2)
DECLARE @MONTH  INT
DECLARE @WEEK  INT
DECLARE @DayofYear INT
DECLARE @DayofMonth INT
DECLARE @DayofWeek INT
DECLARE @IsWeekend  BIT
DECLARE @IsHoliday  BIT
DECLARE @CalendarWeek INT
DECLARE @CalendarMonth INT
DECLARE @CalendarQtr INT
DECLARE @DayName VARCHAR(20)
DECLARE @MonthName VARCHAR(20)
DECLARE @BusinessYearWeek INT
DECLARE @LeapYear BIT

--initialize variables

SELECT @BusinessYearWeek =0
SELECT @CalendarWeek = 1
SELECT @LeapYear =0

--the starting date for the date dimension
SELECT @DT  = '1/1/1998'

--start looping, stop at ending date
WHILE (@DT <= '12/31/2018')
BEGIN

--get information about the data
	SELECT @IsWeekend  =0
	SELECT @YEAR = DATEPART (YEAR, @DT)
	SELECT @CalendarQtr = DATEPART (QUARTER, @DT)
	SELECT @QuarterName = 'Q' + CONVERT(CHAR(1),@CalendarQtr) 
	SELECT @CalendarMonth = DATEPART (MONTH , @DT)
	SELECT @WEEK  = DATEPART (WEEK , @DT)
	SELECT @DayofYear   = DATEPART (DY , @DT)
	SELECT @DayofMonth   = DATEPART (DAY , @DT)
	SELECT @DayofWeek   = DATEPART (DW , @DT)
--> WGW Additional
	SELECT @DateKey = (@YEAR * 100) + (@CalendarMonth * 10) + @DayofMonth
	SELECT @Month = (@YEAR * 100) + @CalendarMonth
	SELECT @Quarter = (@YEAR * 100) + @CalendarQtr

--note if weeknd or not
IF ( @DayofWeek = 1 OR  @DayofWeek = 7 )  
BEGIN
	SELECT @IsWeekend   = 1
END

--add 1 every time we start a new week
IF ( @DayofWeek = 1)
BEGIN
	SELECT @CalendarWeek = @CalendarWeek +1
END

--add business rule (need to know complete weeks in a year, so a partial week in new year set to 0)
IF ( @DayofWeek != 1 AND @DayofYear = 1)
BEGIN
	SELECT @BusinessYearWeek = 0
END


IF ( @DayofWeek = 1)
BEGIN
	SELECT @BusinessYearWeek = @BusinessYearWeek +1
END

--add business rule (start counting business weeks with first complete week)
IF (@BusinessYearWeek =53)
BEGIN
	SELECT @BusinessYearWeek = 1
END

--check for leap year
IF ((@YEAR % 4 = 0)  AND (@YEAR % 100 != 0 OR @YEAR % 400 = 0))
	SELECT @LeapYear =1
	ELSE SELECT @LeapYear =0

--insert values into Date Dimension table

INSERT DateDim  (DateKey, ActualDate, [Year], [Quarter], [QuarterName], [Month], [Week], [DayofYear], [DayofMonth], [DayofWeek], [IsWeekend], [IsHoliday], [CalendarWeek], [CalendarMonth], [CalendarQtr], [BusinessYearWeek], [LeapYear])
 VALUES (@DateKey, @DT, @YEAR, @QUARTER, @QuarterName, @MONTH, @WEEK, @DayofYear, @DayofMonth, @DayofWeek, @IsWeekend, 0, @CalendarWeek, @CalendarMonth, @CalendarQtr, @BusinessYearWeek, @LeapYear)

--increment the date one day
SELECT @DT  = DATEADD(DAY, 1, @DT)

END

GO
