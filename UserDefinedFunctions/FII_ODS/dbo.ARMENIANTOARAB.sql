/****** Object:  UserDefinedFunction [dbo].[ARMENIANTOARAB]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- ARMENIANTOARAB() Returns the number equivalent of a specified character Armenian numeral expression (from Ա to ՔՋՂԹ)
-- see http://en.wikipedia.org/wiki/Armenian_numerals
-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com , 15 October 2006 or ԺԵ  October ՍԶ  :-)
-- ARMENIANTOARAB(@tcArmenianNumber) Return Values smallint
-- Parameters @tcArmenianNumber  nvarchar(4) Armenian number  
-- Example
-- select dbo.ARMENIANTOARAB(N'ՎՊՁԸ') -- Displays 3888
-- select dbo.ARMENIANTOARAB(N'ՌՊՁԸ') -- Displays 1888
-- select dbo.ARMENIANTOARAB(N'Ա')    -- Displays 1
-- select dbo.ARMENIANTOARAB(N'ՄԼԴ')  -- Displays 234
-- See also ARABTOARMENIAN()  
CREATE FUNCTION ARMENIANTOARAB
    (
      @tcArmenianNumber NVARCHAR(10)
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE
            @lnResult SMALLINT ,
            @lcArmenianNumber NVARCHAR(10) ,
            @lcArmenianLetter NCHAR(1) ,
            @lnI TINYINT
        SELECT
            @tcArmenianNumber = LTRIM(RTRIM(UPPER(@tcArmenianNumber))) ,
            @lcArmenianNumber = N'' ,
            @lnI = 1 ,
            @lnResult = 0
   
        WHILE @lnI <= LEN(@tcArmenianNumber) 
            BEGIN 
                SELECT
                    @lcArmenianLetter = SUBSTRING(@tcArmenianNumber, @lnI, 1)
                IF @lcArmenianLetter BETWEEN N'Ա' AND N'Ք' 
                    SET @lcArmenianNumber = @lcArmenianNumber
                        + @lcArmenianLetter
                ELSE 
                    IF @lcArmenianLetter <> NCHAR(32) 
                        BEGIN
                            SET @lnResult = -1
                            BREAK
                        END
                SET @lnI = @lnI + 1
            END
    
        IF @lnResult > -1 
            BEGIN
                SELECT
                    @lnI = 1
                WHILE @lnI <= LEN(@lcArmenianNumber)
                    AND @lnResult > -1 
                    BEGIN
                        SELECT
                            @lcArmenianLetter = SUBSTRING(@lcArmenianNumber,
                                                          @lnI, 1) ,
                            @lnI = @lnI + 1
                        IF @lcArmenianLetter >= N'Ռ'
                            AND @lnResult = 0  -- 1000
                            SELECT
                                @lnResult = @lnResult + 1000
                                * ( UNICODE(@lcArmenianLetter) - UNICODE(N'Ռ')
                                    + 1 )
                        ELSE 
                            IF @lcArmenianLetter >= N'Ճ'
                                AND @lnResult % 1000 = 0  -- 100
                                SELECT
                                    @lnResult = @lnResult + 100
                                    * ( UNICODE(@lcArmenianLetter)
                                        - UNICODE(N'Ճ') + 1 )
                            ELSE 
                                IF @lcArmenianLetter >= N'Ժ'
                                    AND @lnResult % 100 = 0  -- 10
                                    SELECT
                                        @lnResult = @lnResult + 10
                                        * ( UNICODE(@lcArmenianLetter)
                                            - UNICODE(N'Ժ') + 1 )
                                ELSE 
                                    IF @lcArmenianLetter >= N'Ա'
                                        AND @lnResult % 10 = 0  -- 1
                                        SELECT
                                            @lnResult = @lnResult
                                            + UNICODE(@lcArmenianLetter)
                                            - UNICODE(N'Ա') + 1
                                    ELSE 
                                        SELECT
                                            @lnResult = -1
                           
                    END      
            END
        RETURN  @lnResult
    END


GO
