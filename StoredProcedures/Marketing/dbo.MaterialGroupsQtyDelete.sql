/****** Object:  StoredProcedure [dbo].[MaterialGroupsQtyDelete]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsQtyDelete
(
	@MatGQId int
)
AS
	DELETE FROM MaterialGroupsQty WHERE MatGQId=@MatGQId;
RETURN @@Rowcount;


GO
