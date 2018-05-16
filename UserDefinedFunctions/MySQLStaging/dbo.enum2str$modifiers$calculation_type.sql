/****** Object:  UserDefinedFunction [dbo].[enum2str$modifiers$calculation_type]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$modifiers$calculation_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'adds'
            WHEN 2 THEN 'changes'
            ELSE ''
         END
   END
GO
