/****** Object:  UserDefinedFunction [dbo].[STRTRAN]    Script Date: 5/15/2018 12:15:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
-- STRTRAN() User-Defined Function
-- Searches a character expression for occurrences of a second character expression,
-- and then replaces each occurrence with a third character expression.
-- STRTRAN  (@cSearched, @cExpressionSought , [@cReplacement]
-- [, @nStartOccurrence] [, @nNumberOfOccurrences] [, @nFlags])
-- Return Values nvarchar(4000) 
-- Parameters
-- @cSearched         Specifies the character expression that is searched.
-- @cExpressionSought Specifies the character expression that is searched for in @cSearched.
-- @cReplacement      Specifies the character expression that replaces every occurrence of @cExpressionSought in @cSearched.
-- If you omit @cReplacement, every occurrence of @cExpressionSought is replaced with the empty string. 
-- @nStartOccurrence  Specifies which occurrence of @cExpressionSought is the first to be replaced.
-- For example, if @nStartOccurrence is 4, replacement begins with the fourth occurrence of @cExpressionSought in @cSearched and the first three occurrences of @cExpressionSought remain unchanged.
-- The occurrence where replacement begins defaults to the first occurrence of @cExpressionSought if you omit @nStartOccurrence. 
-- @nNumberOfOccurrences  Specifies the number of occurrences of @cExpressionSought to replace.
-- If you omit @nNumberOfOccurrences, all occurrences of @cExpressionSought, starting with the occurrence specified with @nStartOccurrence, are replaced. 
-- @nFlags  Specifies the case-sensitivity of a search according to the following values:
---------------------------------------------------------------------------------------------------------------------------------------             
-- @nFlags     Description 
-- 0 (default) Search is case-sensitive, replace is with exact @cReplacement string.
-- 1           Search is case-insensitive, replace is with exact @cReplacement string. 
-- 2           Search is case-sensitive; replace is with the case of @cReplacement changed to match the case of the string found.
--             The case of @cReplacement will only be changed if the string found is all uppercase, lowercase, or proper case. 
-- 3           Search is case-insensitive; replace is with the case of @cReplacement changed to match the case of the string found.
--             The case of @cReplacement will only be changed if the string found is all uppercase, lowercase, or proper case. 
---------------------------------------------------------------------------------------------------------------------------------------             
-- Remarks
-- You can specify where the replacement begins and how many replacements are made.
-- STRTRAN( ) returns the resulting character string. 
-- Specify –1 for optional parameters you want to skip over if you just need to specify the @nFlags setting.
-- Example
-- select dbo.STRTRAN('ABCDEF', 'ABC', 'XYZ',-1,-1,0)      -- Displays XYZDEF
-- select dbo.STRTRAN('ABCDEF', 'ABC', default,-1,-1,0)    -- Displays DEF
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', default,2,-1,0)      -- Displays ABCDEFGHJabcQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', default,2,-1,1)      -- Displays ABCDEFGHJQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'XYZ',  2, 1, 1)      -- Displays ABCDEFXYZGHJabcQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'XYZ',  2, 3, 1)      -- Displays ABCDEFXYZGHJXYZQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'XYZ',  2, 1, 2)      -- Displays ABCDEFXYZGHJabcQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'XYZ',  2, 3, 2)      -- Displays ABCDEFXYZGHJabcQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'xyZ',  2, 1, 2)      -- Displays ABCDEFXYZGHJabcQWE
-- select dbo.STRTRAN('ABCDEFABCGHJabcQWE', 'ABC', 'xYz',  2, 3, 2)      -- Displays ABCDEFXYZGHJabcQWE
-- select dbo.STRTRAN('ABCDEFAbcCGHJAbcQWE', 'Aab', 'xyZ',  2, 1, 2)     -- Displays ABCDEFAbcCGHJAbcQWE
-- select dbo.STRTRAN('abcDEFabcGHJabcQWE', 'abc', 'xYz',  2, 3, 2)      -- Displays abcDEFxyzGHJxyzQWE
-- select dbo.STRTRAN('ABCDEFAbcCGHJAbcQWE', 'Aab', 'xyZ',  2, 1, 3)     -- Displays ABCDEFAbcCGHJAbcQWE
-- select dbo.STRTRAN('ABCDEFAbcGHJabcQWE', 'abc', 'xYz',  1, 3, 3)      -- Displays XYZDEFXyzGHJxyzQWE
-- See Also replace(), CHRTRAN()  
-- UDF the name and functionality of which correspond  to the  Visual FoxPro function  
CREATE FUNCTION [dbo].[STRTRAN]
    (
      @cSearched NVARCHAR(4000) ,
      @cExpressionSought NVARCHAR(4000) ,
      @cReplacement NVARCHAR(4000) = N'' ,
      @nStartOccurrence SMALLINT = -1 ,
      @nNumberOfOccurrences SMALLINT = -1 ,
      @nFlags TINYINT = 0
    )
RETURNS NVARCHAR(4000)
AS 
    BEGIN 
        DECLARE
            @StartPart NVARCHAR(4000) ,
            @FinishPart NVARCHAR(4000) ,
            @nAtStartOccurrence SMALLINT ,
            @nAtFinishOccurrence SMALLINT ,
            @LencSearched SMALLINT ,
            @LenExpressionSought SMALLINT

        SELECT
            @StartPart = N'' ,
            @FinishPart = N'' ,
            @nAtStartOccurrence = 0 ,
            @nAtFinishOccurrence = 0 ,
            @LencSearched = DATALENGTH(@cSearched)
            / ( CASE SQL_VARIANT_PROPERTY(@cSearched, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) ,
            @LenExpressionSought = DATALENGTH(@cExpressionSought)
            / ( CASE SQL_VARIANT_PROPERTY(@cExpressionSought, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END )  -- for unicode

        IF @nStartOccurrence = -1 
            SELECT
                @nStartOccurrence = 1

        IF @nFlags IN ( 0, 2 ) 
            SELECT
                @nAtStartOccurrence = dbo.AT2(@cExpressionSought, @cSearched,
                                              @nStartOccurrence) ,
                @nAtFinishOccurrence = CASE @nNumberOfOccurrences
                                         WHEN -1 THEN 0
                                         ELSE dbo.AT2(@cExpressionSought,
                                                      @cSearched,
                                                      @nStartOccurrence
                                                      + @nNumberOfOccurrences)
                                       END
        ELSE 
            IF @nFlags IN ( 1, 3 ) 
                SELECT
                    @nAtStartOccurrence = dbo.ATC2(@cExpressionSought,
                                                   @cSearched,
                                                   @nStartOccurrence) ,
                    @nAtFinishOccurrence = CASE @nNumberOfOccurrences
                                             WHEN -1 THEN 0
                                             ELSE dbo.ATC2(@cExpressionSought,
                                                           @cSearched,
                                                           @nStartOccurrence
                                                           + @nNumberOfOccurrences)
                                           END
            ELSE 
                SELECT
                    @cSearched = 'Error, sixth parameter must be 0, 1, 2, 3 ! '

        IF @nAtStartOccurrence > 0 
            BEGIN
                SELECT
                    @StartPart = LEFT(@cSearched, @nAtStartOccurrence - 1)
                IF @nAtFinishOccurrence > 0 
                    SELECT
                        @FinishPart = RIGHT(@cSearched,
                                            @LencSearched
                                            - @nAtFinishOccurrence + 1) ,
                        @cSearched = SUBSTRING(@cSearched, @nAtStartOccurrence,
                                               @nAtFinishOccurrence
                                               - @nAtStartOccurrence)
                ELSE 
                    SELECT
                        @cSearched = SUBSTRING(@cSearched, @nAtStartOccurrence,
                                               @LencSearched
                                               - @nAtStartOccurrence + 1)
     
                IF @nFlags = 0
                    OR ( @nFlags = 2
                         AND DATALENGTH(@cReplacement) = 0
                       ) 
                    SELECT
                        @cSearched = REPLACE(@cSearched  COLLATE Latin1_General_BIN,
                                             @cExpressionSought   COLLATE Latin1_General_BIN,
                                             @cReplacement   COLLATE Latin1_General_BIN)  
                ELSE 
                    IF @nFlags = 1
                        OR ( @nFlags = 3
                             AND DATALENGTH(@cReplacement) = 0
                           ) 
                        SELECT
                            @cSearched = REPLACE(@cSearched  COLLATE Latin1_General_CI_AS,
                                                 @cExpressionSought   COLLATE Latin1_General_CI_AS,
                                                 @cReplacement   COLLATE Latin1_General_CI_AS) 
                    ELSE 
                        IF @nFlags IN ( 2, 3 ) 
                            BEGIN
                                DECLARE
                                    @cNewSearched NVARCHAR(4000) ,
                                    @cNewReplacement NVARCHAR(4000) ,
                                    @LenReplacement SMALLINT ,
                                    @nAtPreviousOccurrence SMALLINT ,
                                    @occurs2 SMALLINT ,
                                    @i SMALLINT ,
                                    @j SMALLINT

                                SELECT
                                    @i = 1 ,
                                    @cNewSearched = N'' ,
                                    @nAtPreviousOccurrence = 1 ,
                                    @LencSearched = DATALENGTH(@cSearched)
                                    / ( CASE SQL_VARIANT_PROPERTY(@cSearched,
                                                              'BaseType')
                                          WHEN 'nvarchar' THEN 2
                                          ELSE 1
                                        END ) ,
                                    @LenReplacement = DATALENGTH(@cReplacement)
                                    / ( CASE SQL_VARIANT_PROPERTY(@cReplacement,
                                                              'BaseType')
                                          WHEN 'nvarchar' THEN 2
                                          ELSE 1
                                        END ) ,
                                    @nAtStartOccurrence = 1
                                    - @LenExpressionSought ,
                                    @occurs2 = CASE WHEN @nFlags = 3
                                                    THEN ( DATALENGTH(@cSearched)
                                                           - DATALENGTH(REPLACE(@cSearched  COLLATE Latin1_General_CI_AS,
                                                              @cExpressionSought   COLLATE Latin1_General_CI_AS,
                                                              N'')) )
                                                         / DATALENGTH(@cExpressionSought)
                                                    ELSE dbo.OCCURS2(@cExpressionSought,
                                                              @cSearched)
                                               END

                                IF @nFlags = 2 
                                    SELECT
                                        @cNewReplacement = CASE dbo.FWHATISCASE(@cExpressionSought)
                                                             WHEN 'U'
                                                             THEN UPPER(@cReplacement)
                                                             WHEN 'L'
                                                             THEN LOWER(@cReplacement)
                                                             WHEN 'P'
                                                             THEN UPPER(LEFT(@cReplacement,
                                                              1))
                                                              + LOWER(SUBSTRING(@cReplacement,
                                                              2,
                                                              @LenReplacement
                                                              - 1))
                                                             ELSE @cReplacement
                                                           END
                                WHILE @i <= @occurs2 
                                    BEGIN
                                        SELECT
                                            @nAtStartOccurrence = CASE
                                                              WHEN @nFlags = 3
                                                              THEN CHARINDEX(@cExpressionSought COLLATE Latin1_General_CI_AS,
                                                              @cSearched COLLATE Latin1_General_CI_AS,
                                                              @nAtStartOccurrence
                                                              + @LenExpressionSought)
                                                              ELSE CHARINDEX(@cExpressionSought COLLATE Latin1_General_BIN,
                                                              @cSearched COLLATE Latin1_General_BIN,
                                                              @nAtStartOccurrence
                                                              + @LenExpressionSought)
                                                              END
                                        SELECT
                                            @cNewSearched = @cNewSearched
                                            + CASE WHEN @i > 1
                                                   THEN SUBSTRING(@cSearched,
                                                              @nAtPreviousOccurrence
                                                              + @LenExpressionSought,
                                                              @nAtStartOccurrence
                                                              - ( @nAtPreviousOccurrence
                                                              + @LenExpressionSought ))
                                                   ELSE LEFT(@cSearched,
                                                             @nAtStartOccurrence
                                                             - 1)
                                              END 
                                        IF @nFlags = 3 
                                            SELECT
                                                @cNewReplacement = CASE dbo.FWHATISCASE(SUBSTRING(@cSearched,
                                                              @nAtStartOccurrence,
                                                              @LenExpressionSought))
                                                              WHEN 'U'
                                                              THEN UPPER(@cReplacement)
                                                              WHEN 'L'
                                                              THEN LOWER(@cReplacement)
                                                              WHEN 'P'
                                                              THEN UPPER(LEFT(@cReplacement,
                                                              1))
                                                              + LOWER(SUBSTRING(@cReplacement,
                                                              2,
                                                              @LenReplacement
                                                              - 1))
                                                              ELSE @cReplacement
                                                              END

                                        SELECT
                                            @cNewSearched = @cNewSearched
                                            + @cNewReplacement ,
                                            @nAtPreviousOccurrence = @nAtStartOccurrence ,
                                            @i = @i + 1
                                    END
                                SELECT
                                    @cSearched = @cNewSearched
                                    + RIGHT(@cSearched,
                                            @LencSearched + 1
                                            - ( @nAtStartOccurrence
                                                + @LenExpressionSought ))
                            END
            END
        RETURN  @StartPart + @cSearched + @FinishPart
    END


GO
