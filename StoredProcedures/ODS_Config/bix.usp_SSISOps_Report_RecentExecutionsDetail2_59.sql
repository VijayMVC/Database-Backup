/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_RecentExecutionsDetail2_59]    Script Date: 5/15/2018 12:11:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Report_RecentExecutionsDetail2
 * --------------------------------------------------------------
 * Updated By: Matt Whitfield - 12/11/2012
 * Updated By: Matt Whitfield - 11/14/2012
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * Purpose : 
 *     - Displays Information about packages already completed or running.
 * --------------------------------------------------------------
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Report_RecentExecutionsDetail2_59]
    @Status VARCHAR(255) = 'ALL',
    @PackageNameFilter VARCHAR(255) = null,
    @MachineName VARCHAR(255) = '%',
    @ExecutionAccountName VARCHAR(255) = '%',
    @ExecutionMode VARCHAR(255) = 'ALL',
    @StartDate datetime = null,
    @EndDate datetime = null
AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
DECLARE @MaxChars INT
SELECT @MaxChars = [SettingValue] FROM [bix].[vw_SSISGlobalSettings_59] WHERE [SettingKey] = 'SSISOpsMaxVarLength'

SET @MaxChars = ISNULL(@MaxChars, 15000)

CREATE TABLE #Executions
 (ExecutionID [varchar](50) NOT NULL,
  PackageName [nvarchar](255) NOT NULL,
  InteractiveMode [bit] NOT NULL,
  UserName [nvarchar](100) NULL,  
  MachineName [nvarchar](255) NULL,
  ExecutionStartDateTime [datetime] NOT NULL, 
  ExecutionEndDateTime [datetime] NULL, 
  TotalErrorCount [int] NOT NULL,
  TotalWarningCount [int] NOT NULL,
  TotalRecordsExtracted [bigint] not null,
  TotalRecordsLoaded [bigint] not null,
  LayoutID [INT] not NULL,  
  Variables NVARCHAR(MAX),
  Connections NVARCHAR(MAX))  

INSERT INTO [#Executions] ([ExecutionID], [PackageName], [InteractiveMode], [UserName], [MachineName], [ExecutionStartDateTime], [ExecutionEndDateTime], [TotalErrorCount], [TotalWarningCount], [TotalRecordsExtracted], [TotalRecordsLoaded], [LayoutID], [Variables], [Connections])
EXEC [bix].[usp_SSISOps_Report_RecentExecutionsSummary_59] @Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @StartDate, @EndDate

SELECT [ExecutionID], [PackageName], [InteractiveMode], [UserName], [MachineName], [ExecutionStartDateTime], [ExecutionEndDateTime], [TotalErrorCount], [TotalWarningCount], [TotalRecordsExtracted], [TotalRecordsLoaded], [LayoutID], [Variables], [Connections] FROM #Executions  

SELECT MIN([TaskLog].[ExecutionStartDateTime]) AS ExecutionStartDateTime,
       MAX([TaskLog].[ExecutionEndDateTime]) AS ExecutionEndDateTime,
       SUM([TaskLog].[TotalErrorCount]) AS [TotalErrorCount],
       SUM([TaskLog].[TotalWarningCount]) AS [TotalWarningCount],
       SUM(CONVERT(bigint, [TaskLog].[TotalRecordsExtracted])) AS [TotalRecordsExtracted],
       SUM(CONVERT(bigint, [TaskLog].[TotalRecordsLoaded])) AS [TotalRecordsLoaded],
       [TaskLog].[SourceID],
       [TaskLog].[ParentSourceID],
       [TaskLog].[SourceName],
       [TaskLog].[SourceType],
       [TaskLog].[ExecutionID],
       COUNT(*) AS [IterationCount]
  FROM [bix].[vw_SSISTaskExecutionLog_59] [TaskLog] INNER JOIN  
       #Executions [e] 
    ON [e].[ExecutionID] COLLATE DATABASE_DEFAULT = [TaskLog].[ExecutionID] COLLATE DATABASE_DEFAULT
 GROUP BY [TaskLog].[SourceID],
          [TaskLog].[ParentSourceID],
          [TaskLog].[SourceName],
          [TaskLog].[SourceType],
          [TaskLog].[ExecutionID]

SELECT [a].[ExecutionID], 
       [SourceID], 
       [LogDate], 
       [EventType], 
       [MessageDescription],
       [SourceName]
  FROM [bix].[vw_SSISTaskExecutionAlerts_59] [a] INNER JOIN 
       #Executions [e] 
    ON [e].[ExecutionID] COLLATE DATABASE_DEFAULT = [a].[ExecutionID] COLLATE DATABASE_DEFAULT

DROP TABLE #Executions

GO
