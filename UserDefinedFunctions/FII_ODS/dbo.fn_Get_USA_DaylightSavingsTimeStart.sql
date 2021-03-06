/****** Object:  UserDefinedFunction [dbo].[fn_Get_USA_DaylightSavingsTimeStart]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

  CREATE function [dbo].[fn_Get_USA_DaylightSavingsTimeStart]
/*
		2005 and Before:
Begins the first Sunday in April clocks are set ahead one hour, so 2:00 a.m. becomes 3:00 a.m.
(Ends the last Sunday in October clocks are set back one hour, so 2:00 a.m. becomes 1:00 a.m.)
2006 and After:
Begins the second Sunday in March clocks are set ahead one hour, so 2:00 a.m. becomes 3:00 a.m.
(Ends the first Sunday in November clocks are set back one hour, so 2:00 a.m. becomes 1:00 a.m.)

*/

(@Year varchar(4))
RETURNS smalldatetime
as
begin
declare @DTSStartWeek smalldatetime, @DTSEndWeek smalldatetime
set @DTSStartWeek = CASE When @Year > '2005' then '03/01/' else '04/01/' end  + convert(varchar,@Year)  /* need to modify all the hours to ge the correct day */
set @DTSEndWeek = CASE When @Year > '2005' then '11/01/' else '10/01/' end  + convert(varchar,@Year)
return 
CASE WHEN @Year > '2005' then 
case datepart(dw,@DTSStartWeek)
/* second sunday in March */
when 1 then 
dateadd(hour,170,@DTSStartWeek)
when 2 then
dateadd(hour,314,@DTSStartWeek)
when 3 then 
dateadd(hour,290,@DTSStartWeek)
when 4 then 
dateadd(hour,266,@DTSStartWeek)
when 5 then 
dateadd(hour,242,@DTSStartWeek)
when 6 then 
dateadd(hour,218,@DTSStartWeek)
when 7 then
dateadd(hour,194,@DTSStartWeek)
end
/* first sunday in April */
WHEN @Year <'2006' then  
case datepart(dw,dateadd(week,1,@DTSStartWeek))
when 1 then
dateadd(hour,2,@DTSStartWeek)
when 2 then
dateadd(hour,146,@DTSStartWeek)
when 3 then
dateadd(hour,122,@DTSStartWeek)
when 4 then
dateadd(hour,98,@DTSStartWeek)
when 5 then 
dateadd(hour,74,@DTSStartWeek)
when 6 then 
dateadd(hour,50,@DTSStartWeek)
when 7 then 
dateadd(hour,26,@DTSStartWeek)
end
END
END

GO
