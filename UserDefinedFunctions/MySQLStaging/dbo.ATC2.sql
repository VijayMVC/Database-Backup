/****** Object:  UserDefinedFunction [dbo].[ATC2]    Script Date: 5/15/2018 12:14:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
-- ATC2() User-Defined Function 
-- Returns the beginning numeric position of the first occurrence of a character expression within another character expression, counting from the leftmost character.
-- The search performed by ATC2() is case-insensitive (excluding  overlaps).
-- ATC2(@cSearchExpression, @cExpressionSearched [, @nOccurrence]) Return Values smallint 
-- Parameters
-- @cSearchExpression nvarchar(4000) Specifies the character expression that ATC2( ) searches for in @cExpressionSearched. 
-- @cExpressionSearched nvarchar(4000) Specifies the character expression @cSearchExpression searches for. 
-- @nOccurrence smallint Specifies which occurrence (first, second, third, and so on) of @cSearchExpression is searched for in @cExpressionSearched. By default, ATC2() searches for the first occurrence of @cSearchExpression (@nOccurrence = 1). Including @nOccurrence lets you search for additional occurrences of @cSearchExpression in @cExpressionSearched.
-- ATC2() returns 0 if @nOccurrence is greater than the number of times @cSearchExpression occurs in @cExpressionSearched. 
-- Remarks
-- ATC2() searches the second character expression for the first occurrence of the first character expression. It then returns an integer indicating the position of the first character in the character expression found. If the character expression is not found, ATC2() returns 0. 
-- ATC2 is nearly similar to a function Oracle PL/SQL INSTR
-- Example
-- declare @gcString nvarchar(4000), @gcFindString nvarchar(4000)
-- select @gcString = 'Now is the time for all good men', @gcFindString = 'is the'
-- select dbo.ATC2(@gcFindString, @gcString, default)  -- Displays 5
-- set @gcFindString = 'IS'
-- select dbo.ATC2(@gcFindString, @gcString, default)  -- Displays 5, case-insensitive
-- select @gcString = 'goood men', @gcFindString = 'oo'
-- select dbo.ATC2(@gcFindString, @gcString, 1)  -- Displays 2
-- select dbo.ATC2(@gcFindString, @gcString, 2)  -- Displays 0, excluding  overlaps
-- See Also AT(), AT2(), ATC2()  User-Defined Function 
CREATE FUNCTION ATC2
    (
      @cSearchExpression NVARCHAR(4000) ,
      @cExpressionSearched NVARCHAR(4000) ,
      @nOccurrence SMALLINT = 1 
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE @LencSearchExpression SMALLINT
        SELECT
            @LencSearchExpression = DATALENGTH(@cSearchExpression)
            / ( CASE SQL_VARIANT_PROPERTY(@cSearchExpression, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode

        IF @nOccurrence > 0 
            BEGIN
                DECLARE
                    @i SMALLINT ,
                    @StartingPosition SMALLINT
                SELECT
                    @i = 0 ,
                    @StartingPosition = -1 - @LencSearchExpression
                SELECT
                    @cSearchExpression = LOWER(@cSearchExpression) ,
                    @cExpressionSearched = LOWER(@cExpressionSearched)
                WHILE @StartingPosition <> 0
                    AND @nOccurrence > @i 
                    SELECT
                        @i = @i + 1 ,
                        @StartingPosition = CHARINDEX(@cSearchExpression COLLATE Latin1_General_CI_AS,
                                                      @cExpressionSearched COLLATE Latin1_General_CI_AS,
                                                      @StartingPosition
                                                      + @LencSearchExpression)
            END
        ELSE 
            SET @StartingPosition = NULL

        RETURN @StartingPosition
    END

GO
