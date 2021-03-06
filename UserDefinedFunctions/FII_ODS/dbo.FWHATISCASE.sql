/****** Object:  UserDefinedFunction [dbo].[FWHATISCASE]    Script Date: 5/15/2018 12:14:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- this is auxiliary function (for STRTRAN(), WORDTRAN())
-- returns 'U' if the string has a UPPER case
-- returns 'L' if the string has a lower case
-- returns 'P' if the string has a Proper case
-- else this function returns space(1)
CREATE FUNCTION [dbo].[FWHATISCASE] ( @cStr NVARCHAR(4000) )
RETURNS CHAR(1)
AS 
    BEGIN
        DECLARE
            @caseofstr CHAR(1) ,
            @LenStr SMALLINT ,
            @j SMALLINT
        SELECT
            @LenStr = DATALENGTH(@cStr)
            / ( CASE SQL_VARIANT_PROPERTY(@cStr, 'BaseType')
                  WHEN 'nvarchar' THEN 2
                  ELSE 1
                END )  -- for unicode

        SELECT
            @caseofstr = CASE WHEN CHARINDEX(LOWER(@cStr) COLLATE Latin1_General_BIN,
                                             UPPER(@cStr) COLLATE Latin1_General_BIN) = 1  -- no letters in string
                                   THEN SPACE(1)
                              WHEN CHARINDEX(@cStr COLLATE Latin1_General_BIN,
                                             UPPER(@cStr) COLLATE Latin1_General_BIN) = 1
                              THEN 'U'
                              WHEN CHARINDEX(@cStr COLLATE Latin1_General_BIN,
                                             LOWER(@cStr) COLLATE Latin1_General_BIN) = 1
                              THEN 'L'
                              ELSE NULL
                         END

        IF @caseofstr IS NULL 
            IF CHARINDEX(UPPER(SUBSTRING(@cStr, 1, 1)) COLLATE Latin1_General_BIN,
                         LOWER(SUBSTRING(@cStr, 1, 1)) COLLATE Latin1_General_BIN) <> 1
                AND CHARINDEX(UPPER(SUBSTRING(@cStr, 1, 1)) COLLATE Latin1_General_BIN,
                              SUBSTRING(@cStr, 1, 1) COLLATE Latin1_General_BIN) = 1
                AND CHARINDEX(LOWER(SUBSTRING(@cStr, 2, @LenStr - 1)) COLLATE Latin1_General_BIN,
                              SUBSTRING(@cStr, 2, @LenStr - 1) COLLATE Latin1_General_BIN) = 1 
                SELECT
                    @caseofstr = 'P'
            ELSE 
                BEGIN
                    SELECT
                        @j = 1
                    WHILE @j <= @LenStr 
                        BEGIN
                            IF CHARINDEX(UPPER(SUBSTRING(@cStr, @j, 1)) COLLATE Latin1_General_BIN,
                                         LOWER(SUBSTRING(@cStr, @j, 1)) COLLATE Latin1_General_BIN) <> 1    -- this is letter
                                BEGIN
                                    IF CHARINDEX(SUBSTRING(@cStr, @j, 1) COLLATE Latin1_General_BIN,
                                                 LOWER(SUBSTRING(@cStr, @j, 1)) COLLATE Latin1_General_BIN) = 1 
                                        SELECT
                                            @caseofstr = 'L'
                                    ELSE 
                                        SELECT
                                            @caseofstr = SPACE(1)
                                    BREAK
                                END
                            SELECT
                                @j = @j + 1
                        END
                END

        IF @caseofstr IS NULL 
            SELECT
                @caseofstr = SPACE(1)

        RETURN @caseofstr
    END


GO
