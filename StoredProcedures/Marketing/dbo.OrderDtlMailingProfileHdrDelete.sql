/****** Object:  StoredProcedure [dbo].[OrderDtlMailingProfileHdrDelete]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlMailingProfileHdrDelete
(
	@OrdDMPHId int
)
AS
	DELETE FROM OrderDtlMailingProfileHdr WHERE OrdDMPHId=@OrdDMPHId;
RETURN @@Rowcount;


GO
