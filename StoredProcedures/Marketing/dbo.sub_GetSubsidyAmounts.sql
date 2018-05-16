/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyAmounts]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyAmounts
(
	@SDID int
)
 AS
SELECT 
	SubDUptoAmount,
	SubDAmount,
	SubDDesc
	FROM
	 subsidyDtl
WHERE
	 subdid = @SDID



GO
