/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_option$data_type]    Script Date: 5/15/2018 12:14:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_option$data_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'string'
            WHEN 2 THEN 'integer'
            WHEN 3 THEN 'numeric'
            WHEN 4 THEN 'array'
            WHEN 5 THEN 'boolean'
            WHEN 6 THEN 'positive_integer'
            WHEN 7 THEN 'unsigned_integer'
            WHEN 8 THEN 'unsigned_numeric'
            ELSE ''
         END
   END
GO
