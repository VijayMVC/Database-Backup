/****** Object:  UserDefinedFunction [dbo].[fn_IsCategoryParent]    Script Date: 5/15/2018 12:15:17 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE FUNCTION dbo.fn_IsCategoryParent
(
	@CategoryID int
)  
RETURNS bit AS  
BEGIN 
	DECLARE @RetVal bit,	
	@Count int 
	SELECT @Count = Count(CategoryID)
	FROM md_Categories
	WHERE ParentID = @CategoryID
	IF @Count IS NOT NULL AND @Count > 0
		BEGIN
			SELECT @RetVal = 1
		END
	ELSE
		BEGIN
			SELECT @RetVal = 0
		END	
	RETURN @RetVal
END

GO
