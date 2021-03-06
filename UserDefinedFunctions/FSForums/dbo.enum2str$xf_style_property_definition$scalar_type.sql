/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_style_property_definition$scalar_type]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_style_property_definition$scalar_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN ''
            WHEN 2 THEN 'longstring'
            WHEN 3 THEN 'color'
            WHEN 4 THEN 'number'
            WHEN 5 THEN 'boolean'
            WHEN 6 THEN 'template'
            ELSE ''
         END
   END
GO
