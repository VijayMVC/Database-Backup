/****** Object:  StoredProcedure [dbo].[sub_RegisterStoresToSubsidiesByYear]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




/* 
	Fastsigns International Inc. 2004
	Created 10/05/2004
	
	This store procedure will register a store to all subsidy that exists in the subsidy header by country.
*/
CREATE PROCEDURE sub_RegisterStoresToSubsidiesByYear 
(
	@year int,
	@webnumber int,
	@countryCode int
)
AS
-- Insert all existing subsidy. 
INSERT INTO StoreSubsidy
(
	StoreSID,
	StoreSubYear,
	StoreSubHId,
	StoreSubType,
	StoreSubStartingAmount,
	StoreSubRemainingAmount
)
SELECT 
	@webnumber,
	@year,
	A.SubHID,
	A.SubHType,
	B.SubDAmount,
	B.SubDAmount
FROM
	SubsidyHdr A
INNER JOIN
	SubsidyDtl B
ON
	A.subHId = B.subHID
WHERE
	A.SubHMrktCountry = @countryCode
AND
	B.SubDCalanderYear = @year
RETURN @@ROWCOUNT



GO
