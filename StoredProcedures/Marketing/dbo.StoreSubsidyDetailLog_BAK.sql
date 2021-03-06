/****** Object:  StoredProcedure [dbo].[StoreSubsidyDetailLog_BAK]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

Create  PROCEDURE dbo.StoreSubsidyDetailLog_BAK
(
	@StoreId		int,
	@CalYear		int,
	@SubHId		int
)
AS
SET NOCOUNT ON
CREATE TABLE #tmpSubDtlLog(StoreId INT, CalYear INT, SubHId INT, OrdHId INT, 
		OrdHType INT, OrdHPrdType INT, OrdHDesc VARCHAR(255), OrdHDate CHAR(10), OrdHAmount FLOAT,
		SubLAmount REAL, MatGHName VARCHAR(50), MatName VARCHAR(50))
			
INSERT INTO #tmpSubDtlLog(StoreId, CalYear, SubHId, OrdHId, 
		OrdHType, OrdHPrdType, OrdHDesc, OrdHDate, OrdHAmount,
		SubLAmount, MatGHName, MatName)
SELECT sl.SubLStoreId, sl.SubLYear, sl.SubLHId, sl.SubLOrdHId, oh.OrdHType, oh.OrdHPrdType, oh.OrdHDesc,
		CONVERT(char(10),oh.OrdHDate,101) AS OrdHDate, oh.OrdHAmount, sl.SubLAmount, mgh.MatGHName, m.MatName
	FROM SubsidyLog sl
	INNER JOIN OrderHdr oh ON (oh.OrdHId = sl.SubLOrdHId)
	INNER JOIN OrderDtl od ON (od.OrdDId = sl.SubLOrdDId)
	LEFT OUTER JOIN MaterialGroupsHdr mgh ON (mgh.MatGHId = od.OrdDPrdGId)
	LEFT OUTER JOIN Material m ON (m.MatId = od.OrdDPrdId)
	WHERE sl.SubLStoreId = @StoreId AND sl.SubLYear = @CalYear AND sl.SubLHId = @SubHId
SELECT StoreId, CalYear, SubHId, OrdHId, OrdHDate, OrdHAmount, SubLAmount,
	OrdPrdDescription = 
		CASE OrdHType
			WHEN 1 THEN 
				CASE
					WHEN OrdHPrdType < 3 THEN CONVERT(VARCHAR(255), MatName)
					ELSE CONVERT(VARCHAR(255), MatGHName)
				END
			WHEN 2 THEN CONVERT(VARCHAR(255), OrdHDesc)
		END
FROM #tmpSubDtlLog
DROP TABLE #tmpSubDtlLog
;


GO
