/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_ExecutionTimeTrend]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


/*
	Source : Pragmatic Works - BI xPress Auditing Framework 22
	Created On : 12/18/2012
	Purpose : 
		- Displays Information about detail of package run time trend.
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_ExecutionTimeTrend]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)=null
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@IntervalType varchar(10)='d'
,@MaxColCount int=null
AS

/* AUTO GENERATED CODE - DO NOT MODIFY */

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT 
   RowLabel_1=a.[PackageName]
  ,RowLabel_2=lower(b.[SourceType])
  ,RowLabel_3=b.[SourceName]
  ,RowLabel_4=b.[ParentSourceID]
  ,RowLabel_5=''
  ,RowLabel_6=''
  ,RowLabel_7=''

  ,ColLabel_1=(case @IntervalType
				when 'd' then convert(varchar(10),a.[LogDate],101)
				when 'w' then cast(DatePart(week, a.[LogDate]) as varchar(10))
				when 'm' then cast(DatePart(month, a.[LogDate]) as varchar(10))
				when 'y' then cast(DatePart(year, a.[LogDate]) as varchar(10))
			  end)
  ,ColLabel_2=''
  ,ColLabel_3=''
  ,ColLabel_4=''
  ,ColLabel_5=''
  ,ColLabel_6=''
  ,ColLabel_7=''

  ,Measure_1=sum(datediff(s,a.[ExecutionStartDateTime]  ,a.[ExecutionEndDateTime])) --Package Time
  ,Measure_2=sum(datediff(s,b.[ExecutionStartDateTime]  ,b.[ExecutionEndDateTime])) --Task Time	
  ,Measure_3=count(a.LogID) 
  ,Measure_4=count(b.LogID)
  ,Measure_5=0 --Avg(a.TotalRecordsLoaded)
  ,Measure_6=0
  ,Measure_7=0

FROM [SSISPackageExecutionLog] a
Left outer JOIN [SSISTaskExecutionLog] b
	on a.ExecutionID=b.ExecutionID
where a.[LogDate] >= (case @IntervalType
						when 'd' then DateAdd(day,  @MaxColCount * (-1),getdate())
						when 'w' then DateAdd(week,  @MaxColCount * (-1),getdate())
						when 'm' then DateAdd(month,  @MaxColCount * (-1),getdate())
						when 'y' then DateAdd(year,  @MaxColCount * (-1),getdate())
						else DateAdd(day,  @MaxColCount * (-1),getdate())
					  end)--(Datediff(day,a.[LogDate],getdate()) <= @MaxColCount ) and getdate()
and a.[ExecutionEndDateTime] IS NOT NULL
	And (isnull(a.[TotalErrorCount],0) >=(case when isnull(@Status,'')='ERROR' then 1 else 0 end))
	And (isnull(a.[TotalWarningCount],0) >=(case when isnull(@Status,'')='WARNING' then 1 else 0 end))
	And a.PackageName Like @PackageNameFilter
And a.UserName LIKE @ExecutionAccountName
And a.MachineName LIKE @MachineName
And a.InteractiveMode = (Case @ExecutionMode
When 'ALL' then a.InteractiveMode 
When 'I' then 1
else 0
end)
group by a.[PackageName],b.SourceType
,b.SourceName
,b.[ParentSourceID]
,(case @IntervalType
				when 'd' then convert(varchar(10),a.[LogDate],101)
				when 'w' then cast(DatePart(week, a.[LogDate]) as varchar(10))
				when 'm' then cast(DatePart(month, a.[LogDate]) as varchar(10))
				when 'y' then cast(DatePart(year, a.[LogDate]) as varchar(10))
				--else a.[LogDate]
			  end)
 
order by a.[PackageName]

GO
