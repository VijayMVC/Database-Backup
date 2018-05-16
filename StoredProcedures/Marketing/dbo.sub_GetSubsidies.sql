/****** Object:  StoredProcedure [dbo].[sub_GetSubsidies]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetSubsidies
(
	@YearSelect int
)
AS
SELECT H.SubHType, H.SubHDesc, H.SubHID, D.SubDID, D.SubDDesc
FROM SubsidyDtl D INNER JOIN SubsidyHdr H ON D.SubHID = H.SubHID
WHERE SubDCalanderYear = @YearSelect



GO
