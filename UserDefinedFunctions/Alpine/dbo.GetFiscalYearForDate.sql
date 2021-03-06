/****** Object:  UserDefinedFunction [dbo].[GetFiscalYearForDate]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetFiscalYearForDate]
(
	-- Add the parameters for the function here
	@Date smalldatetime,
	@StoreID bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @returnDate int

	-- Add the T-SQL statements to compute the return value here
	SELECT @returnDate = FiscalYear
		from SLS_Royalty_period
			where startdate <= @Date and @Date <= enddate
				and storeid=@storeid

	-- Return the result of the function
	RETURN @returnDate

END


GO
