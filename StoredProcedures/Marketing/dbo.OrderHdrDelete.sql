/****** Object:  StoredProcedure [dbo].[OrderHdrDelete]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderHdrDelete
(
	@OrdHId int
)
AS
	DELETE FROM OrderHdr WHERE OrdHId=@OrdHId;
RETURN @@Rowcount;


GO
