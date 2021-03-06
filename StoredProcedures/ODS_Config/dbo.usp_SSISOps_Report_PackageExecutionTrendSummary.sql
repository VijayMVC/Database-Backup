/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_PackageExecutionTrendSummary]    Script Date: 5/15/2018 12:11:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
    Source : Pragmatic Works - BI xPress Reporting
    Created On : 5/17/2012
    Created By : Jeremiah Nazaruk
    Purpose : 
        - Displays Information about summary of package execution trend.
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_PackageExecutionTrendSummary]
(
    @Status VARCHAR(255) = 'ALL'
    ,@PackageNameFilter VARCHAR(255) = NULL
    ,@MachineName VARCHAR(255) = NULL
    ,@ExecutionAccountName VARCHAR(255) = NULL
    ,@ExecutionMode VARCHAR(255) = 'ALL'
    ,@IntervalType VARCHAR(10) = 'd' -- Default to 60 days of package execution history
    ,@MaxColCount INT = 60 -- Default to 60 days of package execution history
    ,@ShowQuery VARCHAR(10) = NULL
    ,@ShowConnStr VARCHAR(10) = NULL
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @CurrentDate AS DATETIME
    DECLARE @CurrentYear as INT

    SET @CurrentDate = GETDATE()
    SET @CurrentYear = DATEPART(year, @CurrentDate)

    DECLARE @YearDifference INT

    SET @YearDifference = (@MaxColCount * -1) + @CurrentYear

    IF @IntervalType = 'y' AND (@YearDifference < 1900)
    BEGIN
        SET @MaxColCount = (1900 - @CurrentYear)
    END

    SELECT a.[PackageName]
        , a.[PackageID]
        , a.[ExecutionID]
        , a.[ExecutionStartDateTime]
        , a.[ExecutionEndDateTime]
        , (CASE WHEN ISNULL(SUM(a.TotalErrorCount), 0) > 0 THEN 'Error' 
               WHEN ISNULL(SUM(a.TotalWarningCount), 0) > 0 THEN 'Warning' 
               ELSE 'Success'
           END) AS [ExecutionStatus]
        , (CASE @IntervalType
            WHEN 'd' THEN CONVERT(VARCHAR(10), a.[LogDate], 101)
            WHEN 'w' THEN CAST(DATEPART(week, a.[LogDate]) AS VARCHAR(10))
            WHEN 'm' THEN CAST(DATEPART(month, a.[LogDate]) AS VARCHAR(10))
            WHEN 'y' THEN CAST(DATEPART(year, a.[LogDate]) AS VARCHAR(10))
           END) AS [FriendlyDate]
        , AVG(DATEDIFF(s,a.[ExecutionStartDateTime], a.[ExecutionEndDateTime])) AS [PackageRuntimeInSeconds]
        , AVG(a.TotalErrorCount) AS [AvgTotalErrorCount]
        , AVG(a.TotalRecordsExtracted) AS [AvgTotalRecordsExtracted]
        , AVG(a.TotalRecordsLoaded) AS [AvgTotalRecordsLoaded]
        , COUNT(a.ExecutionID) AS [NumberOfExecutions]
        , AVG(a.TotalWarningCount) AS [AvgTotalWarningCount]
    FROM [SSISPackageExecutionLog] a
    WHERE a.[LogDate] >= (CASE @IntervalType
                            WHEN 'd' THEN DATEADD(DAY, @MaxColCount * -1, @CurrentDate)
                            WHEN 'w' THEN DATEADD(week, @MaxColCount * -1, @CurrentDate)
                            WHEN 'm' THEN DATEADD(month, @MaxColCount * -1, @CurrentDate)
                            WHEN 'y' THEN DATEADD(year, @MaxColCount * -1, @CurrentDate)
                            ELSE DATEADD(DAY, @MaxColCount * -1, @CurrentDate)
                          END)
    AND a.[ExecutionEndDateTime] IS NOT NULL
    AND a.[ExecutionEndDateTime] >= a.[ExecutionStartDateTime]
    AND (ISNULL(a.[TotalErrorCount], 0) >= (CASE WHEN ISNULL(@Status, '') = 'ERROR' THEN 1 ELSE 0 END))
    AND (ISNULL(a.[TotalWarningCount], 0) >= (CASE WHEN ISNULL(@Status, '') = 'WARNING' THEN 1 ELSE 0 END))
    AND (@PackageNameFilter IS NULL OR (@PackageNameFilter IS NOT NULL AND a.[PackageName] LIKE @PackageNameFilter))
    AND (@ExecutionAccountName IS NULL OR (@ExecutionAccountName IS NOT NULL AND a.[UserName] LIKE @ExecutionAccountName))
    AND (@MachineName IS NULL OR (@MachineName IS NOT NULL AND a.[MachineName] LIKE @MachineName))
    AND a.[InteractiveMode] = (CASE @ExecutionMode
                                WHEN 'ALL' THEN a.[InteractiveMode]
                                WHEN 'I' THEN 1
                                ELSE 0
                               END)
    GROUP BY a.[ExecutionID]
        , a.[ExecutionStartDateTime]
        , a.[ExecutionEndDateTime]
        , a.[PackageName]
        , a.[PackageID]
        , (CASE @IntervalType
            WHEN 'd' THEN CONVERT(VARCHAR(10),a.[LogDate],101)
            WHEN 'w' THEN CAST(DATEPART(week, a.[LogDate]) AS VARCHAR(10))
            WHEN 'm' THEN CAST(DATEPART(month, a.[LogDate]) AS VARCHAR(10))
            WHEN 'y' THEN CAST(DATEPART(year, a.[LogDate]) AS VARCHAR(10))
          END)
    ORDER BY a.[PackageName], a.[PackageID]
    
    SET NOCOUNT OFF
END

GO
