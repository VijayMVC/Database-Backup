/****** Object:  StoredProcedure [dbo].[sub_StoreSubsidyUpdate]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_StoreSubsidyUpdate
(
	@Webnumber int,
	@Year int,
	@StoreSubHId int,
	@StartingAmount real,
	@RemainingAmount real
)
 AS
UPDATE StoreSubsidy
SET 
	StoreSubStartingAmount = @StartingAmount,
	StoreSubRemainingAmount = @RemainingAmount
WHERE
	StoreSId = @Webnumber
AND
	StoreSubYear = @Year
AND
	StoreSubHId = @StoreSubHId
	



GO
