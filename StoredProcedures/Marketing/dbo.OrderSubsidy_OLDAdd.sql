/****** Object:  StoredProcedure [dbo].[OrderSubsidy_OLDAdd]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderSubsidy_OLDAdd
(
	@OrdSStoreId int = NULL,
	@OrdHid int = NULL,
	@OrdDId int = NULL,
	@OrdSHId int = NULL,
	@OrdSDType tinyint = NULL,
	@OrdSHType int = NULL,
	@OrdDPrdId int = NULL,
	@OrdSAmount float = NULL
)
AS
INSERT INTO OrderSubsidy_OLD (OrdSStoreId, OrdHid, OrdDId, OrdSHId, OrdSDType, OrdSHType, OrdDPrdId, OrdSAmount)
 VALUES (@OrdSStoreId, @OrdHid, @OrdDId, @OrdSHId, @OrdSDType, @OrdSHType, @OrdDPrdId, @OrdSAmount);


GO
