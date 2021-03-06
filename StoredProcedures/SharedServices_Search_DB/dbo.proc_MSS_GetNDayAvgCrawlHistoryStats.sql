/****** Object:  StoredProcedure [dbo].[proc_MSS_GetNDayAvgCrawlHistoryStats]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetNDayAvgCrawlHistoryStats
@ContentSourceId int,
@CrawlType int,
@NumberOfDays int
AS
SELECT AVG(DATEDIFF([Second], StartTime, EndTime)) AS DurationAvg,
AVG(SuccessCount) AS AvgSuccess,
AVG(ErrorCount) AS AvgError,
AVG(WarningCount) AS AvgWarning ,
COUNT(*) as TotalCrawls
FROM MSSCrawlHistory 
WHERE(CrawlType = @CrawlType) AND 
     (CrawlID in (SELECT DISTINCT CrawlID FROM MSSCrawlContent WITH (NOLOCK) WHERE ContentSourceID = @ContentSourceId)) AND 
     (DATEDIFF([Day], EndTime, GETDATE()) <= (@NumberOfDays - 1)) AND 
     ((SuccessCount <> 0) OR (ErrorCount <> 0) OR (WarningCount <> 0))


GO
