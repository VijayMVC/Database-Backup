/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Audit_LatestPackageExecutions]    Script Date: 5/15/2018 12:11:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Audit_LatestPackageExecutions
 * --------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 11/21/2012
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * Purpose : 
 *     - Loads the top X number of package executions with the option to use a package name filter and fiter operator.
 * --------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Audit_LatestPackageExecutions]
(
      @TopCount INT = NULL
    , @MaxVariableLength INT = NULL
    , @PackageNameFilterOperator VARCHAR(10) = NULL
    , @PackageNameFilter NVARCHAR(255) = NULL
)
AS
BEGIN
    SET NOCOUNT ON

    IF (@TopCount IS NULL)
    BEGIN
        SET @TopCount = 20
    END

    IF (@MaxVariableLength IS NULL)
    BEGIN
        SET @MaxVariableLength = 4000
    END

    IF (@PackageNameFilterOperator IS NULL)
    BEGIN
        SET @PackageNameFilterOperator = ''
    END
    ELSE
    BEGIN
        SET @PackageNameFilterOperator = UPPER(@PackageNameFilterOperator)
    END

    IF (@PackageNameFilter IS NULL)
    BEGIN
        SET @PackageNameFilter = ''
    END

    SELECT TOP(@TopCount)
          [s].[LogID]
        , [s].[ExecutionID]
        , [s].[PackageName]
        , ISNULL([s].[LayoutID], 0) AS [LayoutID]
        , [s].[ExecutionStartDateTime]
        , [s].[ExecutionEndDateTime]
        , ISNULL([s].[TotalErrorCount], 0) AS [TotalErrorCount]
        , [Variables] = (
                (CASE WHEN DATALENGTH([s].[Variables]) > @MaxVariableLength
                    THEN LEFT(CAST([s].[Variables] AS NVARCHAR(MAX)), @MaxVariableLength) + ' ***** <LARGE STRING [Data truncated] - ' + CAST((DATALENGTH([s].[Variables])/1024) AS NVARCHAR(100)) + ' KB> Change max variable length option to see the full value *****'
                    ELSE [s].[Variables]
                 END)
            )
        , [s].[Connections]
        , [s].[UserName]
        , [s].[MachineName]
        , [s].[InteractiveMode]
        , [c].[ExecutionId] As [CatalogExecutionId]
        , [c].[PackageId] As [CatalogPackageId]
        , [c].[PackageGuid] As [CatalogPackageGuid]
        , [c].[FolderId] As [CatalogFolderId]
        , [c].[FolderName] As [CatalogFolderName]
        , [c].[ProjectId] As [CatalogProjectId]
        , [c].[ProjectName] As [CatalogProjectName]
        , [c].[MachineName] As [CatalogMachineName]
        , [c].[ServerName] As [CatalogServerName]
        , [c].[Status] As [CatalogStatus]
        , [c].[StoppedByName] As [CatalogStoppedByName]
    FROM [SSISPackageExecutionLog] AS [s] (NOLOCK)
        LEFT OUTER JOIN [SSISCatalogPackageExecution] [c] (NOLOCK)
            ON [c].[ExecutionGuid] = [dbo].[fn_ToUniqueIdentifier]([s].[ExecutionID])
    WHERE @PackageNameFilter = '' AND @PackageNameFilterOperator = ''
        OR
        (
               (@PackageNameFilterOperator = '=' AND [s].[PackageName] = @PackageNameFilter)
            OR (@PackageNameFilterOperator = 'CONTAINS' AND [s].[PackageName] LIKE ('%' + @PackageNameFilter + '%'))
            OR (@PackageNameFilterOperator = 'STARTSWITH' AND [s].[PackageName] LIKE (@PackageNameFilter + '%'))
            OR (@PackageNameFilterOperator = 'ENDSWITH' AND [s].[PackageName] LIKE ('%' + @PackageNameFilter))
            OR ((@PackageNameFilterOperator = '!=' OR @PackageNameFilter = '<>') AND [s].[PackageName] <> @PackageNameFilter)
        )
    ORDER BY [s].[LogID] DESC

    SET NOCOUNT OFF
END

GO
