/****** Object:  StoredProcedure [dbo].[proc_MSS_UpdateBestBetOrder]    Script Date: 5/15/2018 12:11:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_UpdateBestBetOrder
@SpecialTermId int,
@BestBetId int,
@Order int AS

Update MSSBestBetsLink
set [Order] = @Order
WHERE BestBetID = @BestBetId and SpecialTermID = @SpecialTermId


GO
