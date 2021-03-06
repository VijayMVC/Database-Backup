/****** Object:  StoredProcedure [dbo].[proc_MSS_GetCrawlHistory]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetCrawlHistory

@MaxRecords int,
@BeginTime datetime,
@EndTime datetime,
@CrawlStatus int,
@ContentSourceID int
AS

DECLARE @strWhere nvarchar(4000)
DECLARE @strSelect nvarchar(4000)
DECLARE @strCommand nvarchar(4000)

SET @strSelect = ''
SET @strWhere = ' WHERE A.ProjectID = 1 AND '

IF (@MaxRecords is not null)
BEGIN
    SET @strSelect = ' SET ROWCOUNT @rowCnt;'
END

SET @strSelect = @strSelect + ' SELECT A.CrawlID,A.CrawlType,B.ContentSourceID,A.Status,A.StartTime,A.EndTime,A.SuccessCount,A.ErrorCount,A.WarningCount from MSSCrawlHistory as A inner join (select distinct CrawlID,ContentSourceID from MSSCrawlContent) as B on  A.CrawlID = B.CrawlID '

IF ((@BeginTime is not null) AND (@EndTime is not null) )
BEGIN
    SET @strWhere = @strWhere + ' A.StartTime BETWEEN @TimeWindowStart AND @TimeWindowEnd'
END
ELSE
BEGIN
    SET @StrWhere = @strWhere + ' DATEDIFF([Day], A.StartTime, GETDATE()) <= 7'
END

IF(@CrawlStatus is not null)
BEGIN
    SET @strWhere = @strWhere + ' AND A.Status = @CrawlStat AND ((A.SuccessCount <> 0) OR (A.ErrorCount <> 0) OR (A.WarningCount <> 0))'
END

IF(@ContentSourceID is not null)
BEGIN
    SET @strWhere = @strWhere + ' AND B.ContentSourceID = @ContentSourceID'
END

SET @strCommand = @strSelect + @strWhere + ' ORDER BY A.EndTime DESC'
exec sp_executesql @strCommand, N'@rowCnt int, @TimeWindowStart datetime, @TimeWindowEnd datetime, @CrawlStat int, @ContentSourceID int', @rowCnt = @MaxRecords, @TimeWindowStart = @BeginTime, @TimeWindowEnd = @EndTime, @CrawlStat = @CrawlStatus, @ContentSourceID = @ContentSourceID


GO
