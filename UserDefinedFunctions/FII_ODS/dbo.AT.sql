/****** Object:  UserDefinedFunction [dbo].[AT]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- AT, RAT, OCCURS, PADC, PADR, PADL,CHRTRAN, STRFILTER, STRTRAN, WORDTRAN
-- GETALLWORDS, GETWORDCOUNT, GETWORDNUM, GETNUMWORD, GETOCCURSWORD, GETATWORD, GETRATWORD
-- PROPER, RCHARINDEX, ARABTOROMAN, ROMANTOARAB
-- AT()  Returns the beginning numeric position of the nth occurrence of a character expression within
--       another character expression, counting from the leftmost character
-- RAT() Returns the numeric position of the last (rightmost) occurrence of a character string within 
--       another character string
-- OCCURS() Returns the number of times a character expression occurs within another character expression
-- PADL()   Returns a string from an expression, padded with spaces or characters to a specified length on the left side
-- PADR()   Returns a string from an expression, padded with spaces or characters to a specified length on the right side
-- PADC()   Returns a string from an expression, padded with spaces or characters to a specified length on the both sides
-- CHRTRAN()   Replaces each character in a character expression that matches a character in a second character expression
--             with the corresponding character in a third character expression.
-- STRFILTER() Removes all characters from a string except those specified. 
-- STRTRAN()   Searches a character expression for occurrences of a second character expression,
--             and then replaces each occurrence with a third character expression.
--             Unlike a built-in function replace, STRTRAN has three additional parameters.
-- WORDTRAN() Searches a character string for occurrences of a first word, and then replaces each occurrence with a second word.
-- GETALLWORDS()  Inserts the words from a string into the table
-- GETWORDCOUNT() Counts the words in a string
-- GETWORDNUM()  Returns a specified word from a string
-- GETNUMWORD()  Returns the index position of a word in a string.
-- GETOCCURSWORD() Returns the number of times a word occurs within the character string.
-- GETATWORD()  Returns the beginning numeric position of the nth occurrence of a word within the character string, counting from the leftmost character.
-- GETRATWORD() Returns the numeric position of the last (rightmost) occurrence of a word within the character string.
-- PROPER() Returns from a character expression a string capitalized as appropriate for proper names
-- RCHARINDEX()  Similar to the Transact-SQL function Charindex, with a Right search
-- ARABTOROMAN() Returns the character Roman numeral equivalent of a specified numeric expression (from 1 to 3999)
-- ROMANTOARAB() Returns the number equivalent of a specified character Roman numeral expression (from I to MMMCMXCIX)
-- Examples:   GETWORDCOUNT, GETWORDNUM, GETNUMWORD
-- select  dbo.GETWORDCOUNT('User-Defined marvellous string Functions Transact-SQL', default)
-- select  dbo.GETWORDNUM('User-Defined marvellous string Functions Transact-SQL', 2, default)
-- select  dbo.GETNUMWORD('O Canada! Our home and native land!', 'Canada!', default, 1, 0)  --  Displays 2
-- Examples:  CHRTRAN, STRFILTER
-- select dbo.CHRTRAN('ABCDEF', 'ACE', 'XYZ')   -- Displays XBYDZF
-- select dbo.STRFILTER('ABCDABCDABCD', 'AB')   -- Displays ABABAB
-- AT, RAT, OCCURS, PROPER  
-- select  dbo.AT ('marvellous', 'User-Defined marvellous string Functions Transact-SQL', default)
-- select  dbo.OCCURS ('F', 'User-Defined marvellous string Functions Transact-SQL')
-- select  dbo.PROPER ('User-Defined marvellous string Functions Transact-SQL')
-- PADC, PADR, PADL 
-- select  dbo.PADC (' marvellous string Functions', 60, '+*+')
-- ARABTOROMAN, ROMANTOARAB
-- select dbo.ARABTOROMAN(3888)      -- Displays MMMDCCCLXXXVIII
-- select dbo.ROMANTOARAB('CCXXXIV') -- Displays 234
-- For more information about string UDFs Transact-SQL please visit the 
-- http://www.universalthread.com/wconnect/wc.dll?LevelExtreme~2,54,33,27115   or 
-- http://nikiforov.developpez.com/espagnol/  (the Spanish language)
-- http://nikiforov.developpez.com/           (the French  language)
-- http://nikiforov.developpez.com/allemand/  (the German  language)
-- http://nikiforov.developpez.com/italien/   (the Italian language)
-- http://nikiforov.developpez.com/portugais/ (the Portuguese language)
-- http://nikiforov.developpez.com/roumain/   (the Roumanian  language)
-- http://nikiforov.developpez.com/russe/     (the Russian language)
-- http://nikiforov.developpez.com/bulgare/   (the Bulgarian language)
--------------------------------------------------------------------------------------------------------
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
-- AT() User-Defined Function 
-- Returns the beginning numeric position of the first occurrence of a character expression within another character expression, counting from the leftmost character.
-- (including  overlaps)
-- AT(@cSearchExpression, @cExpressionSearched [, @nOccurrence]) Return Values smallint 
-- Parameters
-- @cSearchExpression nvarchar(4000) Specifies the character expression that AT( ) searches for in @cExpressionSearched. 
-- @cExpressionSearched nvarchar(4000) Specifies the character expression @cSearchExpression searches for. 
-- @nOccurrence smallint Specifies which occurrence (first, second, third, and so on) of @cSearchExpression is searched for in @cExpressionSearched. By default, AT() searches for the first occurrence of @cSearchExpression (@nOccurrence = 1). Including @nOccurrence lets you search for additional occurrences of @cSearchExpression in @cExpressionSearched. AT( ) returns 0 if @nOccurrence is greater than the number of times @cSearchExpression occurs in @cExpressionSearched. 
-- Remarks
-- AT() searches the second character expression for the first occurrence of the first character expression. It then returns an integer indicating the position of the first character in the character expression found. If the character expression is not found, AT() returns 0. The search performed by AT() is case-sensitive.
-- AT is nearly similar to a function Oracle PL/SQL INSTR
-- Example
-- declare @gcString nvarchar(4000), @gcFindString nvarchar(4000)
-- select @gcString = 'Now is the time for all good men', @gcFindString = 'is the'
-- select dbo.AT(@gcFindString, @gcString, default)  -- Displays 5
-- set @gcFindString = 'IS'
-- select dbo.AT(@gcFindString, @gcString, default)  -- Displays 0, case-sensitive
-- select @gcString = 'goood men', @gcFindString = 'oo'
-- select dbo.AT(@gcFindString, @gcString, 1)  -- Displays 2
-- select dbo.AT(@gcFindString, @gcString, 2)  -- Displays 3, including  overlaps
-- See Also RAT(), ATC(), AT2()  User-Defined Function 
-- UDF the name and functionality of which correspond  to the  Visual FoxPro function  
CREATE FUNCTION AT
    (
      @cSearchExpression NVARCHAR(4000) ,
      @cExpressionSearched NVARCHAR(4000) ,
      @nOccurrence SMALLINT = 1 
    )
RETURNS SMALLINT
AS 
    BEGIN
        IF @nOccurrence > 0 
            BEGIN
                DECLARE
                    @i SMALLINT ,
                    @StartingPosition SMALLINT
                SELECT
                    @i = 0 ,
                    @StartingPosition = -1
                WHILE @StartingPosition <> 0
                    AND @nOccurrence > @i 
                    SELECT
                        @i = @i + 1 ,
                        @StartingPosition = CHARINDEX(@cSearchExpression COLLATE Latin1_General_BIN,
                                                      @cExpressionSearched COLLATE Latin1_General_BIN,
                                                      @StartingPosition + 1)
            END
        ELSE 
            SET @StartingPosition = NULL

        RETURN @StartingPosition
    END

GO
