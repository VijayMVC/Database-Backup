/****** Object:  StoredProcedure [dbo].[proc_MSS_GetBestBet]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetBestBet
@ConsumerGpId NVARCHAR(50),
@Url NVARCHAR(2048)  AS
SELECT a.BestBetId, Title, Url, Description FROM MSSBestBets a join MSSBBConsumerGpLink b 
ON a.BestBetId = b.BestBetID
WHERE ConsumerGpId = @ConsumerGpId
and a.Url = @Url

GO
