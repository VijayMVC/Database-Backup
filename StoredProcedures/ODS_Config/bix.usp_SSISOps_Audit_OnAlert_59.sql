/****** Object:  StoredProcedure [bix].[usp_SSISOps_Audit_OnAlert_59]    Script Date: 5/15/2018 12:11:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
Source : Pragmatic Works - BI xPress Auditing Framework 59
Created On : 2/19/2016
Purpose : 
    - Called from OnError, OnWarning Event Handler.
    - Logs Error/Warning Message and Increments Error/Warning Counters at Package/Task Level.
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Audit_OnAlert_59]
    @Scope VARCHAR(10), -- Package or Task
    @EventType VARCHAR(10), -- W or E [W=Warning, E=Error]
    @ExecutionID VARCHAR(50),
    @MessageCode VARCHAR(50) = NULL,
    @MessageDescription VARCHAR(8000) = NULL,
    @SourceID VARCHAR(50),
    @SourceName VARCHAR(255) = NULL,
    @SourceType VARCHAR(255) = NULL,
    @CustomValue_Num_1 NVARCHAR(255) = NULL,
    @CustomValue_Num_2 NVARCHAR(255) = NULL,
    @CustomValue_Num_3 NVARCHAR(255) = NULL,
    @CustomValue_Dt_1 DATETIME = NULL,
    @CustomValue_Dt_2 DATETIME = NULL,
    @CustomValue_Dt_3 DATETIME = NULL,
    @CustomValue_Str_1 NVARCHAR(255) = NULL,
    @CustomValue_Str_2 NVARCHAR(255) = NULL,
    @CustomValue_Str_3 NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
    
    IF EXISTS(
        SELECT 1 
        FROM [bix].[vw_SSISPackageAlertList_59] a
        WHERE a.[FilterThisAlert] = 1
            AND (
                (a.[CompareAction] = 'CODE' AND a.[AlertCode] = @MessageCode)
                OR
                (a.[CompareAction] = 'KEYWORD' AND CHARINDEX(a.[AlertKeywords], @MessageDescription) > 0)
            )
    )	
    BEGIN
        RETURN
    END

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

    DECLARE @CurrentDate DATETIME 
    
    SET @CurrentDate = GETDATE()

    INSERT INTO [bix].[vw_SSISTaskExecutionAlerts_59] ([EventType], [ExecutionID], [LogDate], [MessageCode], [MessageDescription], [SourceID], [SourceName], [SourceType])
    VALUES (@EventType, @ExecutionID, @CurrentDate, @MessageCode, @MessageDescription, @SourceID, @SourceName, @SourceType)

    IF @EventType = 'W'
    BEGIN
        UPDATE [bix].[vw_SSISPackageExecutionLog_59] 
        SET [TotalWarningCount] = ISNULL([TotalWarningCount], 0) + 1  
        WHERE [ExecutionID] = @ExecutionID
    END

    IF @EventType = 'E'
    BEGIN
        IF EXISTS(SELECT 1 FROM [bix].[vw_SSISPackageExecutionLog_59] e WHERE e.[ExecutionID] = @ExecutionID)
        BEGIN
            UPDATE [bix].[vw_SSISPackageExecutionLog_59] 
            SET [TotalErrorCount] = ISNULL([TotalErrorCount], 0) + 1  
            WHERE [ExecutionID] = @ExecutionID
        END
        ELSE
        BEGIN
            DECLARE @mc VARCHAR(255)
            SET @mc = HOST_NAME()				
            
            EXEC [bix].[usp_SSISOps_Audit_OnPreExecute_59] @Scope = @Scope, @ExecutionID = @ExecutionID, @SourceID = @SourceID, @SourceName = @SourceName, @InteractiveMode = 0, @LogCustomValues = 0, @MachineName = @mc

            UPDATE [bix].[vw_SSISPackageExecutionLog_59]
            SET [TotalErrorCount] = ISNULL([TotalErrorCount], 0) + 1  
            WHERE [ExecutionID] = @ExecutionID
        END
    END

    IF @Scope = 'Task' AND @EventType = 'W'
    BEGIN
        UPDATE [bix].[vw_SSISTaskExecutionLog_59]
        SET [TotalWarningCount]= ISNULL([TotalWarningCount],0) + 1  
        WHERE [ExecutionID] = @ExecutionID AND [SourceID] = @SourceID
    END
        
    IF @Scope = 'Task' AND @EventType = 'E'
    BEGIN
        UPDATE [bix].[vw_SSISTaskExecutionLog_59]
        SET [TotalErrorCount] = ISNULL([TotalErrorCount], 0) + 1  
        WHERE [ExecutionID] = @ExecutionID AND [SourceID] = @SourceID
    END

    /* Custom Code Execution */
    EXEC [dbo].[usp_SSISOps_Audit_OnAlert_CustomCode] @Scope, @EventType, @ExecutionID, @MessageCode, @MessageDescription, @SourceID, @SourceName, @SourceType, @CustomValue_Num_1, @CustomValue_Num_2, @CustomValue_Num_3, @CustomValue_Dt_1, @CustomValue_Dt_2, @CustomValue_Dt_3, @CustomValue_Str_1, @CustomValue_Str_2, @CustomValue_Str_3
END

GO
