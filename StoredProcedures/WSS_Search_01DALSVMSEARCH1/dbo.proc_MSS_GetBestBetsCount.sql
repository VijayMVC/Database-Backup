/****** Object:  StoredProcedure [dbo].[proc_MSS_GetBestBetsCount]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetBestBetsCount
@SpecialTermId INT,
@Count INT  OUTPUT AS
SELECT @Count = count(*) FROM MSSBestBets a join MSSBestBetsLink b 
ON a.BestBetId = b.BestBetId
WHERE b.SpecialTermID = @SpecialTermId

GO
