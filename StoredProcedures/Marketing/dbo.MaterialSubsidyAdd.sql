/****** Object:  StoredProcedure [dbo].[MaterialSubsidyAdd]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialSubsidyAdd
(
	@MatId int = NULL,
	@SubHId int = NULL
)
AS
INSERT INTO MaterialSubsidy (MatId, SubHId)
 VALUES (@MatId, @SubHId);


GO
