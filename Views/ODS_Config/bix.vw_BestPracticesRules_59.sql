/****** Object:  View [bix].[vw_BestPracticesRules_59]    Script Date: 5/15/2018 12:14:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [bix].[vw_BestPracticesRules_59]
AS
(
    SELECT 
        [RuleId],
        [RuleName],
        [ViolationMessage],
        [Recommendation],
        [RuleSeverity],
        [ReferenceUri],
        [IsEnabled],
        [PathEvaluator],
        [Author],
        [DateCreated],
        [AppliesTo],
        [ObjectTypeFilters],
        [PropertyNameFilters]
    FROM [dbo].[BestPracticesRules]
)
GO
