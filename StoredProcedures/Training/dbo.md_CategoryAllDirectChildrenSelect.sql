/****** Object:  StoredProcedure [dbo].[md_CategoryAllDirectChildrenSelect]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_CategoryAllDirectChildrenSelect
(
	@CategoryID int 
)
 AS
SET NOCOUNT ON
SELECT 
	CategoryID,
	Category
FROM
	md_Categories
WHERE
	ParentID = @CategoryID

GO
