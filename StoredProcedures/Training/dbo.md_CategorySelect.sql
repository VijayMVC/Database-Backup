/****** Object:  StoredProcedure [dbo].[md_CategorySelect]    Script Date: 5/15/2018 12:13:20 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE md_CategorySelect 
(
	@CategoryID int
)
AS
SET NOCOUNT ON
SELECT Category
FROM md_Categories
WHERE CategoryID = @CategoryID

GO
