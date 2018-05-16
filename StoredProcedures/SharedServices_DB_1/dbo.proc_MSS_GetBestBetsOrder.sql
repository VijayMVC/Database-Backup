/****** Object:  StoredProcedure [dbo].[proc_MSS_GetBestBetsOrder]    Script Date: 5/15/2018 12:11:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetBestBetsOrder
@SpecialTermId INT  AS

SELECT b.SpecialTermID, b.BestBetID, b.[Order] FROM MSSBestBetsLink b 
WHERE b.SpecialTermID = @SpecialTermId
order by b.[Order]


GO
