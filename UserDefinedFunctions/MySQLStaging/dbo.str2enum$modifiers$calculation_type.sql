/****** Object:  UserDefinedFunction [dbo].[str2enum$modifiers$calculation_type]    Script Date: 5/15/2018 12:15:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$modifiers$calculation_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'adds' THEN 1
            WHEN 'changes' THEN 2
            ELSE 0
         END
   END
GO
