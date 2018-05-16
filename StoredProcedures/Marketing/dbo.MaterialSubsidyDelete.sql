/****** Object:  StoredProcedure [dbo].[MaterialSubsidyDelete]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialSubsidyDelete
(
	@MatId int,
	@SubHId int
)
AS
	DELETE FROM MaterialSubsidy WHERE MatId=@MatId AND SubHId=@SubHId;
RETURN @@Rowcount;


GO
