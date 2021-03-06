/****** Object:  UserDefinedFunction [dbo].[ARABTOROMAN]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- ARABTOROMAN() Returns the character Roman numeral equivalent of a specified numeric expression (from 1 to 3999) 
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com ,  25 April 2005 or XXV April MMV :-)
-- ARABTOROMAN(@tNum) Return Values varchar(15) Parameters @tNum  number
-- Example
-- select dbo.ARABTOROMAN(3888)   -- Displays MMMDCCCLXXXVIII
-- select dbo.ARABTOROMAN('1888') -- Displays MDCCCLXXXVIII
-- select dbo.ARABTOROMAN(1)      -- Displays I
-- select dbo.ARABTOROMAN(234)    -- Displays CCXXXIV
 -- See also ROMANTOARAB()  
CREATE FUNCTION ARABTOROMAN ( @tNum SQL_VARIANT )
RETURNS VARCHAR(75)
AS 
    BEGIN
        DECLARE
            @type CHAR(1) ,
            @lResult VARCHAR(75) ,
            @lnNum INT

        SELECT
            @type = CASE WHEN CHARINDEX('char',
                                        CAST(SQL_VARIANT_PROPERTY(@tNum,
                                                              'BaseType') AS VARCHAR(20))) > 0
                         THEN 'C'
                         WHEN CHARINDEX('int',
                                        CAST(SQL_VARIANT_PROPERTY(@tNum,
                                                              'BaseType') AS VARCHAR(20))) > 0
                         THEN 'N'
                         WHEN CAST(SQL_VARIANT_PROPERTY(@tNum, 'BaseType') AS VARCHAR(20)) IN (
                              'real', 'float', 'numeric', 'decimal' ) THEN 'N'
                         ELSE 'W'
                    END 
 
        IF @type = 'W' 
            SET @lResult = 'Wrong type of parameter, must be Integer, Numeric or Character'
        ELSE 
            BEGIN
                SET @lnNum = CAST(@tNum AS INT) 
                IF @lnNum BETWEEN 1 AND 3999 
                    BEGIN    
                        DECLARE
                            @ROMANNUMERALS CHAR(7) ,
                            @lnI TINYINT ,
                            @tcNum VARCHAR(4)
                        SELECT
                            @ROMANNUMERALS = 'IVXLCDM' ,
                            @tcNum = LTRIM(RTRIM(CAST(@lnNum AS VARCHAR(4)))) ,
                            @lResult = ''
                        SET @lnI = DATALENGTH(@tcNum)
                        WHILE @lnI >= 1 
                            BEGIN   
                                SET @lnNum = CAST(SUBSTRING(@tcNum,
                                                            DATALENGTH(@tcNum)
                                                            - @lnI + 1, 1) AS SMALLINT)
                                SELECT
                                    @lResult = @lResult
                                    + CASE WHEN @lnNum < 4
                                           THEN REPLICATE(SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2 - 1, 1),
                                                          @lnNum)
                                           WHEN @lnNum = 4
                                                OR @lnNum = 9
                                           THEN SUBSTRING(@ROMANNUMERALS,
                                                          @lnI * 2 - 1, 1)
                                                + SUBSTRING(@ROMANNUMERALS,
                                                            @lnI * 2
                                                            + CASE
                                                              WHEN @lnNum = 9
                                                              THEN 1
                                                              ELSE 0
                                                              END, 1)
                                           ELSE SUBSTRING(@ROMANNUMERALS,
                                                          @lnI * 2, 1)
                                                + REPLICATE(SUBSTRING(@ROMANNUMERALS,
                                                              @lnI * 2 - 1, 1),
                                                            @lnNum - 5)
                                      END
                                SET @lnI = @lnI - 1
                            END
                    END
                ELSE 
                    SET @lResult = 'Out of range, must be between 1 and 3999'
            END
        RETURN  @lResult
    END


GO
