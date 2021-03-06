/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_RecentExecutionsSummary]    Script Date: 5/15/2018 12:11:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Report_RecentExecutionsSummary
 * --------------------------------------------------------------
 * Updated By: Matt Whitfield - 11/14/2012
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * Purpose : 
 *     - Displays summary of executions (without task detail) about packages already completed.
 * Example :
 *     exec usp_SSISOps_Report_RecentExecutions_Summary @StartDate='8/2/2010',@EndDate='9/3/2010',@PackageNameFilter='%'
 * --------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_RecentExecutionsSummary]
(
    @Status varchar(255) = 'ALL'
    ,@PackageNameFilter varchar(255) = null
    ,@MachineName varchar(255) = '%'
    ,@ExecutionAccountName varchar(255) = '%'
    ,@ExecutionMode varchar(255) = 'ALL'
    ,@StartDate datetime = null
    ,@EndDate datetime = null
)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 

    Declare @MaxChars int 
    select @MaxChars = SettingValue	From SSISGlobalSettings Where SettingKey = 'SSISOpsMaxVarLength'
    set @MaxChars = ISNULL(@MaxChars, 15000)
        
    SELECT [log].[ExecutionID],
      [log].[PackageName],
      [log].[InteractiveMode],
      [log].[UserName],
      [log].[MachineName],
      [log].[ExecutionStartDateTime],
      [log].[ExecutionEndDateTime],
      [log].[TotalErrorCount],
      [log].[TotalWarningCount],
      CONVERT([bigint], [log].[TotalRecordsExtracted]) AS [TotalRecordsExtracted],
      CONVERT([bigint], [log].[TotalRecordsLoaded]) AS [TotalRecordsLoaded],
      ISNULL([log].[LayoutID], 0) as LayoutID,
      Variables = (Case when DATALENGTH([log].[Variables]) > @MaxChars then left(cast([log].[Variables] as varchar(max)), @MaxChars) + ' ***<LARGE VALUE - DATA TRUNCATED - Original Length ' + CAST(DATALENGTH([log].[Variables])/1024 as Varchar(100)) + ' KB (to modify truncation limit change value in SSISGlobalSettings table)>' else [log].[Variables] end),
      [log].[Connections]
    FROM [dbo].[fn_SSISOps_Report_LogRowsByStartDateEndDate](@Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @StartDate, @EndDate) [log]
    Order By [log].[ExecutionStartDateTime] Desc

    SET NOCOUNT OFF
END

GO
