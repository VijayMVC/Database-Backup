/****** Object:  StoredProcedure [dbo].[usp_SSISOps_Report_BestPracticesAnalysisItems]    Script Date: 5/15/2018 12:11:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: usp_SSISOps_Report_BestPracticesAnalysisItems
 * -------------------------------------------------------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 03/14/2013
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * -------------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[usp_SSISOps_Report_BestPracticesAnalysisItems]
(
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL,
    @ItemNameFilter NVARCHAR(2048) = NULL
)
AS
BEGIN
    SET NOCOUNT ON

    SELECT b.[ItemIdentifier], b.[ItemIdentifierAlias], MAX(b.[EvaluatedDateTime]) AS [EvaluatedDateTime]
    FROM [dbo].[BestPracticesResults] b
    WHERE (ISNULL(@StartDate, 0) = 0 OR b.[EvaluatedDateTime] >= @StartDate) AND
        (ISNULL(@EndDate, 0) = 0 OR b.[EvaluatedDateTime] <= @EndDate) AND
        (ISNULL(@ItemNameFilter, '') = '' OR b.[ItemIdentifierAlias] LIKE '%' + @ItemNameFilter + '%')
    GROUP BY b.[ItemIdentifier], b.[ItemIdentifierAlias]
    ORDER BY [EvaluatedDateTime] DESC
    
    SET NOCOUNT OFF
END

GO
