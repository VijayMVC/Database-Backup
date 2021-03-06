/****** Object:  UserDefinedFunction [dbo].[GetStoreSalesRegion]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Mark Zuerker
-- Create date: 12/18/2007
-- Description:	Returns the Sales Region for a given store number
-- =============================================
CREATE FUNCTION [dbo].[GetStoreSalesRegion] 
(
	-- Add the parameters for the function here
	@StoreNumber int
)
RETURNS varchar(128)
AS
BEGIN
	Declare @Result varchar(128)
	select @Result=csr.FullName
		from  cor_stores cs
		inner join cor_stores_addresses_link csal
			on cs.StoreID=csal.storeid
		inner join cor_addresses ca
			on csal.addressID=ca.addressid
		inner join cor_political_division cpd
			on ca.politicaldivisionid = cpd.politicaldivisionid
		inner join alpine.dbo.cor_sales_regions csr
			on cpd.salesregionId=csr.salesregionid
	where cs.storeNumber = @StoreNumber
	Return @Result
END


GO
