/****** Object:  StoredProcedure [dbo].[StoreSubsidyDetailLog]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE  PROCEDURE dbo.StoreSubsidyDetailLog
(
	@StoreId		int,
	@CalYear		int,
	@SubHId		int
)
AS
SET NOCOUNT ON
SELECT sl.*
	FROM SubsidyLog sl
	WHERE sl.SubLStoreId = @StoreId AND sl.SubLYear = @CalYear AND sl.SubLHId = @SubHId
;


GO
