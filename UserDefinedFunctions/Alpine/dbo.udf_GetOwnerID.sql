/****** Object:  UserDefinedFunction [dbo].[udf_GetOwnerID]    Script Date: 5/15/2018 12:14:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[udf_GetOwnerID] ( -- Add the parameters for the function here
                                       @OwnerName VARCHAR(50) )
returns int
AS 
    BEGIN
        DECLARE @temptable TABLE ( ReturnINT INT )
        DECLARE 
            @AlpineStoreID INT ,
            @AlpinePersonID INT ,
            @LName VARCHAR(50) ,
            @FName VARCHAR(50) ,
            @Name VARCHAR(50) ,
            @Owner1ID VARCHAR(50)
        SET @Name = @OwnerName
        SELECT
            @FName = CASE WHEN NOT ( @Name = ''
                                     OR @Name LIKE '%Director%'
                                     OR @Name LIKE '%Training%'
                                     OR @Name LIKE '%FBC%'
                                     OR @Name LIKE '%TBD%'
                                   )
                          THEN SUBSTRING(ISNULL(@Name, ''), 1,
                                         CHARINDEX(' ', ISNULL(@Name, '')) - 1)
                          ELSE 'TBD'
                     END ,
            @LName = CASE WHEN NOT ( @Name = ''
                                     OR @Name LIKE '%Director%'
                                     OR @Name LIKE '%Training%'
                                     OR @Name LIKE '%FBC%'
                                     OR @Name LIKE '%TBD%'
                                   )
                          THEN SUBSTRING(ISNULL(@Name, ''),
                                         CHARINDEX(' ', ISNULL(@Name, '')) + 1,
                                         LEN(ISNULL(@Name, '')))
                          ELSE 'TBD'
                     END 
    -- Add new preson as needed
        SELECT
            @AlpinePersonID = PersonID
        FROM
            COR_PERSONS
        WHERE
            FirstName = @FName
            AND LastName = @LName
			AND PersonType=2001
     
        RETURN @AlpinePersonID

    END


GO
