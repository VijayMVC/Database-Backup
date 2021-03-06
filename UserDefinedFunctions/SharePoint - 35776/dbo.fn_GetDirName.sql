/****** Object:  UserDefinedFunction [dbo].[fn_GetDirName]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetDirName (@Url nvarchar(260), @iSlash int)  
RETURNS nvarchar(256) AS  
BEGIN 
    DECLARE @DirName nvarchar(256)
    IF @iSlash = -1
        SET @iSlash = CHARINDEX(N'/', REVERSE(@Url) COLLATE Latin1_General_BIN)
    SET @DirName =
    CASE
        WHEN @iSlash > 0 THEN 
            LEFT(@Url, DATALENGTH(@Url)/2 - @iSlash)
        ELSE
            N''
    END
    RETURN @DirName
END

GO
