/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_ExecutionTrendForTaskSummary_59]    Script Date: 5/15/2018 12:11:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
    Source : Pragmatic Works - BI xPress Auditing Framework 59
    Created On : 2/19/2016
    Purpose : 
        - Displays Information about summary of package and task execution trend.
*/
Create PROCEDURE [bix].[usp_SSISOps_Report_ExecutionTrendForTaskSummary_59]
(
     @Status VARCHAR(255) = 'ALL'
    ,@PackageNameFilter VARCHAR(255) = NULL
    ,@MachineName VARCHAR(255) = '%'
    ,@ExecutionAccountName VARCHAR(255) = '%'
    ,@ExecutionMode VARCHAR(255) = 'ALL'
    ,@IntervalType VARCHAR(10) = 'd'
    ,@MaxColCount INT = NULL
    ,@ShowQuery VARCHAR(10) = NULL
    ,@ShowConnStr VARCHAR(10) = NULL
)
AS
BEGIN
    SET NOCOUNT ON

    IF @MachineName IS NULL
        SET @MachineName = '%'
    IF @ExecutionAccountName IS NULL
        SET @ExecutionAccountName = '%'
    IF @PackageNameFilter IS NULL
        SET @PackageNameFilter = '%'	

    SELECT 
    ------------------
    --Package Row Labels
    ------------------
       RowLabel_1 = a.[PackageName]
      ,RowLabel_2 = a.[ExecutionID] --???
      ,RowLabel_3 = a.[ExecutionStartDateTime]
      ,RowLabel_4 = a.[ExecutionEndDateTime]
    ------------------	        
    --Task Row Labels
    ------------------
      ,RowLabel_6 = b.[SourceName]
      ,RowLabel_7 = LOWER(b.[SourceType])
      ,RowLabel_8 = b.[SourceID]
    ------------------	        
    --DF Component Labels
    ------------------
      ,RowLabel_9 = CAST('' AS VARCHAR(255)) --ComponentName
      ,RowLabel_10 = CAST('' AS VARCHAR(100)) --ComponentTypeName
      ,RowLabel_11 = CAST('' AS VARCHAR(50)) --ComponentID
      ,RowLabel_12 = CAST('' AS VARCHAR(10)) --ComponentTypeCode
 
      ,ColLabel_1 = (CASE @IntervalType
                        WHEN 'd' THEN CONVERT(VARCHAR(10),a.[LogDate], 101)
                        WHEN 'w' THEN CAST(DATEPART(week, a.[LogDate]) AS VARCHAR(10))
                        WHEN 'm' THEN CAST(DATEPART(month, a.[LogDate]) AS VARCHAR(10))
                        WHEN 'y' THEN CAST(DATEPART(year, a.[LogDate]) AS VARCHAR(10))
                     END)
    ------------------
    --Package Counters	
    ------------------
      ,Measure_1 = AVG(DATEDIFF(s,a.[ExecutionStartDateTime]  ,a.[ExecutionEndDateTime])) --Package runtime
      ,Measure_3 = AVG(a.TotalErrorCount)
      ,Measure_4 = AVG(a.TotalRecordsExtracted)
      ,Measure_5 = AVG(a.TotalRecordsLoaded)
      ,Measure_6 = COUNT(DISTINCT a.LogID)
      ,Measure_7 = AVG(a.TotalWarningCount)
  
    ------------------
    --Task Counters	
    ------------------
      ,Measure_8 = AVG(DATEDIFF(s,b.[ExecutionStartDateTime]  ,b.[ExecutionEndDateTime])) --Task runtime
      ,Measure_10 = AVG(b.TotalErrorCount)
      ,Measure_11 = AVG(b.TotalRecordsExtracted)
      ,Measure_12 = AVG(b.TotalRecordsLoaded)
      ,Measure_13 = COUNT(DISTINCT b.LogID)
      ,Measure_14 = AVG(b.TotalWarningCount)  

    ------------------
    --Component Counters	
    ------------------
      ,Measure_15 = 0 --Component Runtime
      ,Measure_16 = 0 --TotalErrors
      ,Measure_17 = CAST(0 AS BIGINT) --Records in
      ,Measure_18 = CAST(0 AS BIGINT) --Records out
      ,Measure_19 = 0 --exec cnt
      ,Measure_20 = 0 --Buffers in
      ,Measure_21 = 0 --Buffers out
      ,Measure_22 = 0 --TotalWarnings
    FROM [bix].[vw_SSISPackageExecutionLog_59] (NOLOCK) a
    LEFT OUTER JOIN [bix].[vw_SSISTaskExecutionLog_59] (NOLOCK) b
        ON a.[ExecutionID] = b.[ExecutionID]
    WHERE a.[LogDate] >= (CASE @IntervalType
                            WHEN 'd' THEN DATEADD(day,  @MaxColCount * (-1), GETDATE())
                            WHEN 'w' THEN DATEADD(week,  @MaxColCount * (-1), GETDATE())
                            WHEN 'm' THEN DATEADD(month,  @MaxColCount * (-1), GETDATE())
                            WHEN 'y' THEN DATEADD(year,  @MaxColCount * (-1), GETDATE())
                            ELSE DATEADD(day,  @MaxColCount * (-1), GETDATE())
                          END)
        AND a.[ExecutionEndDateTime] IS NOT NULL
        AND (ISNULL(a.[TotalErrorCount],0) >= (CASE WHEN ISNULL(@Status,'') = 'ERROR' THEN 1 ELSE 0 END))
        AND (ISNULL(a.[TotalWarningCount],0) >= (CASE WHEN ISNULL(@Status,'') = 'WARNING' THEN 1 ELSE 0 END))
        AND a.PackageName LIKE @PackageNameFilter
        AND a.UserName LIKE @ExecutionAccountName
        AND a.MachineName LIKE @MachineName
        AND a.InteractiveMode = (CASE @ExecutionMode
                                    WHEN 'ALL' THEN a.InteractiveMode 
                                    WHEN 'I' THEN 1
                                    ELSE 0
                                 END)
    GROUP BY a.[ExecutionID], a.[ExecutionStartDateTime], a.[ExecutionEndDateTime], a.[PackageName], a.[PackageID], b.[SourceName], b.[SourceType], b.[SourceID]
        ,(CASE @IntervalType
            WHEN 'd' THEN CONVERT(VARCHAR(10),a.[LogDate],101)
            WHEN 'w' THEN CAST(DATEPART(week, a.[LogDate]) AS VARCHAR(10))
            WHEN 'm' THEN CAST(DATEPART(month, a.[LogDate]) AS VARCHAR(10))
            WHEN 'y' THEN CAST(DATEPART(year, a.[LogDate]) AS VARCHAR(10))
          END)
    ORDER BY a.[PackageName], a.[PackageID]

    SET NOCOUNT OFF
END

GO
