/****** Object:  UserDefinedFunction [dbo].[str2enum$modifiers$modifier_special_type]    Script Date: 5/15/2018 12:15:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$modifiers$modifier_special_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'rush' THEN 1
            WHEN 'double' THEN 2
            ELSE 0
         END
   END
GO
