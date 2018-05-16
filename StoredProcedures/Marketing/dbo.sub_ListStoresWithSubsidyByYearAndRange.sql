/****** Object:  StoredProcedure [dbo].[sub_ListStoresWithSubsidyByYearAndRange]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_ListStoresWithSubsidyByYearAndRange
(
	@Year int,
	@StartStoreID int,
 	@EndStoreID int 
)
AS
SELECT DISTINCT
	StoreSId
FROM	
	StoreSubsidy
WHERE 
	StoreSubYear = @Year
AND 
	StoreSId BETWEEN @StartStoreID and @EndStoreID



GO
