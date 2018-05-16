/****** Object:  StoredProcedure [dbo].[md_VideoRemoveFromCategoryDelete]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_VideoRemoveFromCategoryDelete	
(
	@CategoryID int,
	@VideoID int
)
 AS
SET NOCOUNT ON
DELETE FROM md_VideosInCategories
WHERE 
	categoryID = @CategoryID
AND
	videoID = @videoID

GO
