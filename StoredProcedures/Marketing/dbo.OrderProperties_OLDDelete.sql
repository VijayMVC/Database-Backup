/****** Object:  StoredProcedure [dbo].[OrderProperties_OLDDelete]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderProperties_OLDDelete
(
	@OrdPId int
)
AS
	DELETE FROM OrderProperties_OLD WHERE OrdPId=@OrdPId;
RETURN @@Rowcount;


GO
