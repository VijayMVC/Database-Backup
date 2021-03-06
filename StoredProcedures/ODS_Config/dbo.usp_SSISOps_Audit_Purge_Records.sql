/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Audit_Purge_Records]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
Source : Pragmatic Works - BI xPress Auditing Framework 53
Created On : 7/2/2014
Purpose : 
    - Purge audit records from various tables. Purge records based on Days, MachineName, Package or ExecutionID
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Audit_Purge_Records]
    @PackageName NVARCHAR(255) = '%',
    @ExecutionID VARCHAR(255) = NULL,
    @MachineName NVARCHAR(255) = '%',
    @DaysToKeep INT = 180
AS 
BEGIN
    IF @ExecutionID IS NOT NULL
        SET @PackageName ='<N/A>'

    DECLARE @TimeToDelete DATETIME

    SET @TimeToDelete = GETDATE() - @DaysToKeep

    -- Delete records from SSISPackageRowCountLog
    DELETE a FROM [SSISPackageRowCountLog] a JOIN [SSISPackageExecutionLog] b ON a.[ExecutionID] = b.[ExecutionID] WHERE ((@PackageName = '%' OR b.[PackageName] LIKE @PackageName) AND (@MachineName = '%' OR b.[MachineName] LIKE @MachineName) AND b.[ExecutionStartDateTime] <= @TimeToDelete) OR a.[ExecutionID] = @ExecutionID

    -- Delete records from SSISTaskExecutionAlerts
    DELETE a FROM [SSISTaskExecutionAlerts] a JOIN [SSISPackageExecutionLog] b ON a.[ExecutionID] = b.[ExecutionID] WHERE ((@PackageName = '%' OR b.[PackageName] LIKE @PackageName) AND (@MachineName = '%' OR b.[MachineName] LIKE @MachineName) AND b.[ExecutionStartDateTime] <= @TimeToDelete) OR a.[ExecutionID] = @ExecutionID

    -- Delete records from SSISTaskExecutionLog
    DELETE a FROM [SSISTaskExecutionLog] a JOIN [SSISPackageExecutionLog] b ON a.[ExecutionID] = b.[ExecutionID] WHERE ((@PackageName = '%' OR b.[PackageName] LIKE @PackageName) AND (@MachineName = '%' OR b.[MachineName] LIKE @MachineName) AND b.[ExecutionStartDateTime] <= @TimeToDelete) OR a.[ExecutionID] = @ExecutionID

    -- Delete pipeline history
    DELETE a FROM [SSISDataFlowExecutionLog] a JOIN [SSISPackageExecutionLog] b ON a.[executionid] = b.[ExecutionID] WHERE ((@PackageName = '%' OR b.[PackageName] LIKE @PackageName) AND (@MachineName = '%' OR b.[MachineName] LIKE @MachineName) AND b.[ExecutionStartDateTime] <= @TimeToDelete) OR (@ExecutionID IS NOT NULL AND a.[executionid] = CAST(@ExecutionID AS uniqueidentifier))

    -- Delete variable change log
    DELETE a FROM [SSISPackageVariableLog] a JOIN [SSISPackageExecutionLog] b ON a.[ExecutionID] = b.[ExecutionID] WHERE ((@PackageName = '%' OR b.[PackageName] LIKE @PackageName) AND (@MachineName = '%' OR b.[MachineName] LIKE @MachineName) AND b.[ExecutionStartDateTime] <= @TimeToDelete) OR (@ExecutionID IS NOT NULL AND a.[ExecutionID] = CAST(@ExecutionID AS uniqueidentifier))

    -- Delete records from SSISPackageExecutionLog
    DELETE FROM [SSISPackageExecutionLog] WHERE ((@PackageName = '%' OR [PackageName] LIKE @PackageName) AND (@MachineName = '%' OR [MachineName] LIKE @MachineName) AND [ExecutionStartDateTime] <= @TimeToDelete) OR [ExecutionID] = @ExecutionID

    -- Delete unused layouts
    DELETE FROM [SSISPackageLayout] WHERE [LayoutID] NOT IN (SELECT DISTINCT [LayoutID] FROM [SSISPackageExecutionLog])
END

GO
