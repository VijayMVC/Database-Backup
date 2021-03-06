/****** Object:  StoredProcedure [dbo].[sub_ListSubsidiesByStoreAndYear]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_ListSubsidiesByStoreAndYear
(
	@Year int,
	@Webnumber int
)
AS
SELECT 
	A.StoreSId,
	A.StoreSubYear,
	A.StoreSubType,
	A.StoreSubStartingAmount,
	A.StoreSubRemainingAmount,
	B.SubHId,
	B.SubDCalanderYear,
	B.SubDDesc,
	B.SubDUptoAmount,
	B.SubDAmount
FROM
	StoreSubsidy A
INNER JOIN
	SubsidyDtl B
ON
	A.StoreSubHid = B.SubHid 
AND
	 A.StoreSubYear = B.SubDCalanderYear
WHERE
	A.StoreSubYear = @year
AND
	A.StoreSId = @WebNumber



GO
