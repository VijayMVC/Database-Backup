/****** Object:  StoredProcedure [dbo].[ar_ArtRevisionTransactionsInsert]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON




CREATE PROCEDURE ar_ArtRevisionTransactionsInsert
(
 	@webnumber int,
	@userid int,
	@arttypeID int,
	@artRevisionStatusID int,
	@inputDate datetime
)
AS
INSERT INTO ar_ArtRevisionTransactions
(
	WebNumber,
	userid,
	ArtType,
	ArtRevisionStatus,
	InputDate
)
VALUES
(
	@webNumber,
	@userid,
	@artTypeID,
	@artRevisionStatusID,
	@InputDate
)
RETURN @@IDENTITY



GO
