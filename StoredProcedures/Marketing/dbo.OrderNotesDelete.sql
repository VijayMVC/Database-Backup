/****** Object:  StoredProcedure [dbo].[OrderNotesDelete]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderNotesDelete
(
	@OrdHId int,
	@OrdDId int,
	@OrdNId int
)
AS
	DELETE FROM OrderNotes WHERE OrdHId=@OrdHId AND OrdDId=@OrdDId AND OrdNId=@OrdNId;
RETURN @@Rowcount;


GO
