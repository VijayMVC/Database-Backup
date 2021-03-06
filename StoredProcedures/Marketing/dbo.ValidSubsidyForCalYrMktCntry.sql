/****** Object:  StoredProcedure [dbo].[ValidSubsidyForCalYrMktCntry]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.ValidSubsidyForCalYrMktCntry
(
	@CalYr		int,
	@MktgCountry	int
)
AS
	SELECT sh.SubHId, sh.SubHDesc, sh.SubHType, sh.SubHMrktCountry, sd.SubDCalanderYear, SubDDesc, SubDAmount
	FROM SubsidyDtl sd
	INNER JOIN SubsidyHdr sh ON (sh.SubHId = sd.SubHId)
	WHERE SubHDisable = 'N' AND (SubHType = 1 OR SubHType = 2)
	AND SubHMrktCountry = @MktgCountry AND SubDCalanderYear = @CalYr
	ORDER BY sh.SubHType
;


GO
