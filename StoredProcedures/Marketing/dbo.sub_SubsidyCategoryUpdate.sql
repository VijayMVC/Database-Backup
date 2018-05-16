/****** Object:  StoredProcedure [dbo].[sub_SubsidyCategoryUpdate]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_SubsidyCategoryUpdate
(
	@SubHType int,
	@CategoryName varchar(50)
)
AS
UPDATE SubsidyCategories
SET
	CategoryName = @CategoryName
WHERE
	SubHType = @SubHType



GO
