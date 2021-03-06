/****** Object:  StoredProcedure [dbo].[sp_insertWebTrafficStaging3]    Script Date: 5/15/2018 12:10:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertWebTrafficStaging3]
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int, @PK_Store int
	select @intReturnCode = 0
	
declare @saf int, @rfq int, @mtmfs int

declare @staging table (
webnumber int,
month datetime,
saf int,
rfq int,
mtmfs int)

declare @webnumber table( webnumber int)
insert into @webnumber 
select distinct webnumber from MARYANN.fastsigns.dbo.webstat
order by webnumber

declare @monthDate table (month datetime)
insert into @monthDate
select distinct DATEADD(dd,-(DAY(createddate)-1),createddate) from MARYANN.fastsigns.dbo.webstat order by DATEADD(dd,-(DAY(createddate)-1),createddate)

declare @store int
Declare @month datetime
DECLARE c1 CURSOR READ_ONLY
FOR
select month from @monthDate order by month desc

OPEN c1

FETCH NEXT FROM c1
INTO @month

WHILE @@FETCH_STATUS = 0
BEGIN

	DECLARE store CURSOR READ_ONLY
	FOR
	select webnumber from @webnumber

	OPEN store

	FETCH NEXT FROM store
	INTO @store

	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @saf = ( select top 1 mtd  from MARYANN.fastsigns.dbo.webstat
		where webnumber = @store and statid = 3 
			and year(createddate) = year(@month) and month(createddate) = month(@month) 
		order by createddate desc)
		set @rfq = ( select top 1 mtd  from MARYANN.fastsigns.dbo.webstat
		where webnumber = @store and statid = 2 
			and year(createddate) = year(@month) and month(createddate) = month(@month) 
		order by createddate desc)		
		set @mtmfs = ( select top 1 mtd  from MARYANN.fastsigns.dbo.webstat
		where webnumber = @store and statid = 5 
			and year(createddate) = year(@month) and month(createddate) = month(@month) 
		order by createddate desc)
		declare @test nvarchar(50)
		
		if @saf is null
		begin
			set @saf = 0
		end
		if @rfq is null
		begin
			set @rfq =0
		end
		if @mtmfs is null
		begin
			set @mtmfs =0
		end
		
		insert into @staging(webnumber, month, saf, rfq, mtmfs)
		values (@store, @month, @saf, @rfq, @mtmfs)
		
		FETCH NEXT FROM store
		INTO @store

	END

	CLOSE store
	DEALLOCATE store

	FETCH NEXT FROM c1
	INTO @month
END

CLOSE c1
DEALLOCATE c1


delete from dbo.WebTrafficStaging3
where month in (select month from @monthDate)

insert into dbo.WebTrafficStaging3(webnumber, month, sendafile, rfq, myfastsignsregistration)
select webnumber, month, saf, rfq, mtmfs from @staging

	select @intReturnCode = @@error
	return @intReturnCode
END

GO
