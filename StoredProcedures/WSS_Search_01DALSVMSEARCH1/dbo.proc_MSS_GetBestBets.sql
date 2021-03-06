/****** Object:  StoredProcedure [dbo].[proc_MSS_GetBestBets]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetBestBets
@SpecialTermId INT  AS
SELECT a.BestBetID, Title, Url, Description, b.[Order] FROM MSSBestBets a join MSSBestBetsLink b 
ON a.BestBetId = b.BestBetId
WHERE b.SpecialTermID = @SpecialTermId
order by b.[Order]

GO
