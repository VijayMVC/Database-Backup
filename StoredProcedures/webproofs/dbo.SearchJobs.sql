/****** Object:  StoredProcedure [dbo].[SearchJobs]    Script Date: 5/15/2018 12:13:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE SearchJobs
	@query nvarchar(100),
	@WebNum int
AS
BEGIN

declare @sql nvarchar(max)
declare @value nvarchar(100)
declare _Cursor cursor for select [Value] from UTILfn_Split(@query, ' ')

select @sql = 
'
declare @query varchar(100)
select @query = ''' + @query + '''
declare @webnum int
select @webnum = ' + Convert(nvarchar(4),@WebNum) + '

select j2.*
from Job j2
inner join
(select JobID ,count(JobId) as relevanceCount from
(select j.JobId
from Job j (nolock)
inner join CenterSetting cs (nolock) on cs.CenterSettingId = j.CenterSettingId
where cs.WebNumber = @webnum
	and (j.InvoiceNumber = @query or j.Company = @query)
union all
select j.JobId
from Job j (nolock)
inner join CenterSetting cs (nolock) on cs.CenterSettingId = j.CenterSettingId
where cs.WebNumber = @webnum
	and (j.InvoiceNumber like ''%'' + REPLACE(@query,'' '',''%'') + ''%'' or j.Company like ''%'' + REPLACE(@query,'' '',''%'') + ''%'')
union all
select j.JobId
from Job j (nolock)
inner join CenterSetting cs (nolock) on cs.CenterSettingId = j.CenterSettingId
where cs.WebNumber = @webnum and
('
open _cursor
fetch next from _cursor into @value

while @@fetch_status = 0
begin
	select @sql = @sql + ' (j.InvoiceNumber like ''%'' + ''' + @value + ''' + ''%'' or j.Company like ''%'' + ''' + @value + ''' + ''%'') '
	fetch next from _cursor into @value
	If @@fetch_status = 0
	Begin
		select @sql = @sql + 'or'
	End
end

close _cursor
deallocate _cursor

select @sql = @sql + ')
) as JobID 
group by JobId) as Relevance on Relevance.jobid = j2.jobid
order by relevanceCount desc, j2.LastUpdated desc'
print @sql
exec sp_executesql @sql 

End
GO
