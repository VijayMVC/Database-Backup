/****** Object:  UserDefinedFunction [dbo].[fn_Split]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[fn_Split] ( @sList AS VARCHAR(MAX) )
RETURNS @retTable TABLE ( Val VARCHAR(MAX) )
AS 
    BEGIN 

        IF @sList IS NULL 
            RETURN

 --preparing the input list, removing IN keyword and parenthesis
        SET @sList = REPLACE(@sList, 'IN(', '')
        SET @sList = REPLACE(@sList, 'IN (', '')
        SET @sList = REPLACE(@sList, '(', '')
        SET @sList = REPLACE(@sList, ')', '')
-- SET @sList = LTRIM(RTRIM(@sList))
        SET @sList = @sList


 --scrolling thru values in @sList and populating temporary table
        DECLARE
            @Index INT ,
            @Delimiter CHAR(1)
        DECLARE @Result VARCHAR(MAX)


        SET @Delimiter = ','

        WHILE @sList <> '' 
            BEGIN
                SET @Index = CHARINDEX(@Delimiter, @sList)
                IF @Index <> 0 
                    BEGIN
                        SET @Result = LEFT(@sList, @Index - 1)
                        SET @sList = SUBSTRING(@sList, @Index + 1, LEN(@sList))
                    END
                ELSE 
                    BEGIN
                        SET @Result = @sList
                        SET @sList = ''
                    END

                INSERT  @retTable
                        SELECT
                            LTRIM(RTRIM(REPLACE(@Result, '''''', '''')))
            END

        RETURN 

    END


GO
