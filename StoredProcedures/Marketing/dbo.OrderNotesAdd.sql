/****** Object:  StoredProcedure [dbo].[OrderNotesAdd]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderNotesAdd
(
	@OrdHId int = NULL,
	@OrdDId int = NULL,
	@OrdNId int = NULL,
	@OrdNType tinyint = NULL,
	@OrdNMessage text = NULL,
	@OrdNDate smalldatetime = NULL
)
AS
INSERT INTO OrderNotes (OrdHId, OrdDId, OrdNId, OrdNType, OrdNMessage, OrdNDate)
 VALUES (@OrdHId, @OrdDId, @OrdNId, @OrdNType, @OrdNMessage, @OrdNDate);


GO
