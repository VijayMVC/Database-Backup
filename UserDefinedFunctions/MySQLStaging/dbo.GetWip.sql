/****** Object:  UserDefinedFunction [dbo].[GetWip]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetWip]
(
	-- Add the parameters for the function here
	@Franchise varchar(32)
)
RETURNS  money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Total MONEY
SELECT TOP 1 @Total = SUM(amount_due) FROM job_line_item_report_view jliv
 WHERE franchise_id=@Franchise
 and
 phase_id not in ('0b52f405f1deecff6d4db236d53432e6','c46653c8d3896d54367940f57f6228ec', 'b368fef7f99e21ee4bba6760a0d92349', '6ee5678482523016a8a72d0e4994c4fe','cac5d3c7deb39c6219eea443be344de2' )
GROUP BY jliv.franchise_id
	RETURN @total

END

GO
