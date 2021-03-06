/****** Object:  StoredProcedure [dbo].[sp_5YearlySalesAfterResale]    Script Date: 5/15/2018 12:09:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


--exec sp_5YearlySalesAfterOpen 1



/*********************************************
*
* new stored procedure - yearly sales after resale
*
**********************************************/


create PROCEDURE [dbo].[sp_5YearlySalesAfterResale]
@sstatus bit
AS
BEGIN
	

create table #opYears (
StoreId bigint, StoreNumber bigint, ResaleDate datetime, 
y1 float, y2 float, y3 float, y4 float, y5 float,y6 float, y7 float, y8 float, y9 float, y10 float)


declare @counter smallint
select @counter = count(*) from cor_stores s
inner join cor_store_dates d on d.storeId = s.storeId
inner join cor_store_status_types t on d.BeginStatus = t.StoreStatusType
where d.BeginStatus = 3004

Declare @StoreId bigint, @StoreNumber bigint, @ResaleDate datetime,@StoreOpenDate datetime
DECLARE stores CURSOR READ_ONLY FOR
	select s.storeid, s.storeNumber, d.BeginDate, s.StoreOpenDate from cor_stores s
	inner join cor_store_dates d on d.storeId = s.storeId
	inner join cor_store_status_types t on d.BeginStatus = t.StoreStatusType
	where d.BeginStatus = 3004 
OPEN stores
	FETCH NEXT FROM stores
	INTO @StoreId, @StoreNumber, @ResaleDate, @StoreOpenDate
	WHILE @counter > 0
	BEGIN
		


		select @counter = @counter - 1

		declare @x smallint		
		select @x = abs(datediff(month, @resaleDate, @StoreOpenDate))--operating month of resale
		--print @x

		insert into #opYears 
		select s.StoreId, s.StoreNumber, @ResaleDate as ResaleDate,
		(select sum(r1.TotalSales) from sls_royalty_period p1 
		inner join sls_Royalty_Report r1 on r1.RoyaltyPeriodId = p1.RoyaltyPeriodID and r1.OperatingMonth in (1+@x,2+@x,3+@x,4+@x,5+@x,6+@x,7+@x,8+@x,9+@x,10+@x,11+@x,12+@x) 
		where p1.storeId = @StoreId) as y1,
		(select sum(r2.TotalSales) from sls_royalty_period p2 
		inner join sls_Royalty_Report r2 on r2.RoyaltyPeriodId = p2.RoyaltyPeriodID and r2.OperatingMonth in (13+@x,14+@x,15+@x,16+@x,17+@x,18+@x,19+@x,20+@x,21+@x,22+@x,23+@x,24+@x)
		where p2.storeId = @StoreId) as y2,
		(select sum(r3.TotalSales) from sls_royalty_period p3 
		inner join sls_Royalty_Report r3 on r3.RoyaltyPeriodId = p3.RoyaltyPeriodID and r3.OperatingMonth in (25+@x,26+@x,27+@x,28+@x,29+@x,30+@x,31+@x,32+@x,33+@x,34+@x,35+@x,36+@x)
		where p3.storeId = @StoreId) as y3,
		(select sum(r4.TotalSales) from sls_royalty_period p4 
		inner join sls_Royalty_Report r4 on r4.RoyaltyPeriodId = p4.RoyaltyPeriodID and r4.OperatingMonth in (37+@x,38+@x,39+@x,40+@x,41+@x,42+@x,43+@x,44+@x,45+@x,46+@x,47+@x,48+@x)
		where p4.storeId = @StoreId) as y4,	 
		(select sum(r5.TotalSales) from sls_royalty_period p5 
		inner join sls_Royalty_Report r5 on r5.RoyaltyPeriodId = p5.RoyaltyPeriodID and r5.OperatingMonth in (49+@x,50+@x,51+@x,52+@x,53+@x,54+@x,55+@x,56+@x,57+@x,58+@x,59+@x,60+@x)
		where p5.storeId = @StoreId) as y5,
		(select sum(r6.TotalSales) from sls_royalty_period p6 
		inner join sls_Royalty_Report r6 on r6.RoyaltyPeriodId = p6.RoyaltyPeriodID and r6.OperatingMonth in (61+@x,62+@x,63+@x,64+@x,65+@x,66+@x,67+@x,68+@x,69+@x,70+@x,71+@x,72+@x) 
		where p6.storeId = @StoreId) as y6,
		(select sum(r7.TotalSales) from sls_royalty_period p7 
		inner join sls_Royalty_Report r7 on r7.RoyaltyPeriodId = p7.RoyaltyPeriodID and r7.OperatingMonth in (73+@x,74+@x,75+@x,76+@x,77+@x,78+@x,79+@x,80+@x,81+@x,82+@x,83+@x,84+@x)
		where p7.storeId = @StoreId) as y7,
		(select sum(r8.TotalSales) from sls_royalty_period p8 
		inner join sls_Royalty_Report r8 on r8.RoyaltyPeriodId = p8.RoyaltyPeriodID and r8.OperatingMonth in (85+@x,86+@x,87+@x,88+@x,89+@x,90+@x,91+@x,92+@x,93+@x,94+@x,95+@x,96+@x)
		where p8.storeId = @StoreId) as y8,
		(select sum(r9.TotalSales) from sls_royalty_period p9 
		inner join sls_Royalty_Report r9 on r9.RoyaltyPeriodId = p9.RoyaltyPeriodID and r9.OperatingMonth in (97+@x,98+@x,99+@x,100+@x,101+@x,102+@x,103+@x,104+@x,105+@x,106+@x,107+@x,108+@x)
		where p9.storeId = @StoreId) as y9,	 
		(select sum(r10.TotalSales) from sls_royalty_period p10 
		inner join sls_Royalty_Report r10 on r10.RoyaltyPeriodId = p10.RoyaltyPeriodID and r10.OperatingMonth in (109+@x,110+@x,111+@x,112+@x,113+@x,114+@x,115+@x,116+@x,117+@x,118+@x,119+@x,120+@x)
		where p10.storeId = @StoreId) as y10

		from cor_stores s
		where s.storeId = @StoreId

		FETCH NEXT FROM stores
		INTO @StoreId, @StoreNumber, @ResaleDate, @StoreOpenDate
	END
	CLOSE stores
