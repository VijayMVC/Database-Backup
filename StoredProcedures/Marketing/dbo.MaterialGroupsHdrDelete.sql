/****** Object:  StoredProcedure [dbo].[MaterialGroupsHdrDelete]    Script Date: 5/15/2018 12:10:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsHdrDelete
(
	@MatGHId int
)
AS
	DELETE FROM MaterialGroupsHdr WHERE MatGHId=@MatGHId;
RETURN @@Rowcount;


GO
