/****** Object:  UserDefinedFunction [dbo].[fnGetGroup]    Script Date: 5/15/2018 12:14:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:		Matthew Wear
-- Create date: 8/28/2006
-- 
-- =============================================
CREATE FUNCTION [dbo].[fnGetGroup]()
RETURNS varchar(MAX)
AS
BEGIN
	RETURN ' GROUP BY srp.royaltyperiodid,
			cs.StoreNumber, 
			srp.EndDate, 
			srr.ReportNumber, 
			srr.TotalSales, 
			srr.FIIDue, 
			srr.NACDue '
END


GO
