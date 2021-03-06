/****** Object:  UserDefinedFunction [dbo].[ARABTOARMENIAN]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- ARABTOARMENIAN() Returns the unicode character Armenian numeral equivalent of a specified numeric expression (from 1 to 9999) 
-- see http://en.wikipedia.org/wiki/Armenian_numerals
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com ,  15 October 2006
-- ARABTOARMENIAN(@tNum) Return Values nvarchar(75) Parameters @tNum  number
-- Example
-- select dbo.ARABTOARMENIAN(3888)   -- Displays ՎՊՁԸ
-- select dbo.ARABTOARMENIAN('1888') -- Displays ՌՊՁԸ
-- select dbo.ARABTOARMENIAN(1)        -- Displays Ա
-- select dbo.ARABTOARMENIAN(234)    -- Displays ՄԼԴ
-- See also ARMENIANTOARAB()  
CREATE FUNCTION ARABTOARMENIAN ( @tNum SQL_VARIANT )
RETURNS NVARCHAR(75)
AS 
    BEGIN
        DECLARE
            @type CHAR(1) ,
            @lResult NVARCHAR(75) ,
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
            SET @lResult = N'Wrong type of parameter, must be Integer, Numeric or Character'
        ELSE 
            BEGIN
                SET @lnNum = CAST(@tNum AS INT) 
                IF @lnNum BETWEEN 1 AND 9999 
                    BEGIN    
                        DECLARE
                            @lnI TINYINT ,
                            @tcNum VARCHAR(4)
                        SELECT
                            @tcNum = LTRIM(RTRIM(CAST(@lnNum AS VARCHAR(4)))) ,
                            @lResult = '' ,
                            @lnI = 0
                        WHILE @lnI <= LEN(@tcNum) 
                            BEGIN   
                                SELECT
                                    @lnNum = CAST(SUBSTRING(@tcNum,
                                                            LEN(@tcNum) - @lnI,
                                                            1) AS SMALLINT) ,
                                    @lnI = @lnI + 1
                                IF @lnNum > 0 
                                    SELECT
                                        @lResult = @lResult
                                        + NCHAR(UNICODE(N'Ա') + @lnNum - 1 + 9
                                                * ( @lnI - 1 ))
                            END
                        SELECT
                            @lResult = REVERSE(@lResult)
                    END
                ELSE 
                    SET @lResult = N'Out of range, must be between 1 and 9999'
            END
        RETURN  @lResult
    END


GO
