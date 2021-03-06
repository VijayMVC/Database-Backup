/****** Object:  UserDefinedFunction [dbo].[fn_GetFullUrl]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetFullUrl(
    @DirName nvarchar(256), 
    @LeafName nvarchar(128))
RETURNS nvarchar(260)
AS
BEGIN
    RETURN CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
END

GO
