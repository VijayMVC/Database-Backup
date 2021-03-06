/****** Object:  UserDefinedFunction [dbo].[CHRTRAN]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
-- CHRTRAN() User-Defined Function
-- Replaces each character in a character expression that matches a character in a second character expression with the corresponding character in a third character expression.
-- CHRTRAN  (@cExpressionSearched,   @cSearchExpression,  @cReplacementExpression)
-- Return Values nvarchar(4000) 
-- Parameters
-- @cSearchedExpression   Specifies the expression in which CHRTRAN( ) replaces characters. 
-- @cSearchExpression  Specifies the expression containing the characters CHRTRAN( ) looks for in @cSearchedExpression. 
-- @cReplacementExpression Specifies the expression containing the replacement characters. 
-- If a character in@cSearchExpression is found in @cSearchedExpression, the character in @cSearchedExpression is replaced by a character from @cReplacementExpression
-- that is in the same position in @cReplacementExpression as the respective character in @cSearchExpression. 
-- If @cReplacementExpression has fewer characters than @cSearchExpression, the additional characters in @cSearchExpression are deleted from @cSearchedExpression. 
-- If @cReplacementExpression has more characters than @cSearchExpression, the additional characters in @cReplacementExpression are ignored. 
-- Remarks
-- CHRTRAN() translates the character expression @cSearchedExpression using the translation expressions @cSearchExpression and @cReplacementExpression and returns the resulting character string.
-- CHRTRAN similar to the Oracle function PL/SQL TRANSLATE
-- Example
-- select dbo.CHRTRAN('ABCDEF', 'ACE', 'XYZ')      -- Displays XBYDZF
-- select dbo.CHRTRAN('ABCDEF', 'ACE', 'XYZQRST')  -- Displays XBYDZF
-- See Also STRFILTER()  
-- UDF the name and functionality of which correspond  to the  Visual FoxPro function  
CREATE FUNCTION CHRTRAN
    (
      @cExpressionSearched NVARCHAR(4000) ,
      @cSearchExpression NVARCHAR(256) ,
      @cReplacementExpression NVARCHAR(256)
    )
RETURNS NVARCHAR(4000)
AS 
    BEGIN
        DECLARE
            @lenExpressionSearched SMALLINT ,
            @lenSearchExpression SMALLINT ,
            @lenReplacementExpression SMALLINT ,
            @i SMALLINT ,
            @j SMALLINT ,
            @flag BIT ,
            @cExpressionTranslated NVARCHAR(4000)
      
        SELECT
            @cExpressionTranslated = N'' ,
            @i = 1 ,
            @flag = 0 ,
            @lenExpressionSearched = DATALENGTH(@cExpressionSearched)
            / ( CASE SQL_VARIANT_PROPERTY(@cExpressionSearched, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) ,
            @lenSearchExpression = DATALENGTH(@cSearchExpression)
            / ( CASE SQL_VARIANT_PROPERTY(@cSearchExpression, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) ,
            @lenReplacementExpression = DATALENGTH(@cReplacementExpression)
            / ( CASE SQL_VARIANT_PROPERTY(@cReplacementExpression, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END )  -- for unicode
    
        IF @lenReplacementExpression > @lenSearchExpression 
            SELECT
                @cReplacementExpression = LEFT(@cReplacementExpression,
                                               @lenSearchExpression) ,
                @lenReplacementExpression = @lenSearchExpression

        WHILE @i <= @lenReplacementExpression 
            IF CHARINDEX(SUBSTRING(@cReplacementExpression, @i, 1) COLLATE Latin1_General_BIN,
                         @cSearchExpression COLLATE Latin1_General_BIN, @i + 1) > 0 
                BEGIN
                    SELECT
                        @flag = 1
                    BREAK
                END
            ELSE 
                SELECT
                    @i = @i + 1

        IF @lenExpressionSearched = 4000  -- built-in function replace do not works correctly if the length of the string is 4000     MS SQL Server 2000, SP4
            IF CHARINDEX(RIGHT(@cExpressionSearched, 1) COLLATE Latin1_General_BIN,
                         @cSearchExpression COLLATE Latin1_General_BIN) > 0     -- I did run this example and validated the erroneous result
                SELECT
                    @flag = 1                                                              -- select right(replace(replicate(N'z',3999)+N'i', N'i', N'B'),1) -- Displays i  but this is incorrect result, correct result is B

        SELECT
            @i = 1

        IF @flag = 0
       -- this algorithm does not work always as
       -- select dbo.CHRTRAN('eaba','ba','a') -- Displays  e  Error !!!  ea  Correctly
            BEGIN
                WHILE @i <= @lenSearchExpression 
                    SELECT
                        @cExpressionSearched = REPLACE(@cExpressionSearched  COLLATE Latin1_General_BIN,
                                                       SUBSTRING(@cSearchExpression,
                                                              @i, 1)   COLLATE Latin1_General_BIN,
                                                       SUBSTRING(@cReplacementExpression,
                                                              @i, 1)   COLLATE Latin1_General_BIN) ,
                        @i = @i + 1 
                SELECT
                    @cExpressionTranslated = @cExpressionSearched
            END
        ELSE 
            WHILE @i <= @lenExpressionSearched 
                BEGIN
                    SELECT
                        @j = CHARINDEX(SUBSTRING(@cExpressionSearched, @i, 1) COLLATE Latin1_General_BIN,
                                       @cSearchExpression COLLATE Latin1_General_BIN)
                    IF @j > 0 
                        SELECT
                            @cExpressionTranslated = @cExpressionTranslated
                            + SUBSTRING(@cReplacementExpression, @j, 1)
                    ELSE 
                        SELECT
                            @cExpressionTranslated = @cExpressionTranslated
                            + SUBSTRING(@cExpressionSearched, @i, 1)
                    SELECT
                        @i = @i + 1 
                END

        RETURN  @cExpressionTranslated
    END

GO
