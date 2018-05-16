/****** Object:  StoredProcedure [dbo].[md_RelatedLinkInsert]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_RelatedLinkInsert 
(
	@Link varchar (100),
	@Url varchar (200)
)
AS
INSERT INTO md_RelatedLinks
(
	Link,
	URL
)
VALUES
(
	@Link,
	@Url
)
RETURN @@IDENTITY

GO
