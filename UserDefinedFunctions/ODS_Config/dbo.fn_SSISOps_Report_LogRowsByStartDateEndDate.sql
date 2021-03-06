/****** Object:  UserDefinedFunction [dbo].[fn_SSISOps_Report_LogRowsByStartDateEndDate]    Script Date: 5/15/2018 12:15:06 PM ******/
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
CREATE FUNCTION [dbo].[fn_SSISOps_Report_LogRowsByStartDateEndDate]
(
    @Status varchar(255),
    @PackageNameFilter varchar(255),
    @MachineName varchar(255),
    @ExecutionAccountName varchar(255),
    @ExecutionMode varchar(255),
    @StartDate datetime,
    @EndDate datetime
)
RETURNS TABLE 
AS
RETURN (
    SELECT [LogID], [ExecutionID], [PackageName], [PackageID], [InteractiveMode], [UserName], [MachineName], [LogDate], [ExecutionStartDateTime], [ExecutionEndDateTime], [TotalErrorCount], [TotalWarningCount], [TotalRecordsExtracted], [TotalRecordsLoaded], [CPUUtilization], [RAMUtilization], [DiskUtilization], [CustomValue_Num_1], [CustomValue_Num_2], [CustomValue_Num_3], [CustomValue_Dt_1], [CustomValue_Dt_2], [CustomValue_Dt_3], [CustomValue_Str_1], [CustomValue_Str_2], [CustomValue_Str_3], [LayoutID], [Variables], [Connections]
    FROM [SSISPackageExecutionLog] [log]
    WHERE [log].[ExecutionStartDateTime] BETWEEN @StartDate AND @EndDate
      And (isnull([log].[TotalErrorCount],0) >=(case when isnull(@Status,'') = 'ERROR' then 1 else 0 END))
      And (isnull([log].[TotalWarningCount],0) >=(case when isnull(@Status,'') = 'WARNING' then 1 else 0 END))
      And [log].[PackageName] LIKE @PackageNameFilter
      And [log].[UserName] LIKE @ExecutionAccountName
      And [log].[MachineName] LIKE @MachineName
      And [log].[InteractiveMode] = (CASE @ExecutionMode
                                          When 'ALL' THEN [log].[InteractiveMode] 
                                          When 'I' THEN 1
                                          ELSE 0
                                     end)
)

GO
