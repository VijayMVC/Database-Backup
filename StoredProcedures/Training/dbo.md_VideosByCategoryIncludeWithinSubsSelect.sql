/****** Object:  StoredProcedure [dbo].[md_VideosByCategoryIncludeWithinSubsSelect]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE md_VideosByCategoryIncludeWithinSubsSelect
(
	@CategoryID int
)
 AS

SET NOCOUNT ON

SELECT DISTINCT
	A.videoID,
	A.title,
	A.description,
	A.length,
	A.eventTitle,
	A.eventDate,
	A.movRefUploadDate
FROM 
	md_videos A 
INNER JOIN 
	md_videosincategories B
ON
	A.VideoID = B.VideoID 
WHERE 
	CategoryID IN 
	(
	SELECT 
		CategoryID 
	FROM 
		md_categories C 
	WHERE 
		C.CategoryID = @CategoryID  OR C.ParentID = @CategoryID OR C.ParentID IN 
		(
		SELECT
			CategoryID 
		FROM 
			md_categories D 
		WHERE 
			D.ParentID = @CategoryID
		)
	)
ORDER BY
	A.Description, A.VideoID
GO
