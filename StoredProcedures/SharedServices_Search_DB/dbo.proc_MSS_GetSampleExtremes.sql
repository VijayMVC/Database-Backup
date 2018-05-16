/****** Object:  StoredProcedure [dbo].[proc_MSS_GetSampleExtremes]    Script Date: 5/15/2018 12:11:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_GetSampleExtremes
@cHighLimit int,
@cLowLimit int
AS
    select crawledPropertyId, CPCount from dbo.MSScrawledPropSamplesCleanup where CPCount > @cHighLimit or CPCount < @cLowLimit

GO
