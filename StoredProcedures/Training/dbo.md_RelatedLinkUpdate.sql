/****** Object:  StoredProcedure [dbo].[md_RelatedLinkUpdate]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkUpdate
(
	@LinkID int,
	@Link varchar (100),
	@Url varchar (200)
)
 AS
UPDATE md_RelatedLinks
SET 
	link = @Link,
	Url = @Url
WHERE
	LinkID = @LinkID

GO
