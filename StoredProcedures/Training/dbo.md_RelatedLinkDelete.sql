/****** Object:  StoredProcedure [dbo].[md_RelatedLinkDelete]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkDelete 
(
	@LinkID int
)
AS
SET NOCOUNT ON
DELETE FROM md_RelatedLinks
WHERE LinkID = @LinkID

GO
