/****** Object:  StoredProcedure [dbo].[md_RelatedLinkRemoveFromVideo]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkRemoveFromVideo
(
	@VideoID int,
	@LinkID int
)
 AS
SET NOCOUNT ON
DELETE FROM md_RelatedLinksInVideos
WHERE 
	VideoID= @VideoID
AND
	LinkID = @LinkID

GO
