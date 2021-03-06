/****** Object:  UserDefinedFunction [dbo].[fn_GetLeafName]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetLeafName (@Url nvarchar(260), @iSlash int)  
RETURNS nvarchar(128) AS  
BEGIN 
    DECLARE @LeafName nvarchar(128)
    IF @iSlash = -1
        SET @iSlash = CHARINDEX(N'/', REVERSE(@Url) COLLATE Latin1_General_BIN)
    SET @LeafName =
    CASE
        WHEN @iSlash > 0 THEN 
            RIGHT(@Url, @iSlash - 1)
        ELSE
            @Url
    END
    RETURN @LeafName
END

GO