DEALLOCATE stores


select p.FirstName, p.LastName,
(
select top 1 (p.FirstName + ' ' + p.LastName) from cor_persons p
inner join cor_stores_persons_link l on l.PersonID = p.PersonId
where l.StoreId = op.StoreId and p.PersonType = 2006
) 
as director,
(
select top 1 (p.FirstName + ' ' + p.LastName) from cor_persons p
inner join cor_stores_persons_link l on l.PersonID = p.PersonId
where l.StoreId = op.StoreId and p.PersonType = 2005
) 
as fbc,--(isnull(m1,0)+isnull(m2,0)+isnull(m3,0)+isnull(m4,0)+isnull(m5,0)+isnull(m6,0)+isnull(m7,0)+isnull(m8,0)+isnull(m9,0)+isnull(m10,0)+isnull(m11,0)+isnull(m12,0)+isnull(m13,0)+isnull(m14,0)+isnull(m15,0)+isnull(m16,0)+isnull(m17,0)+isnull(m18,0)+isnull(m19,0)+isnull(m20,0)+isnull(m21,0)+isnull(m22,0)+isnull(m23,0)+isnull(m24,0)),
op.*,c.* from #opYears op
left outer join cor_stores_persons_link l on op.StoreId = l.StoreId
left outer join cor_persons p on l.personId = p.personId
inner join cor_stores c on c.StoreId = op.StoreId
where l.GoldMinePlacement = 0
and (c.status = 1 or c.status = @sstatus)
and (isnull(y1,0)+isnull(y2,0)+isnull(y3,0)+isnull(y4,0)+isnull(y5,0)+isnull(y6,0)+isnull(y7,0)+isnull(y8,0)+isnull(y9,0)+isnull(y10,0)>0)
order by op.StoreNumber

drop table #opYears

--end procedure 
END


GO
