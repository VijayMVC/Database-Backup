/****** Object:  StoredProcedure [dbo].[sub_SubsidiesByCountry]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sub_SubsidiesByCountry
(
	@HMrktCountry int
)
AS

SELECT 
	subhid, 
	subHdesc 
FROM 
	subsidyHdr
WHERE
	 SubHMrktCountry  =@HMrktCountry
GO
