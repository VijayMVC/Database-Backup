/****** Object:  UserDefinedFunction [dbo].[ADDROMANNUMBERS]    Script Date: 5/15/2018 12:14:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- ADDROMANNUMBERS() User-Defined Function is written just FYA
-- Returns the result of addition, subtraction, multiplication or division of two Roman numbers  
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com ,  25 April 2005 or XXV April MMV :-)
-- ADDROMANNUMBERS(@tcRomanNumber1, @tcRomanNumber2, @tcOperator) Return Values varchar(75)
-- Parameters @tcRomanNumber1 varchar(15) Roman number
-- @tcRomanNumber2 varchar(15) Roman number, @tcOperator char(1) operator
-- Example
-- select dbo.ADDROMANNUMBERS('I','I',default)                       -- Displays II
-- select dbo.ADDROMANNUMBERS('MMMDCCCLXXXVIII','MDCCCLXXXVIII','-') -- Displays MM
-- select dbo.ADDROMANNUMBERS('DCCCLXXXVIII','VIII',default)         -- Displays DCCCXCVI
-- select dbo.ADDROMANNUMBERS('DCCCLXXXVIII','VIII','*')             -- Displays Out of range, must be between 1 and 3999
-- select dbo.ADDROMANNUMBERS('MMMDCCCLXXXVIII','II','/')            -- Displays MCMXLIV
-- See also ROMANTOARAB(), ARABTOROMAN()  
CREATE FUNCTION ADDROMANNUMBERS
    (
      @tcRomanNumber1 VARCHAR(15) ,
      @tcRomanNumber2 VARCHAR(15) ,
      @tcOperator CHAR(1) = '+' 
    )
RETURNS VARCHAR(75)
    BEGIN
        DECLARE @lcResult VARCHAR(75)
        IF @tcOperator IN ( '+', '-', '*', '/' ) 
            BEGIN
                DECLARE
                    @lnN1 INT ,
                    @lnN2 INT
                SELECT
                    @lnN1 = dbo.ROMANTOARAB(@tcRomanNumber1) ,
                    @lnN2 = dbo.ROMANTOARAB(@tcRomanNumber2)
                IF @lnN1 < 0 
                    SET @lcResult = 'Wrong first roman number'
                ELSE 
                    IF @lnN2 < 0 
                        SET @lcResult = 'Wrong second roman number'
                    ELSE 
                        BEGIN
                            SELECT
                                @lcResult = CASE @tcOperator
                                              WHEN '+'
                                              THEN dbo.ARABTOROMAN(@lnN1
                                                              + @lnN2)
                                              WHEN '-'
                                              THEN dbo.ARABTOROMAN(@lnN1
                                                              - @lnN2)
                                              WHEN '*'
                                              THEN dbo.ARABTOROMAN(@lnN1
                                                              * @lnN2)
                                              WHEN '/'
                                              THEN dbo.ARABTOROMAN(@lnN1
                                                              / @lnN2)
                                            END                
                        END
            END
        ELSE 
            SET @lcResult = 'Wrong third parameter, must be +,-,*,/'
         
        RETURN @lcResult
    END


GO
