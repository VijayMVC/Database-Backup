/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_ExtractLoadDetail]    Script Date: 5/15/2018 12:11:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 /*
 * Object: usp_SSISOps_Report_ExtractLoadDetail
 * --------------------------------------------------------------
 * Created By: Matt Whitfield
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * --------------------------------------------------------------
 */
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_ExtractLoadDetail]
     @Status varchar(255) = 'ALL',
     @PackageNameFilter varchar(255) = NULL,
     @MachineName varchar(255) = '%',
     @ExecutionAccountName varchar(255) = '%',
     @ExecutionMode varchar(255) = 'ALL',
     @StartDate [datetime] = NULL,
     @EndDate [datetime] = NULL,
     @DataSourceFilter varchar(255) = '%',
     @CatalogFilter varchar(255) = '%',
     @DataSourceObjectFilter varchar(255) = '%'
AS
BEGIN
    IF @EndDate IS NULL
        SET @EndDate = GETDATE()

    IF @StartDate IS NULL
        SET @StartDate = DATEADD(YEAR, -1, @EndDate)

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
    SELECT  [log].[ExecutionID],
            [log].[ExecutionStartDateTime] as PackageExecutionStartDateTime,
            [log].[ExecutionEndDateTime] as PackageExecutionEndDateTime,
            [log].[TotalErrorCount] as PackageTotalErrorCount,
            [log].[TotalWarningCount] AS PackageTotalWarningCount,
            [tasks].[ExecutionStartDateTime] AS DataFlowExecutionStartDateTime,
            [tasks].[ExecutionEndDateTime] AS DataFlowExecutionEndDateTime,
            [tasks].[TotalErrorCount] as DataFlowTotalErrorCount,
            [tasks].[TotalWarningCount] as DataFlowTotalWarningCount,
            [log].[PackageName],
            [tasks].[SourceName],
            CONVERT([bit], (Case when [rowCounts].[ComponentTypeCode]='SRC' then 1 else 0 END)) AS IsSource,
            [rowCounts].[ComponentTypeName],
            [rowCounts].[ComponentName],
            CONVERT([bigint], [rowCounts].[RecordCount]) AS [RecordCount],
            (case when [rowCounts].[DataObjectType] IN('TableOrView') then ISNULL([rowCounts].[DataObjectName],'Unknown') --Additional Info
                  when [rowCounts].[DataObjectType] IN('VariableTableOrView','VariableSqlCommand','SqlCommand') then ISNULL([rowCounts].[DataObjectQuery],'Unknown') --Additional Info
                  when [rowCounts].[DataObjectType] IN('XMLFile','RawFile','FlatFile','VariableFileName') then ISNULL([rowCounts].[DataObjectDataSource],'Unknown') --Additional Info
                  else ISNULL([rowCounts].[DataObjectName],'Unknown')
             END) AS DataSourceObject,
            [rowCounts].[DataObjectConnectionString],
            [rowCounts].[DataObjectDataSource],
            [rowCounts].[DataObjectCatalog],
            [rowCounts].[DataObjectUserName],	
            Isnull([log].[LayoutID],0) AS LayoutID	
    FROM [dbo].[fn_SSISOps_Report_LogRowsByStartDateEndDate](@Status, @PackageNameFilter, @MachineName, @ExecutionAccountName, @ExecutionMode, @StartDate, @EndDate) [log]
    inner JOIN [SSISTaskExecutionLog] [tasks] ON [log].[ExecutionID]=[tasks].[ExecutionID] 
    inner JOIN [SSISPackageRowCountLog] [rowCounts] on [tasks].[ExecutionID]=[rowCounts].[ExecutionID] And [tasks].[LogID]=Isnull([rowCounts].[ParentLogID],[tasks].[LogID]) And [tasks].[SourceID]=[rowCounts].[SourceID]
    where [rowCounts].[DataObjectDataSource] LIKE @DataSourceFilter
        and [rowCounts].[DataObjectCatalog] LIKE @CatalogFilter
        and ([rowCounts].[DataObjectQuery] LIKE @DataSourceObjectFilter or [rowCounts].[DataObjectName] LIKE @DataSourceObjectFilter)	
END

GO
