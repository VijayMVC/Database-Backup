/****** Object:  StoredProcedure [dbo].[SubsidyHdrDelete]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SubsidyHdrDelete
(
	@SubHId int
)
AS
	DELETE FROM SubsidyHdr WHERE SubHId=@SubHId;
RETURN @@Rowcount;


GO
