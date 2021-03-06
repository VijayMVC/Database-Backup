/****** Object:  StoredProcedure [dbo].[sp_insertMonthlyReferringSite]    Script Date: 5/15/2018 12:10:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertMonthlyReferringSite]
AS
BEGIN
	SET NOCOUNT ON;

	Declare @intReturnCode int, @PK_Store int
	select @intReturnCode = 0
	
delete from analysis.MonthlyReferringSite
where month in (select distinct month from dbo.WebTrafficStaging2) 
and webnumber in (select distinct webnumber from dbo.WebTrafficStaging2)


DECLARE @str varchar(4000)
Declare @webnumber int, @month datetime

DECLARE c1 CURSOR READ_ONLY
FOR
select distinct month from dbo.WebTrafficStaging2 order by month desc

OPEN c1

FETCH NEXT FROM c1
INTO @month

WHILE @@FETCH_STATUS = 0
BEGIN

	DECLARE store CURSOR READ_ONLY
	FOR
	select distinct webnumber from dbo.WebTrafficStaging2 order by webnumber

	OPEN store

	FETCH NEXT FROM store
	INTO @webnumber

	WHILE @@FETCH_STATUS = 0
	BEGIN
select @str = (select referringsite + '|' + cast(sum(visits) as nvarchar(50)) + ','  from dbo.webtrafficstaging2 
where year(month) = year(@month) and month(month) = month(@month) and webnumber = @webnumber group by referringsite
having sum(visits) in (select top 10 sum(visits) from dbo.webtrafficstaging2 
        where year(month) = year(@month) and month(month) = month(@month) and webnumber = @webnumber 
group by referringsite ORDER BY sum(visits) desc)
ORDER BY sum(visits) desc
for xml path(''))


		SET @str = SUBSTRING(@str,1,LEN(@str)-1)
		insert into analysis.MonthlyReferringSite (webnumber, month, referringsites)
		values (@webnumber, @month, coalesce(@str, ''))		
		FETCH NEXT FROM store
		INTO @webnumber
	END

	CLOSE store
	DEALLOCATE store

	FETCH NEXT FROM c1
	INTO @month
END

CLOSE c1
DEALLOCATE c1


	select @intReturnCode = @@error
	return @intReturnCode
END

GO
