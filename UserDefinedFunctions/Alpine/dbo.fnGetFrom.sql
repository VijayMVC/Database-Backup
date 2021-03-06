/****** Object:  UserDefinedFunction [dbo].[fnGetFrom]    Script Date: 5/15/2018 12:14:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




-- =============================================
-- Author:		Matthew Wear
-- Create date: 8/28/2006
-- 
-- =============================================
CREATE FUNCTION [dbo].[fnGetFrom]
(
	@bPayment bit
)
RETURNS varchar(MAX)
AS
BEGIN
	
	if(@bPayment = 1)
	begin
		RETURN ' FROM COR_STORES AS cs INNER JOIN
        SLS_ROYALTY_PERIOD AS srp ON cs.StoreID = srp.StoreID INNER JOIN
        SLS_ROYALTY_REPORT AS srr ON srp.RoyaltyPeriodID = srr.RoyaltyPeriodID INNER JOIN
        SLS_ROYALTY_ALLOCATION AS sra ON srr.RoyaltyReportID = sra.RoyaltyReportID INNER JOIN
        SLS_ROYALTY_DISTRIBUTION AS srd ON srp.RoyaltyPeriodID = srd.RoyaltyPeriodID INNER JOIN
        SLS_ROYALTY_PAYMENT AS srpa ON srd.RoyaltyPaymentID = srpa.RoyaltyPaymentID INNER JOIN --change this to inner join after insertion
		SLS_ROYALTY_COMPANY_TYPES AS srct ON srd.RoyaltyCompanyType = srct.RoyaltyCompanyType INNER JOIN
		COR_STORES_ADDRESSES_LINK AS cral on cs.storeid = cral.storeid inner join
		COR_ADDRESSES ca on cral.addressid = ca.addressid inner join
		COR_POLITICAL_DIVISION cpd on ca.politicaldivisionid = cpd.politicaldivisionid inner join
		COR_COUNTRIES cc on cpd.Countryid = cc.countryid inner join
		COR_INTERNATIONAL_REGIONS cr on cc.internationalregionid = cr.internationalregionid '
	end
	
	RETURN ' FROM COR_STORES AS cs INNER JOIN
        SLS_ROYALTY_PERIOD AS srp ON cs.StoreID = srp.StoreID INNER JOIN
        SLS_ROYALTY_REPORT AS srr ON srp.RoyaltyPeriodID = srr.RoyaltyPeriodID INNER JOIN
        SLS_ROYALTY_ALLOCATION AS sra ON srr.RoyaltyReportID = sra.RoyaltyReportID INNER JOIN
        COR_STORES_ADDRESSES_LINK AS cral on cs.storeid = cral.storeid inner join
		COR_ADDRESSES ca on cral.addressid = ca.addressid inner join
		COR_POLITICAL_DIVISION cpd on ca.politicaldivisionid = cpd.politicaldivisionid inner join
		COR_COUNTRIES cc on cpd.Countryid = cc.countryid inner join
		COR_INTERNATIONAL_REGIONS cr on cc.internationalregionid = cr.internationalregionid '
END






GO
