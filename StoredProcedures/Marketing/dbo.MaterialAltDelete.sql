/****** Object:  StoredProcedure [dbo].[MaterialAltDelete]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialAltDelete
(
	@MatId int,
	@MatAltId int
)
AS
	DELETE FROM MaterialAlt WHERE MatId=@MatId AND MatAltId=@MatAltId;
RETURN @@Rowcount;


GO
