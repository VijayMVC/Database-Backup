/****** Object:  StoredProcedure [dbo].[md_RelatedLinkAddInVideo]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkAddInVideo
(
	@LinkID int,
	@VideoID int
)
 AS
SET NOCOUNT ON
INSERT INTO md_RelatedLinksInVideos
(
	LinkID,
	videoID
)
VALUES
(
	@LinkID,
	@VideoID
)

GO
