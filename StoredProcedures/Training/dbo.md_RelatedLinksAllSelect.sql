/****** Object:  StoredProcedure [dbo].[md_RelatedLinksAllSelect]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
/* Return all stored links. */
CREATE PROCEDURE md_RelatedLinksAllSelect
AS
SET NOCOUNT ON
SELECT 
	LinkID, 
	Link, 
	URL
FROM 
	md_RelatedLinks

GO
