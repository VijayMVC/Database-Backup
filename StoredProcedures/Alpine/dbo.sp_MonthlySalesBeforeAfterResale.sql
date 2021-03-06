/****** Object:  StoredProcedure [dbo].[sp_MonthlySalesBeforeAfterResale]    Script Date: 5/15/2018 12:09:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*********************************************
*
* new stored procedure - before and after resale
*
**********************************************/

Create PROCEDURE [dbo].[sp_MonthlySalesBeforeAfterResale]
@sstatus bit	
AS
BEGIN
	
--declare @closed bit, @years smallint
--select @closed = 0


create table #opMonths (
StoreId bigint, StoreNumber bigint, OpenDate datetime,resaleDate datetime,
m1 float, m2 float, m3 float, m4 float, m5 float,m6 float, m7 float, m8 float, m9 float, m10 float, m11 float, m12 float,
m13 float, 
m14 float, m15 float, m16 float, m17 float, m18 float, m19 float, m20 float, m21 float, m22 float, m23 float, m24 float, m25 float)


declare @counter smallint
select @counter = count(*) from cor_stores s
inner join cor_store_dates d on d.storeId = s.storeId
inner join cor_store_status_types t on d.BeginStatus = t.StoreStatusType
where d.BeginStatus = 3004 --and s.StoreOpenDate >= '1997-1-1' 

Declare @StoreId bigint, @StoreNumber bigint, @resaleDate datetime, @StoreOpenDate datetime, @status smallint
DECLARE stores CURSOR READ_ONLY FOR
	select s.storeid, s.storeNumber, d.BeginDate, s.StoreOpenDate, s.status from cor_stores s
	inner join cor_store_dates d on d.storeId = s.storeId
	inner join cor_store_status_types t on d.BeginStatus = t.StoreStatusType
	where d.BeginStatus = 3004 
OPEN stores
	FETCH NEXT FROM stores
	INTO @StoreId, @StoreNumber, @resaleDate, @StoreOpenDate, @status
	WHILE @counter > 0
	BEGIN
		print @storenumber
		print @counter
		select @counter = @counter - 1		
	    

		--if @closed = 0 and @status = 0
		--	begin
		--		continue		
		--	end
			
		declare @opMonthResale smallint
		declare @opMonthStart smallint
		declare @monthCounter smallint
		declare @dynSql varchar(500)
		declare @salesMonth float

		select @opMonthResale = abs(datediff(month, @resaleDate, @StoreOpenDate))--operating month of resale
		select @opMonthStart = @opMonthResale - 12 --operating month to start report ( 12 for year
		select @monthCounter = 1	
		print @opMonthResale
		print @opMonthStart	
		
		
		--add storeid to table
		insert into #opMonths (StoreID, resaleDate,openDate,StoreNumber) values (@StoreId,@resaleDate,@StoreOpenDate,@StoreNumber )
		
		while @monthCounter <= 25
			begin			

				select @salesMonth = dbo.salesForOpMonth(@opMonthStart,@StoreId)
				--print @salesMonth

				--update temp table
				
				select @dynSql = 'update #opMonths set m' + convert(varchar(5),@monthCounter) + ' = ' + convert(varchar(20),@salesMonth)  + 
								' where StoreId = ' + convert(varchar(10),@storeId)

				--print @dynSql
				exec ( @dynSql )

				select @monthCounter = @monthCounter + 1
				select @opMonthStart = @opMonthStart + 1
				
			end

		FETCH NEXT FROM stores
		INTO @StoreId, @StoreNumber, @resaleDate, @StoreOpenDate,@status
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

op.*,c.* from #opMonths op
left outer join cor_stores_persons_link l on op.StoreId = l.StoreId
left outer join cor_persons p on l.personId = p.personId
inner join cor_stores c on c.StoreId = op.StoreId
where (isnull(m1,0)+isnull(m2,0)+isnull(m3,0)+isnull(m4,0)+isnull(m5,0)+isnull(m6,0)+isnull(m7,0)+isnull(m8,0)+isnull(m9,0)+isnull(m10,0)+isnull(m11,0)+isnull(m12,0)+isnull(m13,0)+isnull(m14,0)+isnull(m15,0)+isnull(m16,0)+isnull(m17,0)+isnull(m18,0)+isnull(m19,0)+isnull(m20,0)+isnull(m21,0)+isnull(m22,0)+isnull(m23,0)+isnull(m24,0)) > 0
and l.GoldMinePlacement = 0
and (c.status = 1 or c.status = @sstatus)
order by op.StoreNumber

drop table #opMonths

--end procedure 
END


GO
