/****** Object:  StoredProcedure [dbo].[sub_GetSubsidyTypesCountry]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidyTypesCountry
(
	@SubHMrktCountry int
)
AS
SELECT SubHDesc, SubHID FROM SubsidyHdr
WHERE SubHMrktCountry = @SubHMrktCountry
GROUP BY SubHDesc, SubHID



GO
