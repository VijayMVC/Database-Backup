/****** Object:  UserDefinedFunction [dbo].[getEndDate]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
Create FUNCTION [dbo].[getEndDate]
(
      @month integer, @year integer 
)
RETURNS varchar(20)
AS 
BEGIN

declare @StartDate varchar(20)
declare @Enddate varchar(20)
declare @NumberOfDays varchar(2)

set @StartDate = convert(varchar(2),@month) + '/1/' + convert(varchar(4),@year)
set @NumberOfDays = datediff(day, dateadd(day, 1-day(@StartDate),@StartDate),dateadd(month, 1, dateadd(day, 1-day(@StartDate), @StartDate))) 
set @EndDate = convert(varchar(2),@month) + '/' +@NumberOfDays + '/' + convert(varchar(4),@year) + ' 23:59'


RETURN @EndDate
END   
GO
