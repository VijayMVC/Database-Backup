/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_Dashboard_Top20s]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
 * Object: usp_SSISOps_Report_Dashboard_Top20s
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Source : Pragmatic Works - BI xPress Auditing Framework 50
 * Created On : 11/7/2013
 * --------------------------------------------------------------
 */
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_Dashboard_Top20s]
 @Status varchar(255)='ALL'
,@PackageNameFilter varchar(255)='%'
,@MachineName varchar(255)='%'
,@ExecutionAccountName varchar(255)='%'
,@ExecutionMode varchar(255)='ALL'
,@IntervalType varchar(10)='d'
,@MaxColCount int=1
AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT [PackageName], [RunTimeSeconds], [TotalExecutions], [MachineName], [HighestRuntimeRank], [LowestRuntimeRank], [HighestExecutionCountRank], [LowestExecutionCountRank]
  FROM (
        SELECT [PackageName], [RunTimeSeconds], [TotalExecutions], [MachineName],
               ROW_NUMBER() OVER (ORDER BY [RunTimeSeconds] DESC) AS HighestRuntimeRank,
               ROW_NUMBER() OVER (ORDER BY [RunTimeSeconds] ASC) AS LowestRuntimeRank,
               ROW_NUMBER() OVER (ORDER BY [TotalExecutions] DESC) AS HighestExecutionCountRank,
               ROW_NUMBER() OVER (ORDER BY [TotalExecutions] ASC) AS LowestExecutionCountRank
          FROM (
                SELECT [g].[PackageName],
                       [g].[MachineName],
                    AVG(DATEDIFF(s,g.[ExecutionStartDateTime],g.[ExecutionEndDateTime])) AS [RunTimeSeconds],
                    COUNT(g.[ExecutionID]) AS [TotalExecutions]
                    FROM (
                        SELECT [log].[PackageName],
                               [log].[MachineName],
                               [log].[ExecutionStartDateTime],
                               CASE WHEN ISNULL([log].[ExecutionEndDateTime], 0) = 0 OR [log].[ExecutionEndDateTime] < [log].[ExecutionStartDateTime]
                                    THEN [log].[ExecutionStartDateTime]
                                    ELSE [log].[ExecutionEndDateTime]
                                    END AS [ExecutionEndDateTime],
                               [log].[ExecutionID]
                        FROM [dbo].[fn_SSISOps_Report_LogRowsByInterval](@Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @IntervalType, @MaxColCount) [log]
                    ) [g]
                GROUP BY [g].[PackageName], [g].[MachineName]
               ) core_data
       ) ranked_data
 WHERE [HighestExecutionCountRank] <= 20 
    OR [HighestRuntimeRank] <= 20
    OR [LowestRuntimeRank] <= 20
    OR [LowestExecutionCountRank] <= 20

GO
