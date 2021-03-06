/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_option$data_type]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_option$data_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'string' THEN 1
            WHEN 'integer' THEN 2
            WHEN 'numeric' THEN 3
            WHEN 'array' THEN 4
            WHEN 'boolean' THEN 5
            WHEN 'positive_integer' THEN 6
            WHEN 'unsigned_integer' THEN 7
            WHEN 'unsigned_numeric' THEN 8
            ELSE 0
         END
   END
GO
