/****** Object:  StoredProcedure [dbo].[md_VideosByCategory]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_VideosByCategory
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
	CategoryID = @CategoryID
ORDER BY
	A.Title, A.VideoID
GO
