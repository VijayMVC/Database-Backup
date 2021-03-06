/****** Object:  StoredProcedure [dbo].[sp_MatchSalesToMailingAddressesSummaryByDate]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE [dbo].[sp_MatchSalesToMailingAddressesSummaryByDate]
	-- input date format: mm/dd/yyyy	
	@mDate varchar(50), -- Mailing date
	@sStartDate varchar(50), -- Sales Start Date
	@sEndDate varchar(50)= null -- Sales End Date can be empty
	-- Return results for the matching addresses
AS

BEGIN
	SET NOCOUNT ON;

	declare @mailingDate datetime, @salesStart datetime, @salesEnd datetime 

	set @mailingDate = convert(datetime, @mDate, 101)
	set @salesStart = convert(datetime, @sStartDate, 101)

	if  @sEndDate is not null or @sEndDate <> ''
	set @salesEnd = convert(datetime, @sEndDate, 101)

	declare @StoreMailing table (webnum int, mailing int)
	declare @StoreSales table (webnum int, Customer int, Sale money)
	declare @StoreCountry table (webnum int, countrycode varchar(10))

	insert into @StoreCountry (webnum, countrycode)
	SELECT a.[WebNumber], e.countryisocode
	FROM [01DALSVMSQL001].[Alpine].[dbo].[COR_STORES] a
	left join [01DALSVMSQL001].[Alpine].[dbo].[COR_STORES_addresses_link] b on a.storeid = b.storeid
	left join [01DALSVMSQL001].[Alpine].[dbo].[COR_addresses] c on b.addressid = c.addressid
	left join [01DALSVMSQL001].[Alpine].[dbo].[COR_POLITICAL_DIVISION] d on c.PoliticalDivisionID = d.PoliticalDivisionID
	left join [01DALSVMSQL001].[Alpine].[dbo].[COR_COUNTRIES] e on d.countryid = e.countryid
	where a.webnumber > 0

		insert into @StoreMailing (webnum, mailing)
		select cast(webid as int), count(*) from dmmailings
		where year(Mailingdate) = year(@mailingDate) and month(mailingdate) = month(@mailingDate)
		 and webid is not null
		group by webid

		--------------------------------
		----- Match address Sales Total
		---------------------------------
	insert into @StoreSales (webnum , Customer , Sale )
		(
			select coalesce(webno, -1), 
			count(*) AS 'Customers',
		SUM(salesamt)  as Sale from dmcustomers dm
			where  exists 
			(
				select * from dmmailings u
				where dm.orderDate >= @salesStart and ((@salesEnd is null) OR 
(DATEADD(day, DATEDIFF(day, 0, dm.orderDate), 0) <= @salesEnd)) and 
				year(u.mailingDate) = year(@mailingDate) and month(u.mailingDate) = month(@mailingDate) and 
				(
					((u.address1 like dm.address1) or (u.address1 like dm.address2)) and 
					(left(u.zip, 5) = left(dm.zipcode,5) or dm.city=u.city) and 
					((u.webid is not null and dm.webno = cast(COALESCE(u.webid,'0') as int)) or u.webid is null )
				)
			) and (address1 like '%[0-9]%' or address2 like '%[0-9]%')

			group by webno
			
		) 
		--#endregion

	select a.*, c.countrycode as country, COALESCE(customer, 0) as customer, 
	COALESCE(customer, 0)*1.0/mailing	as match,
	 COALESCE(sale, 0) as sale from  @Storemailing a
	left join @StoreSales b on a.webnum = b.webnum
	left join @StoreCountry c on a.webnum = c.webnum
	where a.webnum !=0
	order by a.webnum

END

GO
