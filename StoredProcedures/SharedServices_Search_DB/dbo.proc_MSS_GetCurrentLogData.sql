/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCurrentLogData]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetCurrentLogData
@MinDate DATETIME = null,
@MaxDate DATETIME = null,
@MessageType int = null,
@ContentSourceId int = null,
@MessageId int = null,
@Count int = null,
@Url NVARCHAR(2048) = null,
@IsLike bit = null,
@HostName NVARCHAR(300) = null,
@MustUseHostName bit = null,
@CatalogID int = null
AS

declare @hostid INT
SET @hostid = -1

if (@HostName is not null)
BEGIN
  SELECT  @hostid = HostId from MSSCrawlHostList where HostName=@HostName

  if ((@hostid = -1) AND (@MustUseHostName = 1))
  BEGIN
	  RAISERROR('Host name does not exist',16,1)
	  RETURN
  END
END

declare @strSelect1 nvarchar(150)
declare @strSelect2 nvarchar(256)
declare @strSelectSummary nvarchar(100)
declare @strFrom1 nvarchar(400)
declare @strFrom2 nvarchar(400)
declare @strWhere nvarchar(4000)

SET @StrWhere = ''

if (@MinDate is not null)
BEGIN
 set @strWhere =' and LastTouchStart >= @minTime'
END
if (@MaxDate is not null)
BEGIN
 set @strWhere = @strWhere + ' and LastTouchStart <= @maxTime'
END
if (@MessageType is not null)
BEGIN
  set @strWhere = @strWhere +  ' and a.ErrorLevel= @level'
END
if (@MessageId is not null)
BEGIN
 set @strWhere = @strWhere + ' and a.errorid = @errorid'
END
if (@ContentSourceId is not null)
BEGIN
 set @strWhere = @strWhere + ' and a.ContentSourceId = @csId'
END
if (@Url is not null)
BEGIN
 if (@IsLike = 0)
 BEGIN
   set @strWhere = @strWhere + ' and DisplayUrl = @url'
 END
 ELSE
 BEGIN
   set @strWhere = @strWhere + ' and DisplayUrl like @url'
 END
END
if(@hostid != -1)
BEGIN
  set @strWhere = @strWhere + ' and hostid = @host'
END
if (@CatalogId is not null)
BEGIN
 set @strWhere = @strWhere + ' and ProjectId = @ctId' 
END

declare @filter tinyint
set @filter = 0

if len(IsNull( @strWhere , '')) > 0
	set @filter = 1

declare @strSummary nvarchar(4000)
set @strSummary = '
declare @temp table (ErrorLevel int, Cnt int) '

if(@MessageType = 0)
BEGIN
	set @strSummary = @strSummary + '
insert into @temp 
select 1, Sum(cnt)
from (
	select count(*) as cnt
		from msscrawlurl a with (nolock) 
		where a.commitcrawlid <>0 and a.errorlevel = 1 ' + @strWhere + '
) x 
insert into @temp 
select 2, Sum(cnt)
from (
	select count(*) as cnt
		from msscrawlurl a with (nolock) 
		where a.commitcrawlid <>0 and a.errorlevel = 2 ' + @strWhere + '
) x 
if  @filter = 1
begin
	insert into @temp 
	select 0, Sum(cnt)
	from (
		select count(*) as cnt
			from msscrawlurl a with (nolock) 
			where a.commitcrawlid <>0 and a.errorlevel = 0 ' + @strWhere + '
	) x 
end
else
begin
	insert into @temp
	select 0, Sum(cnt) - (select sum(Cnt) from @temp where errorlevel > 0)
	from (
		select rowcnt as cnt
		from sys.sysindexes where id = object_id(''MSSCrawlUrl'') and indid = 1
	) x 
end'
END
ELSE
BEGIN
	set @strSummary = @strSummary + '
insert into @temp 
select 1, Sum(cnt)
from (
	select count(*) as cnt
		from msscrawlurl a with (nolock) 
		where a.commitcrawlid <>0 and a.errorlevel = 1 ' + @strWhere + '
	union all
	select count(*) as cnt
		from msscrawldeletedurl a with (nolock) 
		where a.errorlevel = 1 ' + REPLACE(@strWhere, 'LastTouchStart', 'LogTime') + '
) x 
insert into @temp 
select 2, Sum(cnt)
from (
	select count(*) as cnt
		from msscrawlurl a with (nolock) 
		where a.commitcrawlid <>0 and a.errorlevel = 2 ' + @strWhere + '
	union all
	select count(*) as cnt
		from msscrawldeletedurl a with (nolock) 
		where a.errorlevel = 2 ' + REPLACE(@strWhere, 'LastTouchStart', 'LogTime') + '
) x 
if  @filter = 1
begin
	insert into @temp 
	select 0, Sum(cnt)
	from (
		select count(*) as cnt
			from msscrawlurl a with (nolock) 
			where a.commitcrawlid <>0 and a.errorlevel = 0 ' + @strWhere + '
		union all
		select count(*) as cnt
			from msscrawldeletedurl a with (nolock) 
			where a.errorlevel = 0 ' + REPLACE(@strWhere, 'LastTouchStart', 'LogTime') + '
	) x 
