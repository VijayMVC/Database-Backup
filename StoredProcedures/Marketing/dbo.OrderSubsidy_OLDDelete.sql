/****** Object:  StoredProcedure [dbo].[OrderSubsidy_OLDDelete]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderSubsidy_OLDDelete
(
	@OrdHid int,
	@OrdDId int,
	@OrdSHId int,
	@OrdSDType tinyint
)
AS
	DELETE FROM OrderSubsidy_OLD WHERE OrdHid=@OrdHid AND OrdDId=@OrdDId AND OrdSHId=@OrdSHId AND OrdSDType=@OrdSDType;
RETURN @@Rowcount;


GO
