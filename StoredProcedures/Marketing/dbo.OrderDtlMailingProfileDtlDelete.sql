/****** Object:  StoredProcedure [dbo].[OrderDtlMailingProfileDtlDelete]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlMailingProfileDtlDelete
(
	@OrdDMPHId int,
	@OrdDMPDId int
)
AS
	DELETE FROM OrderDtlMailingProfileDtl WHERE OrdDMPHId=@OrdDMPHId AND OrdDMPDId=@OrdDMPDId;
RETURN @@Rowcount;


GO
