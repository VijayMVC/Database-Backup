/****** Object:  StoredProcedure [dbo].[proc_MSS_OnEndCrawl]    Script Date: 5/15/2018 12:11:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_OnEndCrawl
	@nCatalogId SMALLINT,
	@nCrawlNumber INT,
	@nCrawlType INT,
	@nStopped INT,
	@nSuccessfulTransactions INT,
	@nErrorTransactions INT,
	@nExcludedTransactions INT,
	@nUnvisitedItems INT      

AS
begin

    SET NOCOUNT ON

end


GO
