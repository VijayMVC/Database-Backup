/****** Object:  UserDefinedFunction [dbo].[OCCURS]    Script Date: 5/15/2018 12:15:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


 -- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
 -- OCCURS() User-Defined Function
 -- Returns the number of times a character expression occurs within another character expression (including  overlaps).
 -- OCCURS is slowly than OCCURS2.
 -- OCCURS(@cSearchExpression, @cExpressionSearched)
 -- Return Values smallint 
 -- Parameters
 -- @cSearchExpression nvarchar(4000) Specifies a character expression that OCCURS() searches for within @cExpressionSearched. 
 -- @cExpressionSearched nvarchar(4000) Specifies the character expression OCCURS() searches for @cSearchExpression. 
 -- Remarks
 -- OCCURS() returns 0 (zero) if @cSearchExpression is not found within @cExpressionSearched.
 -- Example
 -- declare @gcString nvarchar(4000)
 -- select  @gcString = 'abracadabra'
 -- select dbo.OCCURS('a', @gcString )  -- Displays 5
 -- select dbo.OCCURS('b', @gcString )  -- Displays 2
 -- select dbo.OCCURS('c', @gcString )  -- Displays 1
 -- select dbo.OCCURS('e', @gcString )  -- Displays 0
 -- Including  overlaps !!!
 -- select dbo.OCCURS('ABCA', 'ABCABCABCA') -- Displays 3
 -- 1 occurrence of substring 'ABCA  .. BCABCA' 
 -- 2 occurrence of substring 'ABC...ABCA...BCA' 
 -- 3 occurrence of substring 'ABCABC...ABCA' 
 -- See Also AT(), RAT(), OCCURS2(), AT2(), ATC(), ATC2()    
 -- UDF the name and functionality of which correspond to the  Visual FoxPro function  
 -- (but function OCCURS of Visual FoxPro counts the 'occurs' excluding  overlaps !)
CREATE FUNCTION OCCURS
    (
      @cSearchExpression NVARCHAR(4000) ,
      @cExpressionSearched NVARCHAR(4000)
    )
RETURNS SMALLINT
AS 
    BEGIN
        DECLARE
            @start_location SMALLINT ,
            @occurs SMALLINT
        SELECT
            @start_location = -1 ,
            @occurs = -1
        WHILE @start_location <> 0 
            SELECT
                @occurs = @occurs + 1 ,
                @start_location = CHARINDEX(@cSearchExpression COLLATE Latin1_General_BIN,
                                            @cExpressionSearched COLLATE Latin1_General_BIN,
                                            @start_location + 1)

        RETURN @occurs
    END

GO
