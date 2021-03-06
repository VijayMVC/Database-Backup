/****** Object:  UserDefinedFunction [dbo].[GETALLWORDS2]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 -- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com 
 -- GETALLWORDS2() User-Defined Function Inserts the words from a string into the table.
 -- GETALLWORDS2(@cString[, @cStringSplitting])
 -- Parameters
 -- @cString  nvarchar(4000) - Specifies the string whose words will be inserted into the table @GETALLWORDS2. 
 -- @cStringSplitting nvarchar(256) - Optional. Specifies the string used to separate words in @cString.
 -- The default delimiter is space.
 -- Note that GETALLWORDS2( ) uses  @cStringSplitting as a single delimiter. 
 -- Return Value table 
 -- Remarks GETALLWORDS2() by default assumes that words are delimited by space. If you specify another string as delimiter, this function ignores spaces and uses only the specified string.
 -- Example
 -- declare @cString nvarchar(4000), @nIndex smallint 
 -- select @cString = 'We hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.', @nIndex = 30
 -- select WORD from dbo.GETALLWORDS2(@cString, default) where WORDNUM = @nIndex  -- Displays 'Liberty'
 -- select top 1 WORDNUM from dbo.GETALLWORDS2(@cString, default) order by WORDNUM desc  -- Displays 35
 -- See Also GETWORDNUM(), GETWORDCOUNT(),  GETALLWORDS(), GETNUMWORD(), GETOCCURSWORD(),  GETATWORD(), GETRATWORD()   User-Defined Functions   
CREATE FUNCTION GETALLWORDS2
    (
      @cString NVARCHAR(4000) ,
      @cStringSplitting NVARCHAR(256) = ' '  
    )   -- if no break string is specified, the function uses space to delimit words.
RETURNS @GETALLWORDS2 TABLE
    (
      WORDNUM SMALLINT ,
      WORD NVARCHAR(4000) ,
      STARTOFWORD SMALLINT ,
      LENGTHOFWORD SMALLINT
    )
    BEGIN
        DECLARE
            @k SMALLINT ,
            @BegOfWord SMALLINT ,
            @wordcount SMALLINT ,
            @nEndString SMALLINT ,
            @nLenSrtingSplitting SMALLINT ,
            @flag BIT

        SELECT
            @cStringSplitting = ISNULL(@cStringSplitting, SPACE(1)) ,
            @cString = ISNULL(@cString, '') ,
            @BegOfWord = 1 ,
            @wordcount = 1 ,
            @k = 0 ,
            @flag = 0 ,
            @nEndString = 1 + DATALENGTH(@cString)
            / ( CASE SQL_VARIANT_PROPERTY(@cString, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END ) ,
            @nLenSrtingSplitting = DATALENGTH(@cStringSplitting)
            / ( CASE SQL_VARIANT_PROPERTY(@cStringSplitting, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END )   -- for unicode

        WHILE 1 > 0 
            BEGIN
                IF @k - @BegOfWord > 0 
                    BEGIN
                        INSERT  INTO @GETALLWORDS2
                                ( WORDNUM ,
                                  WORD ,
                                  STARTOFWORD ,
                                  LENGTHOFWORD
                                )
                        VALUES
                                ( @wordcount ,
                                  SUBSTRING(@cString, @BegOfWord,
                                            @k - @BegOfWord) ,
                                  @BegOfWord ,
                                  @k - @BegOfWord
                                )
                        SELECT
                            @wordcount = @wordcount + 1 ,
                            @BegOfWord = @k 
                    END 

                IF @flag = 1 
                    BREAK

                WHILE CHARINDEX(SUBSTRING(@cString, @BegOfWord,
                                          @nLenSrtingSplitting) COLLATE Latin1_General_BIN,
                                @cStringSplitting COLLATE Latin1_General_BIN) > 0 --  skip break strings, if any     
                    SET @BegOfWord = @BegOfWord + @nLenSrtingSplitting

                SELECT
                    @k = CHARINDEX(@cStringSplitting  COLLATE Latin1_General_BIN,
                                   @cString COLLATE Latin1_General_BIN,
                                   @BegOfWord)   

                IF @k = 0 
                    SELECT
                        @k = @nEndString ,
                        @flag = 1
            END

        RETURN 
    END

GO
