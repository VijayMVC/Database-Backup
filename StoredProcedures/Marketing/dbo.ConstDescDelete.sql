/****** Object:  StoredProcedure [dbo].[ConstDescDelete]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ConstDescDelete
(
	@ConstGroupId int,
	@ConstId int
)
AS
	DELETE FROM ConstDesc WHERE ConstGroupId=@ConstGroupId AND ConstId=@ConstId;
RETURN @@Rowcount;


GO
