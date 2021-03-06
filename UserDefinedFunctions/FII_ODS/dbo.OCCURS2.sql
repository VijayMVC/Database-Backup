/****** Object:  UserDefinedFunction [dbo].[OCCURS2]    Script Date: 5/15/2018 12:14:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 -- Author: Stephen Dobson, Toronto, EMail: sdobson@acc.org   
 -- OCCURS2() User-Defined Function
 -- Returns the number of times a character expression occurs  within another character expression (excluding  overlaps).
 -- OCCURS2 is faster than OCCURS.
 -- OCCURS2(@cSearchExpression, @cExpressionSearched)
 -- Return Values smallint 
 -- Parameters
 -- @cSearchExpression nvarchar(4000) Specifies a character expression that OCCURS2() searches for within @cExpressionSearched. 
 -- @cExpressionSearched nvarchar(4000) Specifies the character expression OCCURS2() searches for @cSearchExpression. 
 -- Remarks
 -- OCCURS2() returns 0 (zero) if @cSearchExpression is not found within @cExpressionSearched.
 -- Example
 -- declare @gcString nvarchar(4000)
 -- select  @gcString = 'abracadabra'
 -- select dbo.OCCURS2('a', @gcString )  -- Displays 5
 -- Attention !!!
 -- This function counts the 'occurs' excluding  overlaps !
 -- select dbo.OCCURS2('ABCA', 'ABCABCABCA') -- Displays 2
 -- 1 occurrence of substring 'ABCA  .. BCABCA' 
 -- 2 occurrence of substring 'ABCABC... ABCA' 
 -- UDF the functionality of which correspond to the  Visual FoxPro function 
 -- See Also OCCURS()  
CREATE FUNCTION OCCURS2
    (
      @cSearchExpression NVARCHAR(4000) ,
      @cExpressionSearched NVARCHAR(4000)
    )
RETURNS SMALLINT
AS 
    BEGIN
        RETURN
           CASE  
              WHEN DATALENGTH(@cSearchExpression) > 0
              THEN   ( DATALENGTH(@cExpressionSearched) 
                   - DATALENGTH(REPLACE(@cExpressionSearched  COLLATE Latin1_General_BIN, 
                                         @cSearchExpression   COLLATE Latin1_General_BIN,  '')))  
                  / DATALENGTH(@cSearchExpression)
             ELSE 0 
          END
    END

GO
