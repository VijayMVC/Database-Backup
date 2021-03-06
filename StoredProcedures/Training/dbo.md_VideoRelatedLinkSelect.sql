/****** Object:  StoredProcedure [dbo].[md_VideoRelatedLinkSelect]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_VideoRelatedLinkSelect
(
	@videoID int
)
 AS
SET NOCOUNT ON
SELECT
	A.linkid, 
	A.link, 
	A.url 
FROM
	md_relatedlinks A
INNER JOIN
	md_relatedLinksInVideos B
ON
	A.linkid = B.linkid
WHERE 
	B.videoID = @videoID
ORDER BY
	A.link

GO
