/****** Object:  StoredProcedure [dbo].[md_VideoAddInCategoryInsert]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_VideoAddInCategoryInsert
(
	@CategoryID int,
	@VideoID int
)
 AS
SET NOCOUNT ON
INSERT INTO md_VideosInCategories
(
	categoryID,
	videoID
)
VALUES
(
	@CategoryID,
	@VideoID
)

GO
