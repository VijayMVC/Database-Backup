/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_ExecutionTrendSummary]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
usp_SSISOps_Report_ExecutionTrendSummary 'All', '%', '%', '%', 'All', 'd', 60
Source : Pragmatic Works - BI xPress Auditing Framework 50
Created On : 11/7/2013
Originally Created On : 9/17/2010
Modified On : 2/29/2012 by Jeremiah Nazaruk
              3/8/2012 by Matt Whitfield
              4/30/2012 by Matt Whitfield
Purpose :
    - Displays Information about summary of package execution trend.
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_ExecutionTrendSummary] 
    @Status VARCHAR(255) = 'ALL',
    @PackageNameFilter VARCHAR(255) = '%',
    @MachineName VARCHAR(255) = '%',
    @ExecutionAccountName VARCHAR(255) = '%',
    @ExecutionMode VARCHAR(255) = 'ALL',
    @IntervalType VARCHAR(10) = 'd',
    @MaxColCount INT = 60
AS
BEGIN
    SET NOCOUNT ON

    -- declare some values statically to avoid CASE evaluation against every row when it isn't needed
    DECLARE @LogDateCutoff [datetime], @ErrorFilterValue [int], @WarningFilterValue [int]
    
    SET @LogDateCutoff = (CASE @IntervalType
                          WHEN 'd' THEN DATEADD(DAY,  @MaxColCount * (-1), GETDATE())
                          WHEN 'w' THEN DATEADD(WEEK,  @MaxColCount * (-1), GETDATE())
                          WHEN 'm' THEN DATEADD(MONTH,  @MaxColCount * (-1), GETDATE())
                          WHEN 'y' THEN DATEADD(YEAR,  @MaxColCount * (-1), GETDATE())
                          ELSE DATEADD(DAY,  @MaxColCount * (-1), GETDATE())
                          END)
    SET @ErrorFilterValue = (CASE WHEN ISNULL(@Status, '') = 'ERROR' THEN 1 ELSE 0 END)
    SET @WarningFilterValue = (CASE WHEN ISNULL(@Status, '') = 'WARNING' THEN 1 ELSE 0 END)
    
    CREATE TABLE [#SSISPackageExecutionLog] (
      [LogID] [int] NOT NULL,
      [PackageName] [nvarchar] (255) NOT NULL,
      [PackageID] [uniqueidentifier] NOT NULL,
      [ExecutionID] [uniqueidentifier] NOT NULL,
      [ExecutionStartDateTime] [datetime] NOT NULL,
      [ExecutionEndDateTime] [datetime] NOT NULL,
      [RunTimeInSeconds] [int] NOT NULL,
      [TotalErrorCount] [int] NOT NULL,
      [TotalWarningCount] [int] NOT NULL)
    
    CREATE TABLE [#PackageRuntimeAvgTbl] (
        [PackageUniqueID] [uniqueidentifier] NOT NULL PRIMARY KEY CLUSTERED DEFAULT (NEWID()),
        [PackageID] [uniqueidentifier] NOT NULL,
        [PackageName] NVARCHAR(255) NOT NULL,
        [ExecutionCount] INT NOT NULL,
        [AverageRuntimeSeconds] INT NOT NULL,
        [PackageRuntimeStdDev] FLOAT NOT NULL,
    )

    CREATE TABLE [#PackageDetailsTable] (
        [LogID] INT NOT NULL,
        [PackageUniqueID] [uniqueidentifier] NOT NULL,
        [PackageID] [uniqueidentifier] NOT NULL,
        [ExecutionID] [uniqueidentifier] NOT NULL,
        [ExecutionStart] DATETIME NOT NULL,
        [ExecutionEnd] DATETIME NOT NULL,
        [RunTimeInSeconds] INT NOT NULL,
        [ZScore] FLOAT NOT NULL
    )

    CREATE CLUSTERED INDEX CX_SSISPackageExecutionLog ON #SSISPackageExecutionLog ([PackageID], [PackageName])
    CREATE INDEX CX_PackageDetailsTable ON #PackageDetailsTable ([PackageID]) INCLUDE ([ZScore])
    
    -- first of all get the rows we care about into a temp table
    INSERT INTO [#SSISPackageExecutionLog] ([LogID], [PackageName], [PackageID], [ExecutionID], [ExecutionStartDateTime], [ExecutionEndDateTime], [RunTimeInSeconds], [TotalErrorCount], [TotalWarningCount])
    SELECT [LogID],
           [PackageName], 
           [PackageID], 
           [ExecutionID], 
           [ExecutionStartDateTime], 
           [ExecutionEndDateTime],
           DATEDIFF(s, [ExecutionStartDateTime], [ExecutionEndDateTime]) AS [RuntimeInSeconds],
           ISNULL([TotalErrorCount], 0),
           ISNULL([TotalWarningCount], 0)
      FROM [SSISPackageExecutionLog]
     WHERE [LogDate] >= @LogDateCutoff
       AND [ExecutionEndDateTime] IS NOT NULL
       AND [ExecutionEndDateTime] >= [ExecutionStartDateTime]
       AND ISNULL([TotalErrorCount], 0) >= @ErrorFilterValue
       AND ISNULL([TotalWarningCount], 0) >= @WarningFilterValue
       AND [PackageName] LIKE @PackageNameFilter
       AND [UserName] LIKE @ExecutionAccountName
       AND [MachineName] LIKE @MachineName
       AND [InteractiveMode] = (CASE @ExecutionMode
                                WHEN 'ALL' THEN [InteractiveMode]
                                WHEN 'I' THEN 1
                                ELSE 0 END)

    INSERT INTO [#PackageRuntimeAvgTbl] ([PackageID], [PackageName], [ExecutionCount], [AverageRuntimeSeconds], [PackageRuntimeStdDev])
    SELECT [PackageID],
           [PackageName],
           COUNT(*),
           ISNULL(AVG([RunTimeInSeconds]), 0),
           ISNULL(STDEV([RunTimeInSeconds]), 0)
    FROM [#SSISPackageExecutionLog]
    GROUP BY [PackageID], [PackageName]

    INSERT INTO [#PackageDetailsTable] ([PackageUniqueID], [LogID], [PackageID], [ExecutionID], [ExecutionStart], [ExecutionEnd], [RunTimeInSeconds], [ZScore])
    SELECT [PackageUniqueID],
           [LogID],
           [executionLog].[PackageID],
           [ExecutionID],
           [ExecutionStartDateTime],
           [ExecutionEndDateTime],
           [RunTimeInSeconds],
           (CASE [PackageRuntimeStdDev]
            WHEN 0 THEN 0
            ELSE (([RunTimeInSeconds] - [AverageRuntimeSeconds]) / [PackageRuntimeStdDev])
            END)
      FROM [#SSISPackageExecutionLog] [executionLog] INNER JOIN 
           [#PackageRuntimeAvgTbl] [averages] 
        ON [averages].[PackageID] = [executionLog].[PackageID] AND [averages].[PackageName] = [executionLog].[PackageName]
     GROUP BY [ExecutionStartDateTime],
              [ExecutionEndDateTime],
              [RunTimeInSeconds],
              [PackageUniqueID],
              [executionLog].[PackageID],
              [LogID],
              [ExecutionID],
              [AverageRuntimeSeconds],
              [PackageRuntimeStdDev]

    SELECT [averages].[PackageUniqueID] AS [PackageID], 
           [PackageName], 
           [ExecutionCount], 
           [AverageRuntimeSeconds], 
           [PackageRuntimeStdDev], 
           [GoodCount], 
           [WarningCount], 
           [ErrorCount]
      FROM [#PackageRuntimeAvgTbl] averages INNER JOIN 
           (SELECT [PackageUniqueID], 
                   SUM(CASE WHEN ABS([ZScore]) < 1 THEN 1 ELSE 0 END) AS [GoodCount],
                   SUM(CASE WHEN ABS([ZScore]) >= 1 AND ABS([ZScore]) < 2 THEN 1 ELSE 0 END) AS [WarningCount],
                   SUM(CASE WHEN ABS([ZScore]) > 2 THEN 1 ELSE 0 END) AS [ErrorCount]
              FROM [#PackageDetailsTable]
             GROUP BY [PackageUniqueID]) NormalScores 
        ON [NormalScores].[PackageUniqueID] = [averages].[PackageUniqueID]

    SELECT [LogID], 
           [PackageUniqueID] AS [PackageID],
           [ExecutionID],
           [ExecutionStart], 
           [ExecutionEnd], 
           [RunTimeInSeconds], 
           [ZScore]
      FROM [#PackageDetailsTable]

    DROP TABLE #SSISPackageExecutionLog
    DROP TABLE #PackageDetailsTable
    DROP TABLE #PackageRuntimeAvgTbl

    SET NOCOUNT OFF
END

GO
