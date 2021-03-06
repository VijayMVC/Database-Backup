/****** Object:  StoredProcedure [dbo].[md_CategoryCountVideosTotal]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE md_CategoryCountVideosTotal
(
	@CategoryID int
)
 AS
SET NOCOUNT ON
SELECT
	COUNT(*) 
FROM 
	md_VideosInCategories 
WHERE 
	CategoryID IN 
	(
	SELECT 
		CategoryID 
	FROM 
		md_categories A 
	WHERE 
		A.CategoryID = @CategoryID  OR A.ParentID = @CategoryID OR A.ParentID IN 
		(
		SELECT
			CategoryID 
		FROM 
			md_categories B 
		WHERE 
			B.ParentID = @CategoryID
		)
	)

GO
