/****** Object:  UserDefinedFunction [internal].[get_encryption_algorithm]    Script Date: 5/15/2018 12:15:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE FUNCTION [internal].[get_encryption_algorithm]()
RETURNS nvarchar(255)
AS
BEGIN
  DECLARE @value nvarchar(255)
  SELECT @value = [property_value] 
  FROM [catalog].[catalog_properties] 
  WHERE property_name = 'ENCRYPTION_ALGORITHM'
  IF @value IS NULL
      RETURN NULL
      
  DECLARE @valid INT
  SELECT @valid = [internal].[validate_encryption_algorithm](@value)
  IF @valid <> 0
      SET @value = NULL
  
  RETURN @value
END

GO
