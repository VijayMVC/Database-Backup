/****** Object:  View [dbo].[vw_rpt_DateRange]    Script Date: 5/15/2018 12:13:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE view vw_rpt_DateRange as
-- In the report, add one day to the EndDate and exclude like so:
-- Need to include the last day's data also.
SELECT 
	Convert(varchar(100),'Year To Date') as [Period]
	,convert(datetime,'1/1/' + cast(year(getdate()) as varchar(4))) as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Today') as [Period]
	,convert(datetime,convert(date,getdate())) as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDateunion
union all
select 
	Convert(varchar(100),'Yesterday') as [Period]
	,convert(datetime,convert(date,getdate()))-1 as BeginDate
	,convert(datetime,convert(date,getdate()))-1 as EndDate
union all
select 
	Convert(varchar(100),'Fiscal Year To Date') as [Period]
	,convert(datetime,'10/1/' + cast(year(getdate()) as varchar(4))) as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Month To Date') as [Period]
	,convert(datetime,cast(month(getdate()) as varchar(4)) + '/1/' + cast(year(getdate()) as varchar(4))) as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Last Month') as [Period]
	,convert(datetime,(dateadd(MM,-1,cast(month(getdate()) as varchar(4)) + '/1/' + cast(year(getdate()) as varchar(4))))) as BeginDate
	,convert(datetime,cast(month(getdate()) as varchar(4)) + '/1/' + cast(year(getdate()) as varchar(4)))-1 as EndDate
union all
select 
	Convert(varchar(100),'Last Month to Date') as [Period]
	,convert(datetime,(dateadd(MM,-1,cast(month(getdate()) as varchar(4)) + '/1/' + cast(year(getdate()) as varchar(4))))) as BeginDate
	,convert(datetime,(dateadd(MM,-1,cast(month(getdate()) as varchar(4)) + '/' + cast(day (getdate()) as varchar(4)) + '/' + cast(year(getdate()) as varchar(4))))) as EndDate
union all
select 
	Convert(varchar(100),'Last Year') as [Period]
	,convert(datetime,'1/1/' + cast(year(getdate())-1 as varchar(4))) as BeginDate
	,convert(datetime,'1/1/' + cast(year(getdate()) as varchar(4)))-1 as EndDate
union all
select 
	Convert(varchar(100),'Last Year to Date') as [Period]
	,convert(datetime,'1/1/' + cast(year(getdate())-1 as varchar(4))) as BeginDate
	,dateadd(yy,-1,convert(datetime,convert(date,getdate()))) as EndDate
union all
select 
	Convert(varchar(100),'Last 7 days') as [Period]
	,convert(datetime,convert(date,getdate()))-7 as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Last 14 days') as [Period]
	,convert(datetime,convert(date,getdate()))-14 as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
--select 
--	Convert(varchar(100),'Last 21 days') as [Period]
--	,convert(datetime,convert(date,getdate()))-21 as BeginDate
--	,convert(datetime,convert(date,getdate())) as EndDate
--union all
--select 
--	Convert(varchar(100),'Last 28 days') as [Period]
--	,convert(datetime,convert(date,getdate()))-28 as BeginDate
--	,convert(datetime,convert(date,getdate())) as EndDate
--union all
select 
	Convert(varchar(100),'Last 30 days') as [Period]
	,convert(datetime,convert(date,getdate()))-30 as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Last 60 days') as [Period]
	,convert(datetime,convert(date,getdate()))-60 as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Last 90 days') as [Period]
	,convert(datetime,convert(date,getdate()))-90 as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'This Calendar Quarter') as [Period]
	,DATEADD(qq, DATEDIFF(q,0,GETDATE()),0) as BeginDate
	,DATEADD(qq, DATEDIFF(q,0,GETDATE())+1,0)-1 as EndDate
union all
select 
	Convert(varchar(100),'This Calendar Quarter to Date') as [Period]
	,DATEADD(qq, DATEDIFF(q,0,GETDATE()),0) as BeginDate
	,convert(datetime,convert(date,getdate())) as EndDate
union all
select 
	Convert(varchar(100),'Last Calendar Quarter') as [Period]
	,DATEADD(qq, DATEDIFF(q,2,GETDATE())-1,0) as BeginDate
	,DATEADD(qq, DATEDIFF(q,2,GETDATE()),0)-1 as EndDate
union all
select 
	Convert(varchar(100),'Last Calendar Quarter to Date') as [Period]
	,DATEADD(qq, DATEDIFF(q,0,GETDATE())-1,0) as BeginDate
	,DATEADD(QQ,-1,convert(datetime,convert(date,getdate()))) as EndDate
union all
select 
	Convert(varchar(100),'Last Year Calendar Quarter') as [Period]
	,DATEADD(yyyy,-1,DATEADD(qq, DATEDIFF(q,2,GETDATE()),0)) as BeginDate
	,DATEADD(yyyy,-1,DATEADD(qq, DATEDIFF(q,2,GETDATE())+1,0)-1) as EndDateunion
union all
select 
	Convert(varchar(100),'Last Year Calendar Quarter to Date') as [Period]
	,DATEADD(yyyy,-1,DATEADD(qq, DATEDIFF(q,2,GETDATE()),0)) as BeginDate
	,DATEADD(yyyy,-1,convert(datetime,convert(date,getdate()))) as EndDate
union all
select 
	Convert(varchar(100),'Next Year') as [Period]
	,Convert(datetime,'1/1/' + cast(YEAR(GETDATE())+1 as varchar(4))) as BeginDate
	,Convert(datetime,'12/31/' + cast(YEAR(GETDATE())+1 as varchar(4)))  as EndDate
union all
select 
	Convert(varchar(100),'Next Year to Date') as [Period]
	,Convert(datetime,'1/1/' + cast(YEAR(GETDATE())+1 as varchar(4))) as BeginDate
	,Convert(datetime,cast(MONTH(GETDATE()) as varchar(2)) + '/' + cast(DAY(GETDATE()) as varchar(2)) + '/' + cast(YEAR(GETDATE())+1 as varchar(4)))  as EndDate
GO
