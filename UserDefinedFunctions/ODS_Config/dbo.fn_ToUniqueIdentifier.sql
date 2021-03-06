/****** Object:  UserDefinedFunction [dbo].[fn_ToUniqueIdentifier]    Script Date: 5/15/2018 12:15:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
 * Object: fn_ToUniqueIdentifier
 * --------------------------------------------------------------
 * Updated By: Jeremiah Nazaruk
 * Source : Pragmatic Works - BI xPress Auditing Framework 47
 * Created On : 6/13/2013
 * Purpose : 
 *     - Returns either a valid UNIQUEIDENTIFIER or NULL.  Any string value can be input without throwing an exception.
 * --------------------------------------------------------------
*/
CREATE FUNCTION [dbo].[fn_ToUniqueIdentifier](@input NVARCHAR(MAX))
    RETURNS UNIQUEIDENTIFIER
    WITH SCHEMABINDING
AS
BEGIN
    DECLARE @guid uniqueidentifier

    SET @guid = NULL

    -- If this is a valid GUID, try to convert it
    IF([dbo].[fn_IsValidUniqueIdentifier](@input) = 1)
    BEGIN
        DECLARE @guidString AS NVARCHAR(MAX)

        SET @guidString = STUFF(STUFF(STUFF(STUFF(UPPER(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(@input, '-', ''), '{', ''), '}', '')))) , 9, 0, '-'), 14, 0, '-') , 19, 0, '-') , 24, 0, '-')
    
        IF(@guidString IS NOT NULL)
        BEGIN
            SET @guid = CONVERT(uniqueidentifier, @guidString)
        END
    END

    RETURN @guid
END

GO
