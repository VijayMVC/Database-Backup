/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_ExtractLoadTrend]    Script Date: 5/15/2018 12:11:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
 * Object: usp_SSISOps_Report_ExtractLoad
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Modified By: Tyler Ryan
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * --------------------------------------------------------------
 */
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_ExtractLoadTrend]
 (@Status VARCHAR(255) = 'ALL'
,@PackageNameFilter VARCHAR(255) = null
,@MachineName VARCHAR(255) = '%'
,@ExecutionAccountName VARCHAR(255) = '%'
,@ExecutionMode VARCHAR(255) = 'ALL'
,@IntervalType VARCHAR(10) = 'd'
,@MaxColCount INT = NULL
,@DataSourceFilter VARCHAR(255) = '%'
,@CatalogFilter VARCHAR(255) = '%'
,@DataSourceObjectFilter VARCHAR(255) = '%')
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT 
  [log].[PackageName],
  [log].[PackageID],
  ISNULL([log].[LayoutID],0) AS [LayoutID],
  [log].[ExecutionID],
  [tasks].[SourceName] AS [DataFlowName],
  CASE 
    WHEN [rowCounts].[DataObjectType] IN('RawFile','TableOrView','FlatFile') THEN [rowCounts].[DataObjectName]
    WHEN [rowCounts].[DataObjectType] IN('VariableFileName','TableOrView','FlatFile') THEN [rowCounts].[DataObjectDataSource]
    WHEN [rowCounts].[DataObjectType] IN('VariableSqlCommand','SqlCommand','VariableTableOrView','Variable') THEN [rowCounts].[DataObjectQuery]
    ELSE [rowCounts].[DataObjectName]
   END AS [DataObjectName],
  [rowCounts].[ComponentName],
  [rowCounts].[ComponentTypeName],
  CONVERT([bit], (CASE WHEN [rowCounts].[ComponentTypeCode] = 'SRC' THEN 1 ELSE 0 END)) AS [IsSource],
  [rowCounts].[LogDate],
  CONVERT([bigint], [rowCounts].[RecordCount]) AS [RecordCount]
FROM [dbo].[fn_SSISOps_Report_LogRowsByInterval](@Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @IntervalType, @MaxColCount) [log]
INNER JOIN [SSISPackageRowCountLog] [rowCounts]
    ON [log].[ExecutionID] = [rowCounts].[ExecutionID]
LEFT OUTER JOIN 
      (SELECT [ExecutionID], [SourceID], MAX([SourceName]) AS [SourceName] FROM [SSISTaskExecutionLog] GROUP BY [ExecutionID], [SourceID]) [tasks]
    ON [rowCounts].[ExecutionID] = [tasks].[ExecutionID] AND [rowCounts].[SourceID] = [tasks].[SourceID]
WHERE [rowCounts].[DataObjectDataSource] LIKE @DataSourceFilter
  AND [rowCounts].[DataObjectCatalog] LIKE @CatalogFilter
  AND ([rowCounts].[DataObjectQuery] LIKE @DataSourceObjectFilter OR [rowCounts].[DataObjectName] LIKE @DataSourceObjectFilter)
END

GO
