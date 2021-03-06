/****** Object:  UserDefinedFunction [dbo].[GETOCCURSWORD]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com 
-- GETOCCURSWORD() User-Defined Function Returns the number of times a word occurs within the character string.
-- GETOCCURSWORD(@cString, @cWord[, @cDelimiters] [, @nFlags])
-- Returns the number of times a word occurs within the character string.
-- If @cString don't contain the word @cWord, GETOCCURSWORD() returns 0.
-- Return Value  smallint
-- Parameters
-- @cString Specifies the string to be evaluated
-- @cWord Specifies the word to search for in @cString.
-- @cDelimiters Optional. Specifies one or more optional characters used to separate words in @cString. The default delimiters are space, tab, carriage return, and line feed.
-- The maximum length of lcDelimiters is 256.
-- Note that GETOCCURSWORD() uses each of the characters in @cDelimiters as individual delimiters, not the entire string as a single delimiter.
-- @nFlags  Specifies Case-sensitive search criteria to apply to this function. Valid Values are 0 (the Default) And 1.
-- 0 Case-sensitive search
-- 1 Case insensitive search 
-- In order to accommodate the @nFlags parameter, you will need to bypass the optional parameters by passing a value of default.
-- Examples 
-- declare @lcString as nvarchar(1000)
-- select @lcString = 'O Canada!
-- Our home and native land!
-- True patriot love in all thy sons command.
-- With glowing hearts we see thee rise,
-- The True North strong and free!
-- From far and wide, O Canada, we stand on guard for thee.
-- God keep our land glorious and free!
-- O Canada, we stand on guard for thee.
-- O Canada, we stand on guard for thee.'
-- select dbo.GETOCCURSWORD(@lcString,  'Canada', ' ,.!?', default)  --  Displays 4
-- Sometime the search for substring from a string will return the incorrect result,
-- it is necessary to search for the word in the string.
-- declare @lcAdmissibleCodes nvarchar(4000), @lcCodeforChecking  nvarchar(4000)
-- set @lcAdmissibleCodes = 'W,WN,IR,IU'
-- set @lcCodeforChecking = 'I'
-- select dbo.OCCURS(@lcCodeforChecking, @lcAdmissibleCodes)    -- Displays 2
-- select dbo.GETOCCURSWORD(@lcAdmissibleCodes, @lcCodeforChecking, ',' + Space(1), default) -- Displays  0
-- set @lcCodeforChecking = 'IR,'
-- select dbo.OCCURS(@lcCodeforChecking, @lcAdmissibleCodes)   --   Displays 1
-- select dbo.GETOCCURSWORD(@lcAdmissibleCodes, @lcCodeforChecking, ',' + Space(1), default) -- Displays  0
-- set @lcAdmissibleCodes = 'W,WN,IR,IU,WN,DS'
-- set @lcCodeforChecking = 'WN'
-- select dbo.GETOCCURSWORD(@lcAdmissibleCodes, @lcCodeforChecking, ',' + Space(1), default) -- Displays  2
-- See Also  GETATWORD(), WORDTRAN(), GETNUMWORD(), GETWORDNUM(), GETWORDCOUNT(), GETALLWORDS(), GETALLWORDS2()
CREATE FUNCTION [dbo].[GETOCCURSWORD]
    (
      @cString NVARCHAR(4000) ,
      @cWord NVARCHAR(4000) ,
      @cDelimiters NVARCHAR(256) = NULL ,
      @nFlags BIT = 0 
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE
            @k SMALLINT ,
            @nEndString SMALLINT ,
            @nLenWord SMALLINT ,
            @BegOfWord SMALLINT ,
            @lnOccurrence SMALLINT ,
            @exit BIT ,
            @comparison BIT 

        SELECT
            @BegOfWord = 1 ,
            @lnOccurrence = 0 ,
            @exit = 0 ,
            @cString = ISNULL(@cString, '') ,
            @k = 0 ,
            @cDelimiters = ISNULL(@cDelimiters,
                                  NCHAR(32) + NCHAR(9) + NCHAR(10) + NCHAR(13)) , -- if no break string is specified, the function uses spaces, tabs, carriage return and line feed to delimit words.
            @nEndString = 1 + DATALENGTH(@cString)
            / ( CASE SQL_VARIANT_PROPERTY(@cString, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) , -- for unicode,
            @nLenWord = DATALENGTH(@cWord)
            / ( CASE SQL_VARIANT_PROPERTY(@cWord, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode


        WHILE 1 > 0 
            BEGIN
                IF ( @k > @BegOfWord )  -- BegOfWord begin of previous word
                    BEGIN  
                        IF ( @nLenWord = ( @k - @BegOfWord ) ) -- length of previous word
                            BEGIN
                                IF @nFlags > 0  --  Case insensitive search
                                    SELECT
                                        @comparison = CHARINDEX(LOWER(SUBSTRING(@cString,
                                                              @BegOfWord,
                                                              @nLenWord)) COLLATE Latin1_General_BIN,
                                                              LOWER(@cWord) COLLATE Latin1_General_BIN)
                                ELSE --  Case-sensitive search
                                    SELECT
                                        @comparison = CHARINDEX(SUBSTRING(@cString,
                                                              @BegOfWord,
                                                              @nLenWord) COLLATE Latin1_General_BIN,
                                                              @cWord COLLATE Latin1_General_BIN)
                                IF @comparison = 1 
                                    SELECT
                                        @lnOccurrence = @lnOccurrence + 1
                            END 
                    END 
                IF @exit = 1 
                    BREAK
                SELECT
                    @k = @k + 1 -- Skip over the first break character.
                WHILE CHARINDEX(SUBSTRING(@cString, @k, 1)  COLLATE Latin1_General_BIN,
                                @cDelimiters COLLATE Latin1_General_BIN) > 0
                    AND @nEndString > @k  -- skip  break characters, if any
                    SELECT
                        @k = @k + 1 
                SELECT
                    @BegOfWord = @k 
                SELECT
                    @k = @k + 1 -- Skip over the first character in the word. We know it can not be a break character.
                WHILE CHARINDEX(SUBSTRING(@cString, @k, 1)  COLLATE Latin1_General_BIN,
                                @cDelimiters COLLATE Latin1_General_BIN) = 0
                    AND @nEndString > @k  -- skip  the character in the word
                    SELECT
                        @k = @k + 1 
                IF @k >= @nEndString 
                    SELECT
                        @exit = 1
            END 

        RETURN @lnOccurrence
    END

GO
