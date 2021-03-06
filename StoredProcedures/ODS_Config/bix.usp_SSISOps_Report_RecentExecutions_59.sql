/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_RecentExecutions_59]    Script Date: 5/15/2018 12:11:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
    Source : Pragmatic Works - BI xPress Auditing Framework 59
    Created On : 2/19/2016
    Purpose : 
        - Displays Information about packages already completed or running.
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Report_RecentExecutions_59]
(
    @Status VARCHAR(255) = 'ALL'
    ,@PackageNameFilter VARCHAR(255) = null
    ,@MachineName VARCHAR(255) = '%'
    ,@ExecutionAccountName VARCHAR(255) = '%'
    ,@ExecutionMode VARCHAR(255) = 'ALL'
    ,@StartDate datetime = null
    ,@EndDate datetime = null
    ,@ShowOnlyRunning int = 0
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @CurrentDate AS DATETIME
    
    SET @CurrentDate = GETDATE()

    IF @StartDate IS NULL
        SET @StartDate = DATEADD(YEAR, -1, @CurrentDate)

    IF @EndDate IS NULL
        SET @EndDate = @CurrentDate

    IF @ShowOnlyRunning IS NULL
        SET @ShowOnlyRunning = 0

    DECLARE @MaxChars INT
    SELECT @MaxChars = [SettingValue] FROM [bix].[vw_SSISGlobalSettings_59] WHERE [SettingKey] = 'SSISOpsMaxVarLength'
    
    SET @MaxChars = ISNULL(@MaxChars, 15000)

    SELECT a.[ExecutionID]
      ,a.[PackageName]
      ,a.[InteractiveMode]
      ,a.[UserName]
      ,a.[MachineName]
      ,a.[ExecutionStartDateTime] AS [P_ExecutionStartDateTime]
      ,a.[ExecutionEndDateTime] AS [P_ExecutionEndDateTime]
      ,b.[ExecutionStartDateTime]
      ,b.[ExecutionEndDateTime]
      ,a.[TotalErrorCount] AS [P_TotalErrorCount]
      ,a.[TotalWarningCount] AS [P_TotalWarningCount]
      ,b.[TotalErrorCount]
      ,b.[TotalWarningCount]
      ,a.[TotalRecordsExtracted] AS [P_TotalRecordsExtracted]
      ,a.[TotalRecordsLoaded] AS [P_TotalRecordsLoaded]
      ,b.[TotalRecordsExtracted]
      ,b.[TotalRecordsLoaded]
      ,b.[SourceID]
      ,b.[ParentSourceID]
      ,b.[SourceName]
      ,[SourceType] = (CASE WHEN c.[SourceID] = a.[PackageID] THEN 'package' ELSE LOWER(b.[SourceType]) END)
      ,c.[EventType]
      ,c.[MessageDescription]
      ,[DetailLevel] = (CASE WHEN c.[SourceID] = a.[PackageID] THEN 'package' ELSE 'task' END)
      ,b1.[IterationCount]
      ,ISNULL(a.[LayoutID], 0) AS [LayoutID]
      ,[Variables] = (CASE WHEN DATALENGTH(a.[Variables]) > @MaxChars THEN LEFT(CAST(a.[Variables] AS VARCHAR(MAX)), @MaxChars) + ' ***<LARGE VALUE - DATA TRUNCATED - Original Length ' + CAST((DATALENGTH(a.[Variables]) / 1024) AS VARCHAR(100)) + ' KB (to modify truncation limit change value in SSISGlobalSettings table)>' ELSE a.[Variables] END)
      ,a.[Connections]
    FROM [bix].[vw_SSISPackageExecutionLog_59] a
        LEFT OUTER JOIN (
            SELECT b.[ExecutionStartDateTime]
              ,b.[ExecutionEndDateTime]
              ,SUM(b.[TotalErrorCount]) AS [TotalErrorCount]
              ,SUM(b.[TotalWarningCount]) AS [TotalWarningCount]
              ,c.[TotalRecordsExtracted]
              ,c.[TotalRecordsLoaded]
              ,b.[SourceID]
              ,b.[ParentSourceID]
              ,b.[SourceName]
              ,b.[SourceType]
              ,b.[ExecutionID]
            FROM [bix].[vw_SSISTaskExecutionLog_59] b
            LEFT JOIN (
                        SELECT [SourceID]
                            , [ExecutionID]
                            , [TotalRecordsExtracted] = SUM(CASE WHEN [ComponentTypeCode] = 'SRC' THEN [RecordCount] ELSE 0 END) 
                            , [TotalRecordsLoaded] = SUM(CASE WHEN [ComponentTypeCode] = 'DEST' THEN [RecordCount] ELSE 0 END) 
                        FROM [bix].[vw_SSISPackageRowCountLog_59]
                        GROUP BY [SourceID], [ExecutionID]
                      ) c
            ON b.[ExecutionID] = c.[ExecutionID] AND b.[SourceID] = c.[SourceID]
            GROUP BY b.[ExecutionStartDateTime]
              ,b.[ExecutionEndDateTime]
              ,c.[TotalRecordsExtracted]
              ,c.[TotalRecordsLoaded]
              ,b.[SourceID]
              ,b.[ParentSourceID]
              ,b.[SourceName]
              ,b.[SourceType]
              ,b.[ExecutionID]
        ) b on a.ExecutionID = b.ExecutionID
        LEFT OUTER JOIN (SELECT [ExecutionID]
                ,[SourceID]
                ,COUNT([LogID]) AS [IterationCount]
            FROM [bix].[vw_SSISTaskExecutionLog_59]
            GROUP BY [ExecutionID], [SourceID]
            ) b1
            on b.ExecutionID = b1.ExecutionID AND b.SourceID = b1.SourceID
        LEFT OUTER JOIN [bix].[vw_SSISTaskExecutionAlerts_59] c on (b.ExecutionID = c.ExecutionID AND b.SourceID = c.SourceID)
    where ((@ShowOnlyRunning = 0 AND a.[ExecutionStartDateTime] BETWEEN @StartDate AND @EndDate) OR (@ShowOnlyRunning = 1 AND a.[ExecutionEndDateTime] IS NULL AND a.[ExecutionStartDateTime] > @CurrentDate - 2))
        AND (ISNULL(a.[TotalErrorCount],0) >= (CASE WHEN ISNULL(@Status, '') = 'ERROR' THEN 1 ELSE 0 END))
        AND (ISNULL(a.[TotalWarningCount],0) >= (CASE WHEN ISNULL(@Status, '') = 'WARNING' THEN 1 ELSE 0 END))
        AND a.PackageName LIKE @PackageNameFilter
        AND a.UserName LIKE @ExecutionAccountName
        AND a.MachineName LIKE @MachineName
        AND a.InteractiveMode = (Case @ExecutionMode
            WHEN 'ALL' THEN a.InteractiveMode 
            WHEN 'I' THEN 1
            ELSE 0
            END)
    ORDER BY a.[ExecutionStartDateTime] DESC, b.[ExecutionStartDateTime] asc

    SET NOCOUNT OFF
END

GO
