/****** Object:  StoredProcedure [bix].[usp_SSISOps_Audit_LatestPackageExecutions_59]    Script Date: 5/15/2018 12:11:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Audit_LatestPackageExecutions
 * --------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 11/21/2012
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * Purpose : 
 *     - Loads the top X number of package executions with the option to use a package name filter and fiter operator.
 * --------------------------------------------------------------
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Audit_LatestPackageExecutions_59]
(
      @TopCount INT = NULL
    , @MaxVariableLength INT = NULL
    , @PackageNameFilterOperator VARCHAR(10) = NULL
    , @PackageNameFilter NVARCHAR(MAX) = NULL
    , @GroupNameFilter NVARCHAR(MAX) = NULL
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

    IF (@GroupNameFilter IS NULL)
    BEGIN
        SET @GroupNameFilter = ''
    END

    IF (ISNULL(@GroupNameFilter, '') = '')
    BEGIN
        SELECT [p].[LogID]
            , [p].[ExecutionID]
            , [p].[PackageName]
            , [p].[LayoutID]
            , [p].[ExecutionStartDateTime]
            , [p].[ExecutionEndDateTime]
            , [p].[TotalErrorCount]
            , [p].[Variables]
            , [p].[Connections]
            , [p].[UserName]
            , [p].[MachineName]
            , [p].[InteractiveMode]
            , [p].[CatalogExecutionId]
            , [p].[CatalogPackageId]
            , [p].[CatalogPackageGuid]
            , [p].[CatalogFolderId]
            , [p].[CatalogFolderName]
            , [p].[CatalogProjectId]
            , [p].[CatalogProjectName]
            , [p].[CatalogMachineName]
            , [p].[CatalogServerName]
            , [p].[CatalogStatus]
            , [p].[CatalogStoppedByName]
            , [pgn].[GroupID]
            , [pgn].[GroupName]
        FROM (
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
            FROM [bix].[vw_SSISPackageExecutionLog_59] AS [s] (NOLOCK)
            LEFT OUTER JOIN [bix].[vw_SSISCatalogPackageExecution_59] [c] (NOLOCK)
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
        ) [p]
        LEFT OUTER JOIN (
            SELECT [g].[GroupID]
                , [g].[Name] AS [GroupName]
                , [spgn].[PackageName]
            FROM [bix].[vw_SSISPackageGroupNames_59] [spgn] (NOLOCK)
            INNER JOIN [bix].[vw_GroupNames_59] [g] (NOLOCK) ON [spgn].[GroupID] = [g].[GroupID]
        ) [pgn] ON [p].[PackageName] = [pgn].[PackageName] COLLATE Latin1_General_CI_AS
    END
    ELSE
    BEGIN
        DECLARE @IsUngroupedDesired BIT

        SELECT LTRIM(RTRIM(f.[Value])) As [GroupName]
        INTO #GroupNamesTbl
        FROM [dbo].[fn_ParseStringList](@GroupNameFilter, ',') f
        WHERE ISNULL(f.[Value], '') != ''

        IF EXISTS (SELECT 1 FROM #GroupNamesTbl [t] WHERE [t].[GroupName] = 'ungrouped' COLLATE Latin1_General_CI_AS)
        BEGIN
            SET @IsUngroupedDesired = 1
        END
        ELSE
        BEGIN
            SET @IsUngroupedDesired = 0
        END

        DELETE FROM #GroupNamesTbl WHERE [GroupName] = 'ungrouped' COLLATE Latin1_General_CI_AS

        SELECT [s].[LogID]
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
            , [x].[GroupID]
            , [x].[GroupName]
        FROM [bix].[vw_SSISPackageExecutionLog_59] AS [s] (NOLOCK)
        INNER JOIN (
            -- I did a distinct here because if ungrouped packages are allowed there will be multiple entries per package retrieved in the first subselect below.
            SELECT DISTINCT [p].[LogID]
                , [pgn].[GroupID]
                , [pgn].[GroupName]
            FROM (
                -- Filter the packages by package name, range, etc, first.
                SELECT TOP(@TopCount)
                      [s].[LogID]
                    , [s].[PackageName]
                FROM [bix].[vw_SSISPackageExecutionLog_59] AS [s] (NOLOCK)
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
            ) [p]
            LEFT OUTER JOIN (
                -- Denormalize the Package & Package Group Names in preparation for left outer joining to the selected packages above.
                SELECT [g].[GroupID]
                    , [g].[Name] AS [GroupName]
                    , [spgn].[PackageName]
                FROM [bix].[vw_SSISPackageGroupNames_59] [spgn] (NOLOCK)
                INNER JOIN [bix].[vw_GroupNames_59] [g] (NOLOCK) ON [spgn].[GroupID] = [g].[GroupID]
            ) [pgn] ON [p].[PackageName] = [pgn].[PackageName] COLLATE Latin1_General_CI_AS
            INNER JOIN #GroupNamesTbl [t] -- Next join the group names to that of the filtered group names, optionally allowing NULL values (ungrouped packages)
                ON [pgn].[GroupName] = t.[GroupName] COLLATE Latin1_General_CI_AS
                    OR (@IsUngroupedDesired = 1 AND [pgn].[GroupName] IS NULL)
        ) [x] on [s].[LogID] = x.[LogID]
        LEFT OUTER JOIN [bix].[vw_SSISCatalogPackageExecution_59] [c] (NOLOCK)
            ON [c].[ExecutionGuid] = [dbo].[fn_ToUniqueIdentifier]([s].[ExecutionID])

        DROP TABLE #GroupNamesTbl
    END

    SET NOCOUNT OFF
END

GO
