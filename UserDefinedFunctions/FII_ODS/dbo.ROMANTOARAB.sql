/****** Object:  UserDefinedFunction [dbo].[ROMANTOARAB]    Script Date: 5/15/2018 12:14:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- ROMANTOARAB() Returns the number equivalent of a specified character Roman numeral expression (from I to MMMCMXCIX)
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com ,  25 April 2005 or XXV April MMV :-)
-- ROMANTOARAB(@tcRomanNumber) Return Values smallint
-- Parameters @tcRomanNumber  varchar(15) Roman number  
-- Example
-- select dbo.ROMANTOARAB('MMMDCCCLXXXVIII') -- Displays 3888
-- select dbo.ROMANTOARAB('MDCCCLXXXVIII')   -- Displays 1888
-- select dbo.ROMANTOARAB('I')               -- Displays 1
-- select dbo.ROMANTOARAB('CCXXXIV')         -- Displays 234
-- See also ARABTOROMAN()  
CREATE FUNCTION ROMANTOARAB
    (
      @tcRomanNumber VARCHAR(15)
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE
            @lnResult SMALLINT ,
            @lcRomanNumber VARCHAR(15) ,
            @lnI TINYINT ,
            @ROMANNUMERALS CHAR(7)
        SELECT
            @tcRomanNumber = LTRIM(RTRIM(UPPER(@tcRomanNumber))) ,
            @ROMANNUMERALS = 'IVXLCDM' ,
            @lcRomanNumber = '' ,
            @lnI = 1 ,
            @lnResult = 0
   
        WHILE @lnI <= DATALENGTH(@tcRomanNumber) 
            BEGIN 
                IF CHARINDEX(SUBSTRING(@tcRomanNumber, @lnI, 1),
                             @ROMANNUMERALS) > 0 
                    SET @lcRomanNumber = @lcRomanNumber
                        + SUBSTRING(@tcRomanNumber, @lnI, 1)
                ELSE 
                    BEGIN
                        SET @lnResult = -1
                        BREAK
                    END
                SET @lnI = @lnI + 1
            END
    
        IF @lnResult > -1 
            BEGIN
                DECLARE
                    @lnJ TINYINT ,
                    @lnDelim SMALLINT ,
                    @lnK TINYINT
                SELECT
                    @lnK = DATALENGTH(@lcRomanNumber) ,
                    @lnI = 1
   
                WHILE @lnI <= 4 
                    BEGIN
                        IF @lnK = 0 
                            BREAK
                        SET @lnDelim = POWER(10, @lnI - 1)
                        IF @lnK >= 2
                            AND SUBSTRING(@lcRomanNumber, @lnK - 1, 2) = ( SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2 - 1, 1)
                                                              + SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2, 1) ) -- CD or XL or IV
                            SELECT
                                @lnResult = @lnResult + 4 * @lnDelim ,
                                @lnK = @lnK - 2
                        ELSE 
                            IF @lnK >= 2
                                AND SUBSTRING(@lcRomanNumber, @lnK - 1, 2) = ( SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2 - 1, 1)
                                                              + SUBSTRING(@ROMANNUMERALS,
                                                              ( @lnI + 1 ) * 2
                                                              - 1, 1) ) -- CM or XC or IX
                                SELECT
                                    @lnResult = @lnResult + 9 * @lnDelim ,
                                    @lnK = @lnK - 2
                            ELSE 
                                BEGIN 
                                    SET @lnJ = 1
                                    WHILE @lnJ <= 3  -- MMM or CCC or XXX or III
                                        BEGIN
                                            IF @lnK >= 1
                                                AND SUBSTRING(@lcRomanNumber,
                                                              @lnK, 1) = SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2 - 1, 1) 
                                                SELECT
                                                    @lnResult = @lnResult
                                                    + @lnDelim ,
                                                    @lnK = @lnK - 1
                                            SET @lnJ = @lnJ + 1
                                        END 
                                    IF @lnK = 0 
                                        BREAK
                                    IF SUBSTRING(@lcRomanNumber, @lnK, 1) = SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2, 1) -- D or L or V
                                        SELECT
                                            @lnResult = @lnResult + 5
                                            * @lnDelim ,
                                            @lnK = @lnK - 1
                                END 
                        SET @lnI = @lnI + 1
                    END
            END      
        
        IF @lnK > 0 
            SET @lnResult = -1
     
        RETURN  @lnResult
    END


GO
