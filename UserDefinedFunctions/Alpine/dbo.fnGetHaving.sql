/****** Object:  UserDefinedFunction [dbo].[fnGetHaving]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




-- =============================================
-- Author:		Matthew Wear
-- Create date: 8/28/2006
-- 
-- =============================================
CREATE FUNCTION [dbo].[fnGetHaving]
(
	@delinquent int
)
RETURNS varchar(MAX)
AS
BEGIN
	
	if(@delinquent = 1)
	begin
		RETURN ' HAVING	srr.TotalSales is null or
				srr.TotalSales = 0 or
				(srr.FIIDue - SUM(CASE WHEN srct.FullName = ''FII'' THEN srd.Amount ELSE 0 END)) > 0 or
				(srr.NACDue - SUM(CASE WHEN srct.FullName = ''NAC'' THEN srd.Amount ELSE 0 END)) > 0 '
	end

    if(@delinquent = 2)
    begin
	RETURN ' HAVING	(SUM(srr.FIIDue)/count(srd.amount) - SUM(CASE WHEN srct.FullName = ''FII'' THEN srd.Amount ELSE 0 END)) > 0 or
				(SUM(srr.NACDue)/count(srd.amount) - SUM(CASE WHEN srct.FullName = ''NAC'' THEN srd.Amount ELSE 0 END)) > 0 '
    end

	RETURN ' '
END






GO
