/****** Object:  UserDefinedFunction [dbo].[enum2str$modifiers$modifier_special_type]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$modifiers$modifier_special_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'rush'
            WHEN 2 THEN 'double'
            ELSE ''
         END
   END
GO
