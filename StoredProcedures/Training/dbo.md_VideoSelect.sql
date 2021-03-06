/****** Object:  StoredProcedure [dbo].[md_VideoSelect]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE md_VideoSelect
(
	@videoID	int
)
AS

SET NOCOUNT ON

SELECT 
	videoID,
	title,
	description,
	length,
	eventTitle,
	eventDate,
	movRefUploadDate
FROM	
	md_videos
WHERE
	videoID = @videoID
GO
