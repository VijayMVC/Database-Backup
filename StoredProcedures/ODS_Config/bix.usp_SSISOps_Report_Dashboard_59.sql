/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_Dashboard_59]    Script Date: 5/15/2018 12:11:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
    Source : Pragmatic Works - BI xPress Auditing Framework 59
    Created On : 2/19/2016
    Purpose : 
        - Displays Information for dashboard report
    Example :
        exec usp_SSISOps_Report_Dashboard @Command='EXECUTIONSTATUS',@MaxColCount=2
        exec usp_SSISOps_Report_Dashboard @Command='TOP10SLOWEST'
        exec usp_SSISOps_Report_Dashboard @Command='TOP10FASTEST'
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Report_Dashboard_59]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)='%'
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@IntervalType varchar(10)='d'
,@MaxColCount int=1
,@Command varchar(50)=''
AS

/* AUTO GENERATED CODE - DO NOT MODIFY */

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

-- ///////////////////////////////////////////////////////////////////
-- COMPLETED or RUNNING
-- ///////////////////////////////////////////////////////////////////
if @Command='EXECUTIONSTATUS'
SELECT 
    a.[PackageName]
   ,a.[TotalErrorCount]
   ,a.[TotalWarningCount]
   ,a.[ExecutionStartDateTime]
   ,a.[ExecutionEndDateTime]
   ,a.[MachineName]
   ,ExecutionStatus=(case 
        -- If anything before 2 days and still No end date then must be stopped 
        when (a.[ExecutionStartDateTime]> getdate()-2 and a.[ExecutionEndDateTime] is null) then 'Running'
        when (a.[ExecutionEndDateTime] is not null) then 'Completed'
        else 'Unknown'
    end	) 
    ,Isnull(b.LoadedRecordCount,0) as LoadedRecordCount
    ,Isnull(a.LayoutID,0) as LayoutID
    ,a.ExecutionID
FROM [bix].[vw_SSISPackageExecutionLog_59] a
LEFT OUTER JOIN (select ExecutionID,Sum(RecordCount) as LoadedRecordCount from [bix].[vw_SSISPackageRowCountLog_59] where ComponentTypeCode='DEST' group by ExecutionID) b ON a.ExecutionID=b.ExecutionID 
where a.[ExecutionStartDateTime] >= (case @IntervalType
                        when 'd' then DateAdd(day,  @MaxColCount * (-1),getdate())
                        when 'w' then DateAdd(week,  @MaxColCount * (-1),getdate())
                        when 'm' then DateAdd(month,  @MaxColCount * (-1),getdate())
                        when 'y' then DateAdd(year,  @MaxColCount * (-1),getdate())
                        else DateAdd(day,  @MaxColCount * (-1),getdate())
                      end)--(Datediff(day,a.[LogDate],getdate()) <= @MaxColCount ) and getdate()
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


