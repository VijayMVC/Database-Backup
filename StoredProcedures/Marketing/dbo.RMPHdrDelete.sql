/****** Object:  StoredProcedure [dbo].[RMPHdrDelete]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.RMPHdrDelete
(
	@RMPHId int
)
AS
	DELETE FROM RMPHdr WHERE RMPHId=@RMPHId;
RETURN @@Rowcount;


GO
