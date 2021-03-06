/****** Object:  UserDefinedFunction [dbo].[PADL]    Script Date: 5/15/2018 12:14:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 -- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
 -- PADL(), PADR(), PADC() User-Defined Functions
 -- Returns a string from an expression, padded with spaces or characters to a specified length on the left or right sides, or both.
 -- PADL similar to the Oracle function PL/SQL  LPAD 
CREATE FUNCTION PADL
    (
      @cString NVARCHAR(4000) ,
      @nLen SMALLINT ,
      @cPadCharacter NVARCHAR(4000) = ' ' 
    )
RETURNS NVARCHAR(4000)
AS 
    BEGIN
        DECLARE
            @length SMALLINT ,
            @lengthPadCharacter SMALLINT
        IF @cPadCharacter IS NULL
            OR DATALENGTH(@cPadCharacter) = 0 
            SET @cPadCharacter = SPACE(1) 
        SELECT
            @length = DATALENGTH(@cString)
            / ( CASE SQL_VARIANT_PROPERTY(@cString, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode
        SELECT
            @lengthPadCharacter = DATALENGTH(@cPadCharacter)
            / ( CASE SQL_VARIANT_PROPERTY(@cPadCharacter, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) -- for unicode

        IF @length >= @nLen 
            SET @cString = LEFT(@cString, @nLen)
        ELSE 
            BEGIN
                DECLARE @nLeftLen SMALLINT
                SET @nLeftLen = @nLen - @length  -- Quantity of characters, added at the left
                SET @cString = LEFT(REPLICATE(@cPadCharacter,
                                              CEILING(@nLeftLen
                                                      / @lengthPadCharacter)
                                              + 2), @nLeftLen) + @cString
            END

        RETURN (@cString)
    END

GO
