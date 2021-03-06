/****** Object:  StoredProcedure [dbo].[sp_insertMetro]    Script Date: 5/15/2018 12:10:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_insertMetro]

AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int
	select @intReturnCode = 0

delete from analysis.metro

insert into analysis.metro (webnumber, metroname, metro, lst, iyp)
select a.webnumber, metroname = case when a.metroid >0 then (select top(1) name from dbo.metro b where a.metroid = b.metroid) end, metro = 1, lst = 0, iyp=0
from dbo.webnumbermetro a
where a.metroid > 0 
union
select a.webnumber, metroname = case when a.lstid >0 then (select top(1) name from dbo.metro b where a.lstid = b.lstid) end, metro=0, lst=1, iyp=0
from dbo.webnumbermetro a
where a.lstid > 0 
union
select a.webnumber, metroname = case when a.iypid >0 then (select top(1) name from dbo.metro b where a.iypid = b.iypid) end, metro=0, lst=0, iyp=1
from dbo.webnumbermetro a
where a.iypid > 0 

declare @webnumber int, @mname nvarchar(50), @metro nvarchar(50), @storeID int, @pk_metro int, @metroBit bit, @lstBit bit, @iypBit bit

	DECLARE store CURSOR READ_ONLY
	FOR
	select a.metroname, a.metro, a.lst, a.iyp, b.pk_store
	from analysis.metro a
	inner join analysis.dimstore b
	on a.webnumber = b.webnumber and b.DimStore_SCD_End_Date is null

	OPEN store

	FETCH NEXT FROM store
	INTO  @metro, @metroBit, @lstBit, @iypBit, @storeID

	WHILE @@FETCH_STATUS = 0
	BEGIN

		if not exists (select * from analysis.dimmetro where metroname = @metro and fk_store = @storeID and metro = @metroBit 
						and lst = @lstBit and iyp = @iypBit and effectiveenddate is null)
		begin
					if not exists (select * from analysis.dimmetro where metroname = @metro and fk_store = @storeID 
									and metro = @metroBit and lst = @lstBit and iyp = @iypBit)
					begin
								insert into analysis.dimmetro (metroname, fk_store, metro, lst, iyp)
								values (@metro, @storeID, @metroBit, @lstBit, @iypBit)
					end
					else
					begin
								insert into analysis.dimmetro (metroname, fk_store, metro, lst, iyp, effectivestartdate)
								values (@metro, @storeID, @metroBit, @lstBit, @iypBit, getdate())
					end
		end

		FETCH NEXT FROM store
		INTO  @metro, @metroBit, @lstBit, @iypBit, @storeID
	END

	CLOSE store
	DEALLOCATE store


	DECLARE metro CURSOR READ_ONLY
	FOR
	select a.metroname, a.pk_metro, b.webnumber, a.metro, a.lst, a.iyp
	from analysis.dimmetro a
	inner join analysis.dimstore b
	on a.fk_store = b.Pk_store and b.DimStore_SCD_End_Date is null

	OPEN metro

	FETCH NEXT FROM metro
	INTO  @mname, @pk_metro, @webnumber, @metroBit , @lstBit, @iypBit 

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		if not exists (select * from analysis.metro where webnumber = @webnumber and metroname = @mname
						and metro = @metroBit and lst = @lstBit and iyp = @iypBit)
		begin
			update analysis.dimmetro 
			set effectiveEndDate = getdate()
			where pk_metro = @pk_metro
		end
		else
		begin
					update analysis.dimmetro 
			set effectiveEndDate = null
			where pk_metro = @pk_metro
		end
		FETCH NEXT FROM metro
		INTO  @mname, @pk_metro, @webnumber, @metroBit , @lstBit, @iypBit 
	END

	CLOSE metro
	DEALLOCATE metro


	select @intReturnCode = @@error
	return @intReturnCode
END






GO
