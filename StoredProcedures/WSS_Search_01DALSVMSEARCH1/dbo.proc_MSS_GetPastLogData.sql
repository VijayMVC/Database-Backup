/****** Object:  StoredProcedure [dbo].[proc_MSS_GetPastLogData]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetPastLogData
@Url NVARCHAR(2048) AS
select a.displayurl, b.Errorid, ErrorMsg, NULL, LastTouchStart from
MSSCrawlUrlLog a with(nolock), MSSCrawlErrorList b with (nolock) 
where a.Errorid = b.Errorid and displayUrl = @url order by LastTouchStart

GO
