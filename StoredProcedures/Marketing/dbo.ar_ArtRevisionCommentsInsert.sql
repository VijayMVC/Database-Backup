/****** Object:  StoredProcedure [dbo].[ar_ArtRevisionCommentsInsert]    Script Date: 5/15/2018 12:10:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE ar_ArtRevisionCommentsInsert
(
	@TransactionID int,
	@Comment varchar(500),
	@InputDate datetime
)
 AS
INSERT INTO ar_ArtRevisionComments
(
	TransactionID,
	Comment,
	InputDate
)
VALUES
(
	@TransactionID,
	@Comment,
	@InputDate 
)


GO
