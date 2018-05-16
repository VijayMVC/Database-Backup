/****** Object:  StoredProcedure [dbo].[SICTemplateAdd]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SICTemplateAdd
(
	@StoreId int = NULL,
	@Id int = NULL,
	@Name varchar(50) = NULL,
	@SicCodes text = NULL
)
AS
INSERT INTO SICTemplate (StoreId, Id, Name, SicCodes)
 VALUES (@StoreId, @Id, @Name, @SicCodes);


GO
