/****** Object:  StoredProcedure [dbo].[SICTemplateHdrDelete]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SICTemplateHdrDelete
(
	@SicHId int
)
AS
	DELETE FROM SICTemplateHdr WHERE SicHId=@SicHId;
RETURN @@Rowcount;


GO
