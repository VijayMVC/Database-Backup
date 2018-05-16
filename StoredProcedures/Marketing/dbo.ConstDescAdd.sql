/****** Object:  StoredProcedure [dbo].[ConstDescAdd]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ConstDescAdd
(
	@ConstGroupId int = NULL,
	@ConstId int = NULL,
	@Description varchar(50) = NULL
)
AS
INSERT INTO ConstDesc (ConstGroupId, ConstId, Description)
 VALUES (@ConstGroupId, @ConstId, @Description);


GO