-- ///////////////////////////////////////////////////////////////////
-- Extracted Records
-- ///////////////////////////////////////////////////////////////////
if @Command='EXTRACTINFO'
SELECT 
    a.[PackageName]
   ,b.[LogDate]
   ,a.[MachineName]
   ,isnull(b.RecordCount,0) as RecordCount
  ,DataObjectType
  ,DataObjectTypeIcon=(case 
                when charindex('Microsoft.Jet.Oledb',b.DataObjectConnectionString)>0 and b.DataObjectConnectionString like 'Data%=%.xls%' then 'excel'
                when charindex('Microsoft.Jet.Oledb',b.DataObjectConnectionString)>0 and b.DataObjectConnectionString like 'Data%=%.mdb%' then 'msaccess'
                when b.DataObjectType in('RawFile','FlatFile','VariableFileName','Variable') then 'file'
                when b.DataObjectType in('TableOrView','VariableTableOrView') then 'tableorview'
                when b.DataObjectType in('SqlCommand','VariableSqlCommand') then 'query'
                when b.DataObjectType in('XMLFile') then 'xml'
                else 'other'
              end)	 	
  ,DataObjectName=(case 
                when b.DataObjectType in('RawFile','TableOrView','FlatFile') then b.[DataObjectName]
                ---when b.DataObjectType in('VariableFileName','TableOrView','FlatFile') then (case when charindex('\',reverse(b.DataObjectDataSource))>0 then right(b.DataObjectDataSource,charindex('\',reverse(b.DataObjectDataSource))-1) else b.DataObjectDataSource end)

                when b.DataObjectType in('VariableFileName','TableOrView','FlatFile') then b.DataObjectDataSource
                --when b.DataObjectType in('VariableSqlCommand','SqlCommand') then Left(b.DataObjectQuery,40) + ' ...'
                when b.DataObjectType in('VariableSqlCommand','SqlCommand') then b.DataObjectQuery
                when b.DataObjectType in('VariableTableOrView','Variable') then b.DataObjectQuery
                else b.DataObjectName
              end)	 
  ,AdditionalInfo= 'Connection String : ' + isnull(b.DataObjectConnectionString,'') + char(13) +  char(10)  + char(13) +  char(10) 
             + 'Data Flow Name : ' + isnull(b.SourceName,'') + char(13) +  char(10)  + char(13) +  char(10) 	
             + 'Connection Name : ' + isnull(b.DataObjectConnectionName,'') + char(13) +  char(10) 	 + char(13) +  char(10) 	
             + 'Component Name/Type : ' + isnull(b.ComponentName,'') + ' ('+ isnull(b.ComponentTypeName,'') + ')' + char(13) +  char(10)  + char(13) +  char(10) 		
             + (case 
                 when b.DataObjectType IN('TableOrView') then 'Table/View Name : ' + Isnull(b.DataObjectName,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('VariableTableOrView') then 'Table/View Name : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('SqlCommand') then 'Query : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('VariableSqlCommand') then 'Query : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('XMLFile','RawFile','FlatFile','VariableFileName') then 'File Path : ' + Isnull(b.DataObjectDataSource,'UNKNOWN') --Additional Info
                end)
FROM [bix].[vw_SSISPackageExecutionLog_59] a
JOIN [bix].[vw_SSISPackageRowCountLog_59] b on a.ExecutionID=b.ExecutionID
where b.[LogDate] >= (case @IntervalType
                        when 'd' then DateAdd(day,  @MaxColCount * (-1),getdate())
                        when 'w' then DateAdd(week,  @MaxColCount * (-1),getdate())
                        when 'm' then DateAdd(month,  @MaxColCount * (-1),getdate())
                        when 'y' then DateAdd(year,  @MaxColCount * (-1),getdate())
                        else DateAdd(day,  @MaxColCount * (-1),getdate())
                      end)--(Datediff(day,a.[LogDate],getdate()) <= @MaxColCount ) and getdate()
And (isnull(a.[TotalErrorCount],0) >=(case when isnull(@Status,'')='ERROR' then 1 else 0 end))
And (isnull(a.[TotalWarningCount],0) >=(case when isnull(@Status,'')='WARNING' then 1 else 0 end))
And a.PackageName Like @PackageNameFilter
And a.UserName LIKE @ExecutionAccountName
And a.MachineName LIKE @MachineName
And a.InteractiveMode = (Case @ExecutionMode When 'ALL' then a.InteractiveMode  When 'I' then 1 else 0 end)
And b.ComponentTypeCode='SRC'


-- ///////////////////////////////////////////////////////////////////
-- Loaded Records
-- ///////////////////////////////////////////////////////////////////
if @Command='LOADINFO'
SELECT 
    a.[PackageName]
   ,b.[LogDate]
   ,a.[MachineName]
   ,isnull(b.RecordCount,0) as RecordCount
  ,DataObjectType
  ,DataObjectTypeIcon=(case 
                when charindex('Microsoft.Jet.Oledb',b.DataObjectConnectionString)>0 and b.DataObjectConnectionString like 'Data%=%.xls%' then 'excel'
                when charindex('Microsoft.Jet.Oledb',b.DataObjectConnectionString)>0 and b.DataObjectConnectionString like 'Data%=%.mdb%' then 'msaccess'
                when b.DataObjectType in('RawFile','FlatFile','VariableFileName','Variable') then 'file'
                when b.DataObjectType in('TableOrView','VariableTableOrView') then 'tableorview'
                when b.DataObjectType in('SqlCommand','VariableSqlCommand') then 'query'
                when b.DataObjectType in('XMLFile') then 'xml'
                else 'other'
              end)	 	
  ,DataObjectName=(case 
                when b.DataObjectType in('RawFile','TableOrView','FlatFile') then b.[DataObjectName]
                ---when b.DataObjectType in('VariableFileName','TableOrView','FlatFile') then (case when charindex('\',reverse(b.DataObjectDataSource))>0 then right(b.DataObjectDataSource,charindex('\',reverse(b.DataObjectDataSource))-1) else b.DataObjectDataSource end)

                when b.DataObjectType in('VariableFileName','TableOrView','FlatFile') then b.DataObjectDataSource
                --when b.DataObjectType in('VariableSqlCommand','SqlCommand') then Left(b.DataObjectQuery,40) + ' ...'
                when b.DataObjectType in('VariableSqlCommand','SqlCommand') then b.DataObjectQuery
                when b.DataObjectType in('VariableTableOrView','Variable') then b.DataObjectQuery
                else b.DataObjectName
              end)	 
  ,AdditionalInfo= 'Connection String : ' + isnull(b.DataObjectConnectionString,'') + char(13) +  char(10)  + char(13) +  char(10) 
             + 'Data Flow Name : ' + isnull(b.SourceName,'') + char(13) +  char(10)  + char(13) +  char(10) 	
             + 'Connection Name : ' + isnull(b.DataObjectConnectionName,'') + char(13) +  char(10) 	 + char(13) +  char(10) 	
             + 'Component Name/Type : ' + isnull(b.ComponentName,'') + ' ('+ isnull(b.ComponentTypeName,'') + ')' + char(13) +  char(10)  + char(13) +  char(10) 		
             + (case 
                 when b.DataObjectType IN('TableOrView') then 'Table/View Name : ' + Isnull(b.DataObjectName,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('VariableTableOrView') then 'Table/View Name : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('SqlCommand') then 'Query : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('VariableSqlCommand') then 'Query : ' + Isnull(b.DataObjectQuery,'UNKNOWN') --Additional Info
                 when b.DataObjectType IN('XMLFile','RawFile','FlatFile','VariableFileName') then 'File Path : ' + Isnull(b.DataObjectDataSource,'UNKNOWN') --Additional Info
                end)
FROM [bix].[vw_SSISPackageExecutionLog_59] a
JOIN [bix].[vw_SSISPackageRowCountLog_59] b on a.ExecutionID = b.ExecutionID
where b.[LogDate] >= (case @IntervalType
                        when 'd' then DateAdd(day,  @MaxColCount * (-1),getdate())
                        when 'w' then DateAdd(week,  @MaxColCount * (-1),getdate())
                        when 'm' then DateAdd(month,  @MaxColCount * (-1),getdate())
                        when 'y' then DateAdd(year,  @MaxColCount * (-1),getdate())
                        else DateAdd(day,  @MaxColCount * (-1),getdate())
                      end)--(Datediff(day,a.[LogDate],getdate()) <= @MaxColCount ) and getdate()
And (isnull(a.[TotalErrorCount],0) >=(case when isnull(@Status,'')='ERROR' then 1 else 0 end))
And (isnull(a.[TotalWarningCount],0) >=(case when isnull(@Status,'')='WARNING' then 1 else 0 end))
And a.PackageName Like @PackageNameFilter
And a.UserName LIKE @ExecutionAccountName
And a.MachineName LIKE @MachineName
And a.InteractiveMode = (Case @ExecutionMode When 'ALL' then a.InteractiveMode  When 'I' then 1 else 0 end)
And b.ComponentTypeCode='DEST'


-- ///////////////////////////////////////////////////////////////////
-- Slowest Packages 
-- ///////////////////////////////////////////////////////////////////
if @Command='TOPNSLOWEST'
select top 20 * from
(SELECT
    a.[PackageName]
   ,RuntimeSeconds = Avg(Datediff(second,a.[ExecutionStartDateTime],a.[ExecutionEndDateTime]))
   ,TotalExecutions = Count(a.ExecutionID)
   ,a.[MachineName]
FROM [bix].[vw_SSISPackageExecutionLog_59] a
where a.[ExecutionStartDateTime] >= getdate()-90
    --and a.[ExecutionEndDateTime] IS NOT NULL
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
Group by a.PackageName,a.MachineName
) a
order by RuntimeSeconds desc

-- ///////////////////////////////////////////////////////////////////
-- Fastest Packages 
-- ///////////////////////////////////////////////////////////////////
if @Command='TOPNFASTEST'
select top 20 * from
(SELECT
    a.[PackageName]
   ,RuntimeSeconds = Avg(Datediff(second,a.[ExecutionStartDateTime],a.[ExecutionEndDateTime]))
   ,TotalExecutions = Count(a.ExecutionID)
   ,a.[MachineName]
FROM [bix].[vw_SSISPackageExecutionLog_59] a
where a.[ExecutionStartDateTime] >= getdate()-90
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
Group by a.PackageName,a.MachineName
) a
order by RuntimeSeconds asc

-- ///////////////////////////////////////////////////////////////////
-- Maximum Used
-- ///////////////////////////////////////////////////////////////////
if @Command='TOPNMAXUSED'
select top 20 * from
(SELECT
    a.[PackageName]
   ,TotalExecutions = Count(a.ExecutionID)
   ,a.[MachineName]
   ,LastUsed = Max(a.[ExecutionStartDateTime])
FROM [bix].[vw_SSISPackageExecutionLog_59] a
where a.[ExecutionStartDateTime] >= getdate()-90
    --and a.[ExecutionEndDateTime] IS NOT NULL
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
Group by a.PackageName,a.MachineName
) a
order by TotalExecutions desc

-- ///////////////////////////////////////////////////////////////////
-- Minimum Used
-- ///////////////////////////////////////////////////////////////////
if @Command='TOPNMINUSED'
select top 20 * from
(SELECT
    a.[PackageName]
   ,TotalExecutions = Count(a.ExecutionID)
   ,a.[MachineName]
   ,LastUsed = Max(a.[ExecutionStartDateTime])
FROM [bix].[vw_SSISPackageExecutionLog_59] a
where a.[ExecutionStartDateTime] >= getdate()-90
    --and a.[ExecutionEndDateTime] IS NOT NULL
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
Group by a.PackageName,a.MachineName
) a
order by TotalExecutions,LastUsed

GO
