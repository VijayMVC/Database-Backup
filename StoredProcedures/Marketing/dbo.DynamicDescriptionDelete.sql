/****** Object:  StoredProcedure [dbo].[DynamicDescriptionDelete]    Script Date: 5/15/2018 12:10:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.DynamicDescriptionDelete
(
	@DynDescId int
)
AS
	DELETE FROM DynamicDescription WHERE DynDescId=@DynDescId;
RETURN @@Rowcount;


GO
