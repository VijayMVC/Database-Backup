/****** Object:  StoredProcedure [dbo].[md_RelatedLinkCountVideos]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkCountVideos 
(
	@LinkID int
)
AS
SELECT COUNT(*) FROM md_RelatedLinksInVideos
WHERE LinkID = @LinkID

GO
