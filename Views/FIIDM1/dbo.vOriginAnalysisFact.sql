/****** Object:  View [dbo].[vOriginAnalysisFact]    Script Date: 5/15/2018 12:13:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vOriginAnalysisFact]
AS
SELECT	O.RawOriginName
	,	O.Origin

	,	CASE WHEN OD1.OriginKey IS NOT NULL THEN OrderCount ELSE 0 END	AS RawMatch_OrderCount
	,	CASE WHEN OD1.OriginKey IS NOT NULL THEN OrderAmt ELSE 0 END		AS RawMatch_OrderAmt
--	,	CASE WHEN OD1.OriginKey IS NOT NULL THEN CustomerCount ELSE 0 END	AS RawMatch_CustomerCount

	,	CASE WHEN OD1.OriginKey IS NULL THEN OrderCount ELSE 0 END		AS RawNoMatch_OrderCount
	,	CASE WHEN OD1.OriginKey IS NULL THEN OrderAmt ELSE 0 END			AS RawNoMatch_OrderAmt
--	,	CASE WHEN OD1.OriginKey IS NULL THEN CustomerCount ELSE 0 END		AS RawNoMatch_CustomerCount

--	,	CASE WHEN OD2.OriginKey IS NOT NULL THEN OrderCount ELSE 0 END	AS ItMatch_OrderCount
--	,	CASE WHEN OD2.OriginKey IS NOT NULL THEN OrderAmt ELSE 0 END		AS ItMatch_OrderAmt
--	,	CASE WHEN OD2.OriginKey IS NOT NULL THEN CustomerCount ELSE 0 END	AS ItMatch_CustomerCount

--	,	CASE WHEN OD2.OriginKey IS NULL THEN OrderCount ELSE 0 END		AS ItNoMatch_OrderCount
--	,	CASE WHEN OD2.OriginKey IS NULL THEN OrderAmt ELSE 0 END			AS ItNoMatch_OrderAmt
--	,	CASE WHEN OD2.OriginKey IS NULL THEN CustomerCount ELSE 0 END		AS ItNoMatch_CustomerCount

	,	O.OrderCount
	,	O.OrderAmt
--	,	O.CustomerCount

	FROM (SELECT	O.RawOriginName
			,	O.Origin

			,	COALESCE(OrderCount,0)		AS OrderCount
			,	COALESCE(OrderAmt,0.0)		AS OrderAmt
--			,	COALESCE(CustomerCount,0)	AS CustomerCount

			FROM (SELECT DISTINCT T_CustomerTypeRaw AS RawOriginName, T_CustomerType AS Origin FROM dbo.CustomerDim) AS O
				LEFT JOIN (SELECT T_CustomerTypeRaw, T_CustomerType, COUNT(*) AS OrderCount, SUM(SalesAmt) AS OrderAmt
						FROM OrderFact O JOIN CustomerDim C ON O.CustomerKey = C.CustomerKey
						GROUP BY T_CustomerTypeRaw, T_CustomerType
					) AS [IO] ON UPPER([IO].T_CustomerTypeRaw) = UPPER(O.RawOriginName)
--				LEFT JOIN (SELECT T_CustomerTypeRaw, T_CustomerType, COUNT(*) AS CustomerCount
--						FROM CustomerDim C
--						GROUP BY T_CustomerTypeRaw, T_CustomerType
--					) AS IC ON UPPER([IC].T_CustomerTypeRaw) = UPPER(O.RawOriginName)
		) AS O
		LEFT JOIN CustomerOriginDim OD1 ON UPPER(OD1.OriginName) = UPPER(O.RawOriginName)
--		LEFT JOIN CustomerOriginDim OD2 ON UPPER(OD2.OriginName) = UPPER(O.Origin)

		--	WHERE OD1.IndustryName <> 'UNKNOWN' AND OD2.IndustryName <> 'UNKNOWN'
GO
