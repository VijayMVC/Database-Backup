/****** Object:  UserDefinedFunction [dbo].[fn_MaterialAltsGet]    Script Date: 5/15/2018 12:14:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION fn_MaterialAltsGet
(
	@MaterialID int
)

RETURNS varchar(250)
AS
BEGIN

	DECLARE @Name varchar(50),
	@retVal varchar(250)

	SELECT @retVal = ''

	DECLARE curCat CURSOR FOR
		SELECT [Name] = M.MatVendorSku + ' - ' + M.MatName
		FROM Material M INNER JOIN MaterialAlt A
		ON M.MatID = A.MatAltId AND A.MatId = @MaterialID
		ORDER BY A.MatAltOrder Asc

	OPEN curCat
	
	FETCH NEXT FROM curCat INTO @Name
	WHILE @@FETCH_STATUS = 0 BEGIN

		SELECT @retVal = @retVal + @Name + ', '		

		FETCH NEXT FROM curCat INTO @Name
	END
	CLOSE curCat
	DEALLOCATE curCat

	IF Len(@retVal) = 0
		BEGIN
			SELECT @retVal = ', '
		END

	SELECT @retVal = Left(@retVal, Len(@retVal) - 1)

	RETURN @retVal

END

GO
