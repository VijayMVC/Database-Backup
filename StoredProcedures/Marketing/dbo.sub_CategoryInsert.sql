/****** Object:  StoredProcedure [dbo].[sub_CategoryInsert]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_CategoryInsert
(
	@CategoryName varchar(50)
)
AS
INSERT INTO SubsidyCategories(CategoryName)
VALUES(@CategoryName)



GO
