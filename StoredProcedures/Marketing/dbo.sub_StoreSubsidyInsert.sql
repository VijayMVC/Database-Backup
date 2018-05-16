/****** Object:  StoredProcedure [dbo].[sub_StoreSubsidyInsert]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_StoreSubsidyInsert
(
	@StoreSId int,
	@StoreSubYear smallint,
	@StoreSubHid int,
	@StoreSubType int,
	@StoreSubStartingAmount real,
	@StoreSubRemainingAmount real
)
 AS
INSERT INTO StoreSubsidy
(
	StoreSId,
	StoreSubYear,
	StoreSubHId,
	StoreSubType,
	StoreSubStartingAmount,
	StoreSubRemainingAmount
)
VALUES
(
	@StoreSId,
	@StoreSubYear,
	@StoreSubHid,
	@StoreSubType,
	@StoreSubStartingAmount,
	@StoreSubRemainingAmount
)



GO
