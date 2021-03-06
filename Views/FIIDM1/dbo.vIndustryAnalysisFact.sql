/****** Object:  View [dbo].[vIndustryAnalysisFact]    Script Date: 5/15/2018 12:13:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vIndustryAnalysisFact]
AS
SELECT	I.RawIndustryName
	,	I.Industry

	,	CASE WHEN ID1.IndustryKey IS NOT NULL THEN OrderCount ELSE 0 END	AS RawMatch_OrderCount
	,	CASE WHEN ID1.IndustryKey IS NOT NULL THEN OrderAmt ELSE 0 END		AS RawMatch_OrderAmt
	,	CASE WHEN ID1.IndustryKey IS NOT NULL THEN CustomerCount ELSE 0 END	AS RawMatch_CustomerCount

	,	CASE WHEN ID1.IndustryKey IS NULL THEN OrderCount ELSE 0 END		AS RawNoMatch_OrderCount
	,	CASE WHEN ID1.IndustryKey IS NULL THEN OrderAmt ELSE 0 END			AS RawNoMatch_OrderAmt
	,	CASE WHEN ID1.IndustryKey IS NULL THEN CustomerCount ELSE 0 END		AS RawNoMatch_CustomerCount

	,	CASE WHEN ID2.IndustryKey IS NOT NULL THEN OrderCount ELSE 0 END	AS ItMatch_OrderCount
	,	CASE WHEN ID2.IndustryKey IS NOT NULL THEN OrderAmt ELSE 0 END		AS ItMatch_OrderAmt
	,	CASE WHEN ID2.IndustryKey IS NOT NULL THEN CustomerCount ELSE 0 END	AS ItMatch_CustomerCount

	,	CASE WHEN ID2.IndustryKey IS NULL THEN OrderCount ELSE 0 END		AS ItNoMatch_OrderCount
	,	CASE WHEN ID2.IndustryKey IS NULL THEN OrderAmt ELSE 0 END			AS ItNoMatch_OrderAmt
	,	CASE WHEN ID2.IndustryKey IS NULL THEN CustomerCount ELSE 0 END		AS ItNoMatch_CustomerCount

	,	I.OrderCount
	,	I.OrderAmt
	,	I.CustomerCount

	FROM (SELECT	I.RawIndustryName
			,	I.Industry

			,	COALESCE(OrderCount,0)	AS OrderCount
			,	COALESCE(OrderAmt,0.0)	AS OrderAmt
			,	COALESCE(CustomerCount,0)	AS CustomerCount

			FROM (SELECT DISTINCT T_IndustryTypeRaw AS RawIndustryName, T_IndustryType AS Industry FROM dbo.CustomerDim) AS I
				LEFT JOIN (SELECT T_IndustryTypeRaw, T_IndustryType, COUNT(*) AS OrderCount, SUM(SalesAmt) AS OrderAmt
						FROM OrderFact O JOIN CustomerDim C ON O.CustomerKey = C.CustomerKey
						GROUP BY T_IndustryTypeRaw, T_IndustryType
					) AS [IO] ON UPPER([IO].T_IndustryTypeRaw) = UPPER(I.RawIndustryName)
				LEFT JOIN (SELECT T_IndustryTypeRaw, T_IndustryType, COUNT(*) AS CustomerCount
						FROM CustomerDim C
						GROUP BY T_IndustryTypeRaw, T_IndustryType
					) AS IC ON UPPER([IC].T_IndustryTypeRaw) = UPPER(I.RawIndustryName)
		) AS I
		LEFT JOIN CustomerIndustryDim ID1 ON UPPER(ID1.IndustryName) = UPPER(I.RawIndustryName)
		LEFT JOIN CustomerIndustryDim ID2 ON UPPER(ID2.IndustryName) = UPPER(I.Industry)

		--	WHERE ID1.IndustryName <> 'UNKNOWN' AND ID2.IndustryName <> 'UNKNOWN'
GO
