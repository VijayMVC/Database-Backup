/****** Object:  UserDefinedFunction [dbo].[str2enum$job_line_items_modifiers_attributes$type]    Script Date: 5/15/2018 12:15:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$job_line_items_modifiers_attributes$type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'varchar' THEN 1
            WHEN 'decimal' THEN 2
            ELSE 0
         END
   END
GO
