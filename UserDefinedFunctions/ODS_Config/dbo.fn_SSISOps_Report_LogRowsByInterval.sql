/****** Object:  UserDefinedFunction [dbo].[fn_SSISOps_Report_LogRowsByInterval]    Script Date: 5/15/2018 12:15:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
 * Object: fn_SSISOps_Report_LogRowsByStartDateEndDate
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * --------------------------------------------------------------
 */
CREATE FUNCTION [dbo].[fn_SSISOps_Report_LogRowsByInterval]
(
    @Status varchar(255) = 'ALL',
    @PackageNameFilter varchar(255) = null,
    @MachineName varchar(255) = '%',
    @ExecutionAccountName varchar(255) = '%',
    @ExecutionMode varchar(255) = 'ALL',
    @IntervalType varchar(10)='d',
    @MaxColCount int=1
)
RETURNS TABLE 
AS
RETURN (
    SELECT [LogID], [ExecutionID], [PackageName], [PackageID], [InteractiveMode], [UserName], [MachineName], [LogDate], [ExecutionStartDateTime], [ExecutionEndDateTime], [TotalErrorCount], [TotalWarningCount], [TotalRecordsExtracted], [TotalRecordsLoaded], [CPUUtilization], [RAMUtilization], [DiskUtilization], [CustomValue_Num_1], [CustomValue_Num_2], [CustomValue_Num_3], [CustomValue_Dt_1], [CustomValue_Dt_2], [CustomValue_Dt_3], [CustomValue_Str_1], [CustomValue_Str_2], [CustomValue_Str_3], [LayoutID], [Variables], [Connections]
    FROM [SSISPackageExecutionLog] [log]
    WHERE [log].[LogDate] >= (case @IntervalType
                        when 'd' then DateAdd(day,  @MaxColCount * (-1),getdate())
                        when 'w' then DateAdd(week,  @MaxColCount * (-1),getdate())
                        when 'm' then DateAdd(month,  @MaxColCount * (-1),getdate())
                        when 'y' then DateAdd(year,  @MaxColCount * (-1),getdate())
                        else DateAdd(day,  @MaxColCount * (-1),getdate())
                      end)
        And (isnull([log].[TotalErrorCount],0) >=(case when isnull(@Status,'') = 'ERROR' then 1 else 0 end))
        And (isnull([log].[TotalWarningCount],0) >=(case when isnull(@Status,'') = 'WARNING' then 1 else 0 end))
        And [log].[PackageName] LIKE @PackageNameFilter
        And [log].[UserName] LIKE @ExecutionAccountName
        And [log].[MachineName] LIKE @MachineName
        And [log].[InteractiveMode] = (Case @ExecutionMode
            When 'ALL' then [log].[InteractiveMode] 
            When 'I' then 1
            else 0
            end)
)

GO
