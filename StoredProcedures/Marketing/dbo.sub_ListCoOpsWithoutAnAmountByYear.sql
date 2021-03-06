/****** Object:  StoredProcedure [dbo].[sub_ListCoOpsWithoutAnAmountByYear]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_ListCoOpsWithoutAnAmountByYear
(
	@year int
)
 AS
SELECT 
	CoOpID, 
	CoOpName 
FROM
	CoOps 
WHERE
	CoOpID 
NOT IN
	 (
		SELECT 
			CoOpID 
		FROM	
			CoOpAmounts 
		WHERE 
			year = @year
	)
ORDER BY CoOpName



GO
