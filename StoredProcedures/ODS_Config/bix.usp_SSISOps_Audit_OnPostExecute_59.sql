/****** Object:  StoredProcedure [bix].[usp_SSISOps_Audit_OnPostExecute_59]    Script Date: 5/15/2018 12:11:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
Source : Pragmatic Works - BI xPress Auditing Framework 59
Created On : 2/19/2016
Purpose : 
    - Called from OnPostExecute Event Handler.
    - Logs End Time/Row Count at Package/Task Level.
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Audit_OnPostExecute_59]
    @Scope VARCHAR(10), -- Package or Task
    @ExecutionID VARCHAR(50),
    @SourceID VARCHAR(50) = NULL, -- required when Scope = Task
    @RowCountSupport BIT = NULL,
    @LogCustomValues BIT = NULL,
    @CustomValue_Num_1 NVARCHAR(255) = NULL,
    @CustomValue_Num_2 NVARCHAR(255) = NULL,
    @CustomValue_Num_3 NVARCHAR(255) = NULL,
    @CustomValue_Dt_1 DATETIME = NULL,
    @CustomValue_Dt_2 DATETIME = NULL,
    @CustomValue_Dt_3 DATETIME = NULL,
    @CustomValue_Str_1 NVARCHAR(255) = NULL,
    @CustomValue_Str_2 NVARCHAR(255) = NULL,
    @CustomValue_Str_3 NVARCHAR(255) = NULL,
    @Variables NVARCHAR(MAX) = NULL,
    @Connections NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
    
    IF @CustomValue_Dt_1 = ''
    BEGIN 
        SET @CustomValue_Dt_1 = NULL
    END
        
    IF @CustomValue_Dt_2 = ''
    BEGIN
        SET @CustomValue_Dt_2 = NULL
    END
        
    IF @CustomValue_Dt_3 = ''
    BEGIN
        SET @CustomValue_Dt_3 = NULL
    END

    -- Update Package Summary
    IF @Scope = 'Task'
    BEGIN		
        -- Update Task Summary
        IF @LogCustomValues = 1
        BEGIN
            UPDATE [bix].[vw_SSISTaskExecutionLog_59]
            SET [ExecutionEndDateTime] = GETDATE()
                , [CustomValue_Num_1] = @CustomValue_Num_1
                , [CustomValue_Num_2] = @CustomValue_Num_2
                , [CustomValue_Num_3] = @CustomValue_Num_3
                , [CustomValue_Dt_1] = @CustomValue_Dt_1
                , [CustomValue_Dt_2] = @CustomValue_Dt_2
                , [CustomValue_Dt_3] = @CustomValue_Dt_3
                , [CustomValue_Str_1] = @CustomValue_Str_1
                , [CustomValue_Str_2] = @CustomValue_Str_2
                , [CustomValue_Str_3] = @CustomValue_Str_3
            FROM [bix].[vw_SSISTaskExecutionLog_59] a WITH (ROWLOCK)
            WHERE a.[ExecutionID] = @ExecutionID 
                AND a.[SourceID] = @SourceID
                AND a.[ExecutionEndDateTime] IS NULL
        END
        ELSE
        BEGIN
            UPDATE [bix].[vw_SSISTaskExecutionLog_59]
            SET [ExecutionEndDateTime] = GETDATE()
            FROM [bix].[vw_SSISTaskExecutionLog_59] a WITH (ROWLOCK)
            WHERE a.[ExecutionID] = @ExecutionID 
                AND a.[SourceID] = @SourceID
                AND a.[ExecutionEndDateTime] IS NULL
        END
    END
    ELSE IF @Scope = 'Package' -- Update Package/Task Summary When Package Finish
    BEGIN
        -- Update aggregated field only if row count on.
        IF @RowCountSupport = 1
        BEGIN
            UPDATE [bix].[vw_SSISTaskExecutionLog_59]  
            SET [TotalRecordsExtracted] = ISNULL(a.[TotalRecordsExtracted], 0) + ISNULL(c.[TotalRecordsExtracted], 0)
                , [TotalRecordsLoaded] = ISNULL(a.[TotalRecordsLoaded], 0) +  ISNULL(c.[TotalRecordsLoaded], 0)
            FROM [bix].[vw_SSISTaskExecutionLog_59] a WITH (ROWLOCK)  
            LEFT OUTER JOIN (
                    SELECT r.[SourceID]
                        , r.[ExecutionID]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'SRC' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsExtracted]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'DEST' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsLoaded]
                    FROM [bix].[vw_SSISPackageRowCountLog_59] r WITH (NOLOCK)
                    WHERE r.[ExecutionID] = @ExecutionID 
                    GROUP BY r.[SourceID], r.[ExecutionID]
                    ) c
                ON a.[ExecutionID] = c.[ExecutionID] 
                    AND a.[SourceID] = c.[SourceID]
            WHERE a.[ExecutionID] = @ExecutionID
        END
            
        -- Update Package End Time every time and also other fields
        IF @LogCustomValues = 1
        BEGIN
            UPDATE [bix].[vw_SSISPackageExecutionLog_59]
            SET [ExecutionEndDateTime] = GETDATE()
                , [TotalErrorCount] = ISNULL(a.[TotalErrorCount], 0)
                , [TotalWarningCount] = ISNULL(a.[TotalWarningCount], 0)
                , [TotalRecordsExtracted] = ISNULL(a.[TotalRecordsExtracted], 0) + ISNULL(c.[TotalRecordsExtracted], 0)
                , [TotalRecordsLoaded] = ISNULL(a.[TotalRecordsLoaded], 0) + ISNULL(c.TotalRecordsLoaded, 0)
                , [CustomValue_Num_1] = @CustomValue_Num_1
                , [CustomValue_Num_2] = @CustomValue_Num_2
                , [CustomValue_Num_3] = @CustomValue_Num_3
                , [CustomValue_Dt_1] = @CustomValue_Dt_1
                , [CustomValue_Dt_2] = @CustomValue_Dt_2
                , [CustomValue_Dt_3] = @CustomValue_Dt_3
                , [CustomValue_Str_1] = @CustomValue_Str_1
                , [CustomValue_Str_2] = @CustomValue_Str_2
                , [CustomValue_Str_3] = @CustomValue_Str_3
                , [Variables] = @Variables	
                , [Connections] = @Connections
            FROM [bix].[vw_SSISPackageExecutionLog_59] a WITH (ROWLOCK)
            LEFT OUTER JOIN (
                    SELECT r.[ExecutionID]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'SRC' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsExtracted]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'DEST' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsLoaded]
                    FROM [bix].[vw_SSISPackageRowCountLog_59] r WITH (NOLOCK)
                    WHERE r.[ExecutionID] = @ExecutionID
                    GROUP BY r.[ExecutionID]
                    ) c
                ON a.[ExecutionID] = c.[ExecutionID]
            WHERE a.[ExecutionID] = @ExecutionID
                AND a.[ExecutionEndDateTime] IS NULL
        END
        ELSE
        BEGIN
            UPDATE [bix].[vw_SSISPackageExecutionLog_59]
            SET [ExecutionEndDateTime] = GETDATE()
                , [TotalErrorCount] = ISNULL(a.[TotalErrorCount], 0)
                , [TotalWarningCount] = ISNULL(a.[TotalWarningCount], 0)
                , [TotalRecordsExtracted] = ISNULL(a.[TotalRecordsExtracted], 0) + ISNULL(c.[TotalRecordsExtracted], 0)
                , [TotalRecordsLoaded] = ISNULL(a.[TotalRecordsLoaded], 0) + ISNULL(c.TotalRecordsLoaded, 0)
                , [Variables] = @Variables
                , [Connections] = @Connections
            FROM [bix].[vw_SSISPackageExecutionLog_59] a WITH (ROWLOCK)
            LEFT OUTER JOIN (
                    SELECT r.[ExecutionID]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'SRC' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsExtracted]
                        , SUM(CASE WHEN r.[ComponentTypeCode] = 'DEST' THEN r.[RecordCount] ELSE 0 END) AS [TotalRecordsLoaded]
                    FROM [bix].[vw_SSISPackageRowCountLog_59] r WITH (NOLOCK)
                    WHERE r.[ExecutionID] = @ExecutionID
                    GROUP BY r.[ExecutionID]
                    ) c
                ON a.[ExecutionID] = c.[ExecutionID]
            WHERE a.[ExecutionID] = @ExecutionID
                AND a.[ExecutionEndDateTime] IS NULL
        END
    END
        
    /* Custom Code Execution */
    EXEC [dbo].[usp_SSISOps_Audit_OnPostExecute_CustomCode] @Scope, @ExecutionID, @SourceID, @RowCountSupport, @LogCustomValues, @CustomValue_Num_1, @CustomValue_Num_2, @CustomValue_Num_3, @CustomValue_Dt_1, @CustomValue_Dt_2, @CustomValue_Dt_3, @CustomValue_Str_1, @CustomValue_Str_2, @CustomValue_Str_3
END

GO
