/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_PackageAlerts]    Script Date: 5/15/2018 12:11:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
	Source : Pragmatic Works - BI xPress Auditing Framework 22
	Created On : 12/18/2012
	Purpose : 
		- Displays recent package executions and detailed errors and warnings
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_PackageAlerts]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)='%'
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@StartDate datetime=null
,@EndDate datetime=null
AS

/* AUTO GENERATED CODE - DO NOT MODIFY */

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

if @StartDate is null
	set @StartDate=getdate()-5
if @EndDate is null
	set @EndDate=getdate()

SELECT 
    a.[PackageName]
   ,a.[ExecutionStartDateTime]
   ,a.[ExecutionEndDateTime]
   ,a.[TotalErrorCount]	
   ,a.[TotalWarningCount]	
   ,a.[MachineName]
   ,c.[SourceName]
   ,SourceType = (case when b.SourceID=a.PackageID then 'ssis' else lower(c.[SourceType]) end)
   ,b.[EventType]
   ,b.[LogDate]
   ,b.[MessageDescription]
   ,b.[MessageCode]
   ,AlertScope =(case when b.SourceID=a.PackageID then 'Package' else 'Task' end)	
   ,ExecutionStatus=(case 
		--//If anything before 2 days and still No end date then must be stopped 
		when (a.[ExecutionStartDateTime]> getdate()-2 and a.[ExecutionEndDateTime] is null) then 'Running'
		when (a.[ExecutionEndDateTime] is not null) then 'Completed'
		else 'Unknown'
	end	) 
	,Isnull(a.LayoutID,0) as LayoutID
	,a.ExecutionID
FROM [SSISPackageExecutionLog] a
JOIN [SSISTaskExecutionAlerts] b on a.ExecutionID=b.ExecutionID
LEFT OUTER JOIN dbo.SSISTaskExecutionLog c on b.SourceID=c.SourceID AND b.ExecutionID=c.ExecutionID
where a.[ExecutionStartDateTime] between @StartDate and @EndDate
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

GO
