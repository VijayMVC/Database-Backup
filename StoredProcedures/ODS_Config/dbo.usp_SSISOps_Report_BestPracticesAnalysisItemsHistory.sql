/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_BestPracticesAnalysisItemsHistory]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Report_BestPracticesAnalysisItemsHistory
 * -------------------------------------------------------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 03/14/2013
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * -------------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_BestPracticesAnalysisItemsHistory]
(
    @ItemIdentifier NVARCHAR(2048) = NULL,
    @ItemIdentifierAlias NVARCHAR(2048) = NULL,
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @NumberOfHistories INT = 10,
    @IsIncludeErrors BIT = 1,
    @IsIncludePerformance BIT = 1,
    @IsIncludeWarnings BIT = 1,
    @IsIncludeInformational BIT = 1,
    @IsIncludeSuccess BIT = 1
)
AS
BEGIN
    SET NOCOUNT ON
    SET FMTONLY OFF

    DECLARE @EmptyGuid UNIQUEIDENTIFIER
    DECLARE @IsIncludeAll BIT

    IF ISNULL(@NumberOfHistories, 0) = 0 OR @NumberOfHistories < 1
    BEGIN
        SET @NumberOfHistories = 10
    END 

    IF ISNULL(@IsIncludeErrors, 1) = 1
    BEGIN
        SET @IsIncludeErrors = 1
    END

    IF ISNULL(@IsIncludePerformance, 1) = 1
    BEGIN
        SET @IsIncludePerformance = 1
    END

    IF ISNULL(@IsIncludeWarnings, 1) = 1
    BEGIN
        SET @IsIncludeWarnings = 1
    END

    IF ISNULL(@IsIncludeInformational, 1) = 1
    BEGIN
        SET @IsIncludeInformational = 1
    END

    IF ISNULL(@IsIncludeSuccess, 1) = 1
    BEGIN
        SET @IsIncludeSuccess = 1
    END

    SET @EmptyGuid = '00000000-0000-0000-0000-000000000000'

    IF @IsIncludeErrors = 1 AND @IsIncludePerformance = 1 AND @IsIncludeWarnings = 1 AND @IsIncludeInformational = 1 AND @IsIncludeSuccess = 1 
    BEGIN
        SET @IsIncludeAll = 1
    END
    ELSE
    BEGIN
        SET @IsIncludeAll = 0
    END;

    WITH [Histories] AS
    (
        SELECT ROW_NUMBER() OVER (ORDER BY i.[LatestEvaluatedDateTime] ASC) AS [EvaluationIterationNumber],
            i.[EvaluationId],
            i.[LatestEvaluatedDateTime],
            i.[ErrorCount],
            i.[PerformanceCount],
            i.[WarningCount],
            i.[InformationalCount],
            i.[SuccessCount]
        FROM (
                SELECT b.[EvaluationId],
                       MAX(b.[EvaluatedDateTime]) AS [LatestEvaluatedDateTime],
                       SUM(CASE r.[RuleSeverity] WHEN 100 THEN 1 ELSE 0 END) AS [ErrorCount],
                       SUM(CASE r.[RuleSeverity] WHEN 80 THEN 1 ELSE 0 END) AS [PerformanceCount],
                       SUM(CASE r.[RuleSeverity] WHEN 60 THEN 1 ELSE 0 END) AS [WarningCount],
                       SUM(CASE r.[RuleSeverity] WHEN 30 THEN 1 ELSE 0 END) AS [InformationalCount],
                       SUM(CASE r.[RuleSeverity] WHEN 10 THEN 1 ELSE 0 END) AS [SuccessCount]
                FROM [dbo].[BestPracticesResults] b
                INNER JOIN [dbo].[BestPracticesRules] r ON b.[RuleId] = r.[RuleId]
                WHERE b.[ItemIdentifier] = @ItemIdentifier AND
                      (ISNULL(@ItemIdentifierAlias, '') = '' OR b.[ItemIdentifierAlias] = @ItemIdentifierAlias) AND
                    (ISNULL(@StartDate, 0) = 0 OR b.[EvaluatedDateTime] >= @StartDate) AND
                    (ISNULL(@EndDate, 0) = 0 OR b.[EvaluatedDateTime] <= @EndDate) AND
                    (@IsIncludeAll = 1 OR
                        (
                            (@IsIncludeErrors = 1 AND r.[RuleSeverity] = 100) OR
                            (@IsIncludePerformance = 1 AND r.[RuleSeverity] = 80) OR
                            (@IsIncludeWarnings = 1 AND r.[RuleSeverity] = 60) OR
                            (@IsIncludeInformational = 1 AND r.[RuleSeverity] = 30) OR
                            (@IsIncludeSuccess = 1 AND r.[RuleId] = @EmptyGuid)
                        )
                    )
                GROUP BY b.[EvaluationId]
             ) i
    )

    SELECT o.[EvaluationIterationNumber],
           o.[EvaluationId],
           o.[LatestEvaluatedDateTime],
           o.[ErrorCount],
           o.[PerformanceCount],
           o.[WarningCount],
           o.[InformationalCount],
           o.[SuccessCount]
    FROM (
            SELECT TOP(@NumberOfHistories)
                   h.[EvaluationIterationNumber],
                   h.[EvaluationId],
                   h.[LatestEvaluatedDateTime],
                   h.[ErrorCount],
                   h.[PerformanceCount],
                   h.[WarningCount],
                   h.[InformationalCount],
                   h.[SuccessCount]
            FROM [Histories] h
            ORDER BY h.[EvaluationIterationNumber] DESC
         ) o
    ORDER BY o.[EvaluationIterationNumber] ASC

    SET NOCOUNT OFF
END

GO
