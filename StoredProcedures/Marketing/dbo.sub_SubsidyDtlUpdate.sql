/****** Object:  StoredProcedure [dbo].[sub_SubsidyDtlUpdate]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE sub_SubsidyDtlUpdate
(
	@SubDID int,
	@SubDUpToAmount float,
	@SubDAmount float
)
AS
UPDATE SubsidyDtl
SET
	SubDUpToAmount = @SubDUpToAmount,
	SubDAmount = @SubDAmount
WHERE
	SubDID = @SubDID



GO
