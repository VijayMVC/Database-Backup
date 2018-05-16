/****** Object:  StoredProcedure [dbo].[SubsidyLogDelete]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SubsidyLogDelete
(
	@SubLYear smallint,
	@SubLId int
)
AS
	DELETE FROM SubsidyLog WHERE SubLYear=@SubLYear AND SubLId=@SubLId;
RETURN @@Rowcount;


GO
