/****** Object:  UserDefinedFunction [dbo].[GetStoreInternationalRegion]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetStoreInternationalRegion] 
(
	@StoreID bigint
)
RETURNS varchar(101)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @region varchar(101)

	-- Add the T-SQL statements to compute the return value here
	select top 1 @region=cr.FullName 
	From COR_INTERNATIONAL_REGIONS cr
	Inner Join COR_COUNTRIES c
		on c.InternationalRegionID=cr.InternationalRegionID
	Inner Join COR_Political_division pd
		on c.CountryID = pd.CountryID
	Inner Join COR_ADDRESSES a
		on a.politicaldivisionid=pd.politicaldivisionid
	inner join COR_STORES_ADDRESSES_LINK al
		on a.addressid=al.addressid
	Where al.storeid=@StoreID

	-- Return the result of the function
	RETURN @region

END


GO
