/****** Object:  UserDefinedFunction [dbo].[getRejectedTotals]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getRejectedTotals]
(
	-- Add the parameters for the function here
	@Franchise varchar(32)
)
RETURNS  money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Total MONEY
SELECT @Total = SUM(amount_due) FROM job_line_item_report_view jliv
 WHERE franchise_id=@Franchise
 and
 phase_id = 'b368fef7f99e21ee4bba6760a0d92349'
GROUP BY jliv.franchise_id
	RETURN @total

END

GO