end
else
begin
	insert into @temp
	select 0, Sum(cnt) - (select sum(Cnt) from @temp where errorlevel > 0) 
	from (
		select rowcnt as cnt
		from sys.sysindexes where id = object_id(''MSSCrawlUrl'') and indid = 1
	union all
		select rowcnt as cnt
		from sys.sysindexes where id = object_id(''MSSCrawlDeletedUrl'') and indid = 1
	) x
end'
END

set @strSummary = @strSummary + '
select * from @temp '

exec sp_executesql @strSummary, N'@minTime datetime, @maxTime datetime, @level int, @errorid int, @csId int, @url NVARCHAR(2048), @host int, @ctId int, @filter tinyint', @minTime = @MinDate, @maxTime = @maxDate, @level = @MessageType, @errorid = @MessageId, @csId = @ContentSourceId, @url = @URL, @host = @hostid, @ctId=@CatalogId, @filter = @filter

if(@count > 0)
BEGIN
	declare @top NVARCHAR(50)
	set @top =  cast (@count as NVARCHAR)
	SET @strSelect1 =' insert into #temp select top '+ @top +' a.displayurl, b.ErrorLevel, ErrorMsg, HResult = hrResult, a.ErrorDesc, a.ContentSourceId, LastTouchStart, 0 from'

	SET @strSelect2 =' insert into #temp select top '+ @top +' a.displayurl, b.ErrorLevel, ErrorMsg, HResult = hrResult, ErrorDesc = null, a.ContentSourceId, LogTime, DeleteReason from'
	set @strFrom1 = ' MSSCrawlUrl a with (nolock), MSSCrawlErrorList b with (nolock) where a.Errorid = b.Errorid and a.CommitCrawlID <> 0 '

	set @strFrom2 =' MSSCrawlDeletedURL a with(nolock), MSSCrawlErrorList b with (nolock) where a.Errorid = b.Errorid '

	create table #temp
	(DisplayUrl NVARCHAR(1500),
	 ErrorLevel int,
	 ErrorMsg NVARCHAR(2000), 
	 HResult int, 
	 ErrorDesc NVARCHAR(512),
	 ContentSourceId int, 
	 LastTouchStart DATETIME,
         DeleteReason int)

	declare @strCommand nvarchar(4000)

	if(@MessageType != 0 OR @MessageType is null)
	BEGIN
		set @strCommand =  @strSelect2 + @strFrom2 + REPLACE(@strWhere, 'LastTouchStart', 	'LogTime') + ' 	ORDER BY LogTime DESC'

		exec sp_executesql @strCommand , N'@minTime datetime, @maxTime datetime, @level int, @errorid int, @csId int, @url NVARCHAR(2048), @host int, @ctId int', @minTime = @MinDate, @maxTime = @maxDate, @level = @MessageType, @errorid = @MessageId, @csId = @ContentSourceId, @url =	@URL, @host = @hostid, @ctId=@CatalogId

	        update #temp set ErrorDesc = (select ErrorMsg from MSSCrawlDeletedErrorList where DeleteReason = MSSCrawlDeletedErrorList.DeletedID)
	END

	set @strCommand = @strSelect1 + @strFrom1 + @strWhere + ' ORDER BY LastTouchStart DESC'

	exec sp_executesql @strCommand , N'@minTime datetime, @maxTime datetime, @level int, @errorid int, @csId int, @url NVARCHAR(2048), @host int, @ctId int', @minTime = @MinDate, @maxTime = @maxDate, @level = @MessageType, @errorid = @MessageId, @csId = @ContentSourceId, @url = @URL, @host = @hostid, @ctId=@CatalogId

	select DisplayUrl,
	 ErrorLevel ,
	 ErrorMsg, 
	 HResult, 
	 ErrorDesc ,
	 ContentSourceId, 
	 LastTouchStart from #temp order by LastTouchStart desc	

	drop table #temp

END

GO
