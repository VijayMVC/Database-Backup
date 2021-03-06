/****** Object:  UserDefinedFunction [dbo].[fn_ParseStringList]    Script Date: 5/15/2018 12:15:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: fn_ParseStringList
 * -------------------------------------------------------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk - 02/25/2013
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * Purpose : 
 *     - Parses a comma separated list of strings.
 *   Adapted from: http://prosqlserver.com/blog/2011/02/05/parsing-csv-or-other-delimited-strings-in-sql-server/
 * -------------------------------------------------------------------------------------------------------------
*/
CREATE FUNCTION [dbo].[fn_ParseStringList]
(
    @List NVARCHAR(4000),
    @Delimiter NVARCHAR(20) = ','
)
    RETURNS @ValueTable TABLE ([ID] INT identity(1,1), [Value] VARCHAR(256) )
AS
BEGIN
    -- Check for NULL string or empty sting
    IF (@List IS NULL OR LEN(@List) < 1)
    BEGIN
        RETURN
    END;
    
    WITH parsedValues(i,j)
    AS
    (
        SELECT i = 1, j = CHARINDEX(@Delimiter, @List + @Delimiter)
        UNION ALL
        SELECT i = j + 1, j = CHARINDEX(@Delimiter, @List + @Delimiter, j + 1)
        FROM parsedValues
        WHERE CHARINDEX(@Delimiter, @List + @Delimiter, j + 1) <> 0
    )
        
    INSERT INTO @ValueTable([Value])
        SELECT SUBSTRING(@List, i, j - i) FROM parsedValues

    RETURN
END

GO
