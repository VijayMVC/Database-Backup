/****** Object:  StoredProcedure [dbo].[ConstDescGroupDelete]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ConstDescGroupDelete
(
	@ConstGroupId int
)
AS
	DELETE FROM ConstDescGroup WHERE ConstGroupId=@ConstGroupId;
RETURN @@Rowcount;


GO
