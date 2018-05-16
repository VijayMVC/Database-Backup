/****** Object:  StoredProcedure [dbo].[RMPDtlDelete]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.RMPDtlDelete
(
	@RMPHId int,
	@RMPDId int
)
AS
	DELETE FROM RMPDtl WHERE RMPHId=@RMPHId AND RMPDId=@RMPDId;
RETURN @@Rowcount;


GO
