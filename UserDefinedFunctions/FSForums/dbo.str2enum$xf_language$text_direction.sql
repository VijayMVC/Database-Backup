/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_language$text_direction]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_language$text_direction 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'LTR' THEN 1
            WHEN 'RTL' THEN 2
            ELSE 0
         END
   END
GO
