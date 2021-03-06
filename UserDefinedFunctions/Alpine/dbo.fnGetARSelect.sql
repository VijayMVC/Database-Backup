/****** Object:  UserDefinedFunction [dbo].[fnGetARSelect]    Script Date: 5/15/2018 12:14:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON








-- =============================================
-- Author:		Matthew Wear
-- Create date: 8/28/2006
-- 
-- =============================================
CREATE FUNCTION [dbo].[fnGetARSelect] 
(
	@Agg int
)
RETURNS varchar(MAX)
AS
BEGIN
	DECLARE @select varchar(MAX)

	if(@Agg = 1)
	begin
		set @select = ''
	end

	if(@Agg = 0)
	begin
		set @select = ' SELECT srp.royaltyperiodid,
		cs.StoreNumber as STORE, 
		
		(select top 1 FirstName 
         from cor_stores_persons_link cs2
         inner join cor_stores css on cs2.StoreId = css.StoreId 
         inner join cor_persons cp on cs2.PersonID = cp.PersonID 
         where css.StoreNumber = cs.StoreNumber
		and cp.PersonType = 2001) as FirstName,
		
		(select top 1 LastName 
         from cor_stores_persons_link cs2
         inner join cor_stores css on cs2.StoreId = css.StoreId 
         inner join cor_persons cp on cs2.PersonID = cp.PersonID 
         where css.StoreNumber = cs.StoreNumber
		and cp.PersonType = 2001) as LastName,
		
		srp.EndDate  as DATE, 
		srr.ReportNumber as REP, 
		srr.TotalSales as ACTUAL, 
		
		SUM(CASE WHEN sra.RoyaltyAllocationType = 2 THEN (sra.AllocationAmount*sra.FIIPercent) ELSE 0 END)/count(srd.amount) AS FIIROYALTY,
		SUM(CASE 
			WHEN sra.RoyaltyAllocationType != 2 
				THEN 
					CASE 
					WHEN (sra.NACPercent != 0 or sra.FIIPercent != 0) 
						THEN (sra.AllocationAmount*sra.FIIPercent)
						ELSE sra.FIIAmount 
					END
				ELSE 0 
			END)/count(srd.amount) AS FIIREDUCTION,
		srr.FIIDue as FIIDUE,		
		SUM(CASE WHEN srct.FullName = ''FII'' THEN srd.Amount ELSE 0 END) AS FIIPAID,
		srr.FIIDue - SUM(CASE WHEN srct.FullName = ''FII'' THEN srd.Amount ELSE 0 END) AS FIIBALANCE,
				
		SUM(CASE WHEN sra.RoyaltyAllocationType = 2 THEN (sra.AllocationAmount*sra.NACPercent) ELSE 0 END)/count(srd.amount) AS NACROYALTY,
		SUM(CASE 
			WHEN sra.RoyaltyAllocationType != 2 
				THEN 
					CASE 
					WHEN (sra.NACPercent != 0 or sra.FIIPercent != 0) 
						THEN (sra.AllocationAmount*sra.NACPercent)
						ELSE sra.NACAmount 
					END
				ELSE 0 
			END)/count(srd.amount) AS NACREDUCTION,
		srr.NACDue as NACDUE,
		SUM(CASE WHEN srct.FullName = ''NAC'' THEN srd.Amount ELSE 0 END) AS NACPAID,
		srr.NACDue - SUM(CASE WHEN srct.FullName = ''NAC'' THEN srd.Amount ELSE 0 END) AS NACBALANCE '
	end
	
	RETURN @select

END










GO
