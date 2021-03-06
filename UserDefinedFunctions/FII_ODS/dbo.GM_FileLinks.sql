/****** Object:  UserDefinedFunction [dbo].[GM_FileLinks]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Tim Fleck
-- Create date: 8/5/16
-- Description:	Filters out the file name from CONTSUPP.LINKEDDOC in GoldMine
-- =============================================
CREATE FUNCTION GM_FileLinks
(
	-- Add the parameters for the function here
	@LinkData VARCHAR(2000)
)
RETURNS VARCHAR(2000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @FileName AS VARCHAR(2000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @FileName=REPLACE(word,'~~FILENAME=','')  FROM FII_ODS.[dbo].[GETALLWORDS](@LinkData,CHAR(10))
WHERE Word LIKE '~~FILENAME=%'

	RETURN @FileName

END

GO
