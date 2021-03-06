/****** Object:  StoredProcedure [bix].[usp_SSISOps_Report_BestPracticesAnalysisItems_59]    Script Date: 5/15/2018 12:11:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Report_BestPracticesAnalysisItems
 * -------------------------------------------------------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 03/14/2013
 * Source : Pragmatic Works - BI xPress Auditing Framework 59
 * Created On : 2/19/2016
 * -------------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [bix].[usp_SSISOps_Report_BestPracticesAnalysisItems_59]
(
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @ItemNameFilter NVARCHAR(2048) = NULL
)
AS
BEGIN
    SET NOCOUNT ON

    SELECT b.[ItemIdentifier], b.[ItemIdentifierAlias], MAX(b.[EvaluatedDateTime]) AS [EvaluatedDateTime]
    FROM [bix].[vw_BestPracticesResults_59] b
    WHERE (ISNULL(@StartDate, 0) = 0 OR b.[EvaluatedDateTime] >= @StartDate) AND
        (ISNULL(@EndDate, 0) = 0 OR b.[EvaluatedDateTime] <= @EndDate) AND
        (ISNULL(@ItemNameFilter, '') = '' OR b.[ItemIdentifierAlias] LIKE '%' + @ItemNameFilter + '%')
    GROUP BY b.[ItemIdentifier], b.[ItemIdentifierAlias]
    ORDER BY [EvaluatedDateTime] DESC
    
    SET NOCOUNT OFF
END

GO
