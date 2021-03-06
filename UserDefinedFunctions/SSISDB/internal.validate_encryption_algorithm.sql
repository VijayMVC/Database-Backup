/****** Object:  UserDefinedFunction [internal].[validate_encryption_algorithm]    Script Date: 5/15/2018 12:15:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE FUNCTION [internal].[validate_encryption_algorithm](@algorithm_name nvarchar(255))
RETURNS INT
AS
BEGIN
  DECLARE @ret INT 
     
  IF @algorithm_name IN ('TRIPLE_DES_3KEY', 'AES_128', 'AES_192' , 'AES_256')
      SET @ret = 0
  ELSE
      SET @ret = -1
  
  RETURN @ret
END

GO
