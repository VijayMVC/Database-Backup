/****** Object:  UserDefinedFunction [dbo].[GETWORDNUM]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 -- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
 -- GETWORDNUM() User-Defined Function 
 -- Returns a specified word from a string.
 -- GETWORDNUM(@cString, @nIndex[, @cDelimiters])
 -- Parameters @cString  nvarchar(4000) - Specifies the string to be evaluated 
 -- @nIndex smallint - Specifies the index position of the word to be returned. For example, if @nIndex is 3, GETWORDNUM( ) returns the third word (if @cString contains three or more words). 
 -- @cDelimiters nvarchar(256) - Optional. Specifies one or more optional characters used to separate words in @cString.
 -- The default delimiters are space, tab, carriage return, and line feed. Note that GetWordNum( ) uses each of the characters in @cDelimiters as individual delimiters, not the entire string as a single delimiter. 
 -- Return Value nvarchar(4000)
 -- Remarks Returns the word at the position specified by @nIndex in the target string, @cString. If @cString contains fewer than @nIndex words, GETWORDNUM( ) returns an empty string.
 -- Example
 -- select dbo.GETWORDNUM('To be, or not to be: that is the question:', 10, ' ,.:') -- Displays 'question'
 -- See Also
 -- GETWORDCOUNT(), GETALLWORDS(), GETNUMWORD(), GETOCCURSWORD(),  GETATWORD(), GETRATWORD()  User-Defined Functions 
 -- UDF the name and functionality of which correspond  to the Visual FoxPro function  
CREATE FUNCTION GETWORDNUM
    (
      @cString NVARCHAR(4000) ,
      @nIndex SMALLINT ,
      @cDelimiters NVARCHAR(256)
    )
RETURNS NVARCHAR(4000)
AS 
    BEGIN
        DECLARE
            @i SMALLINT ,
            @j SMALLINT ,
            @k SMALLINT ,
            @l SMALLINT ,
            @lmin SMALLINT ,
            @nEndString SMALLINT ,
            @LenDelimiters SMALLINT ,
            @cWord NVARCHAR(4000)
        SELECT
            @i = 1 ,
            @k = 1 ,
            @l = 0 ,
            @cWord = '' ,
            @cDelimiters = ISNULL(@cDelimiters,
                                  NCHAR(32) + NCHAR(9) + NCHAR(10) + NCHAR(13)) , -- if no break string is specified, the function uses spaces, tabs, carriage return and line feed to delimit words.
            @nEndString = 1 + DATALENGTH(@cString)
            / ( CASE SQL_VARIANT_PROPERTY(@cString, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) , -- for unicode
            @LenDelimiters = DATALENGTH(@cDelimiters)
            / ( CASE SQL_VARIANT_PROPERTY(@cDelimiters, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode

        WHILE @i <= @nIndex 
            BEGIN
                WHILE CHARINDEX(SUBSTRING(@cString, @k, 1) COLLATE Latin1_General_BIN,
                                @cDelimiters COLLATE Latin1_General_BIN) > 0
                    AND @nEndString > @k   -- skip opening break characters, if any
                    SET @k = @k + 1

                IF @k >= @nEndString 
                    BREAK

                SELECT
                    @j = 1 ,
                    @lmin = @nEndString -- find next break character it marks the end of this word
                WHILE @j <= @LenDelimiters 
                    BEGIN
                        SET @l = CHARINDEX(SUBSTRING(@cDelimiters, @j, 1) COLLATE Latin1_General_BIN,
                                           @cString COLLATE Latin1_General_BIN,
                                           @k)
                        SET @j = @j + 1
                        IF @l > 0
                            AND @lmin > @l 
                            SET @lmin = @l
                    END

                IF @i = @nIndex -- this is the actual word we are looking for
                    BEGIN
                        SET @cWord = SUBSTRING(@cString, @k, @lmin - @k)
                        BREAK
                    END
                SET @k = @lmin + 1

                IF ( @k >= @nEndString ) 
                    BREAK
                SET @i = @i + 1
            END

        RETURN @cWord
    END

GO
