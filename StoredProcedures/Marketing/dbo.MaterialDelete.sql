/****** Object:  StoredProcedure [dbo].[MaterialDelete]    Script Date: 5/15/2018 12:10:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE PROCEDURE dbo.MaterialDelete
(
	@MatId int
)
AS
	DELETE FROM Material WHERE MatId=@MatId;
RETURN @@Rowcount;


GO
