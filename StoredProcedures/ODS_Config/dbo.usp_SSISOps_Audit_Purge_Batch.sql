/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Audit_Purge_Batch]    Script Date: 5/15/2018 12:11:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
Source : Pragmatic Works - BI xPress Auditing Framework 53
Created On : 7/2/2014
Purpose : 
    - Purge audit records from various tables in batches. Purge records based on Days, MachineName, Package or ExecutionID
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Audit_Purge_Batch]
(
    @PackageName NVARCHAR(255) = '%',
    @ExecutionID VARCHAR(255) = NULL,
    @MachineName NVARCHAR(255) = '%',
    @DaysToKeep INT = 180,
    @BatchIntervalDays INT = 30,
    @DaysToStart INT = 1800
)
AS 
BEGIN
    DECLARE @CurrentDay INT
    DECLARE @IsLoopEntered BIT
    DECLARE @DeltaDays INT
    
    SET @CurrentDay = @DaysToStart
    SET @IsLoopEntered = 0

    WHILE @CurrentDay > @DaysToKeep
    BEGIN
        EXECUTE [usp_SSISOps_Audit_Purge_Records] @PackageName, @ExecutionID, @MachineName, @CurrentDay

        SET @DeltaDays = @CurrentDay - @BatchIntervalDays

        IF (@DeltaDays < @DaysToKeep)
        BEGIN
            SET @CurrentDay = @DaysToKeep
        END
        ELSE
        BEGIN
            SET @CurrentDay = @DeltaDays
        END

        SET @IsLoopEntered = 1
    END

    IF (@IsLoopEntered = 0 OR (@IsLoopEntered = 1 AND @CurrentDay >= @DaysToKeep))
    BEGIN
        EXECUTE [usp_SSISOps_Audit_Purge_Records] @PackageName, @ExecutionID, @MachineName, @DaysToKeep
    END
END

GO
