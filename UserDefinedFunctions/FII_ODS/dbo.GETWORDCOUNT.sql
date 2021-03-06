/****** Object:  UserDefinedFunction [dbo].[GETWORDCOUNT]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 -- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com 
 -- GETWORDCOUNT() User-Defined Function Counts the words in a string.
 -- GETWORDCOUNT(@cString[, @cDelimiters])
 -- Parameters
 -- @cString  nvarchar(4000) - Specifies the string whose words will be counted. 
 -- @cDelimiters nvarchar(256) - Optional. Specifies one or more optional characters used to separate words in @cString.
 -- The default delimiters are space, tab, carriage return, and line feed. Note that GETWORDCOUNT( ) uses each of the characters in @cDelimiters as individual delimiters, not the entire string as a single delimiter. 
 -- Return Value smallint 
 -- Remarks GETWORDCOUNT() by default assumes that words are delimited by spaces or tabs. If you specify another character as delimiter, this function ignores spaces and tabs and uses only the specified character.
 -- If you use 'AAA aaa, BBB bbb, CCC ccc.' as the target string for dbo.GETWORDCOUNT(), you can get all the following results.
 -- declare @cString nvarchar(4000)
 -- set @cString = 'AAA aaa, BBB bbb, CCC ccc.'
 -- select dbo.GETWORDCOUNT(@cString, default)           -- 6 - character groups, delimited by ' '
 -- select dbo.GETWORDCOUNT(@cString, ',')               -- 3 - character groups, delimited by ','
 -- select dbo.GETWORDCOUNT(@cString, '.')               -- 1 - character group, delimited by '.'
 -- See Also GETWORDNUM(), GETALLWORDS(), GETNUMWORD(), GETOCCURSWORD(),  GETATWORD(), GETRATWORD()  User-Defined Functions  
 -- UDF the name and functionality of which correspond  to the  Visual FoxPro function  
CREATE FUNCTION GETWORDCOUNT
    (
      @cString NVARCHAR(4000) ,
      @cDelimiters NVARCHAR(256)
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE
            @k SMALLINT ,
            @nEndString SMALLINT ,
            @wordcount SMALLINT
        SELECT
            @k = 1 ,
            @wordcount = 0 ,
            @cDelimiters = ISNULL(@cDelimiters,
                                  NCHAR(32) + NCHAR(9) + NCHAR(10) + NCHAR(13)) , -- if no break string is specified, the function uses spaces, tabs, carriage return and line feed to delimit words.
            @nEndString = 1 + DATALENGTH(@cString)
            / ( CASE SQL_VARIANT_PROPERTY(@cString, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode

        WHILE CHARINDEX(SUBSTRING(@cString, @k, 1) COLLATE Latin1_General_BIN,
                        @cDelimiters COLLATE Latin1_General_BIN) > 0
            AND @nEndString > @k  -- skip opening break characters, if any
            SET @k = @k + 1

        IF @k < @nEndString 
            BEGIN
                SET @wordcount = 1 -- count the one we are in now count transitions from 'not in word' to 'in word' 
                               -- if the current character is a break char, but the next one is not, we have entered a new word
                WHILE @k < @nEndString 
                    BEGIN
                        IF @k + 1 < @nEndString
                            AND CHARINDEX(SUBSTRING(@cString, @k, 1) COLLATE Latin1_General_BIN,
                                          @cDelimiters COLLATE Latin1_General_BIN) > 0
                            AND CHARINDEX(SUBSTRING(@cString, @k + 1, 1) COLLATE Latin1_General_BIN,
                                          @cDelimiters COLLATE Latin1_General_BIN) = 0 
                            SELECT
                                @wordcount = @wordcount + 1 ,
                                @k = @k + 1 -- Skip over the first character in the word. We know it cannot be a break character.
                        SET @k = @k + 1
                    END
            END

        RETURN @wordcount
    END

GO
