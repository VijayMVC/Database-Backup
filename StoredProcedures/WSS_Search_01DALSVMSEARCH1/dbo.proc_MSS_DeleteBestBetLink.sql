/****** Object:  StoredProcedure [dbo].[proc_MSS_DeleteBestBetLink]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DeleteBestBetLink
@SpecialTermId INT,
@BestBetID INT
AS
DELETE MSSBestBetsLink where @BestBetId = BestBetId and @SpecialTermId = SpecialTermId

GO
