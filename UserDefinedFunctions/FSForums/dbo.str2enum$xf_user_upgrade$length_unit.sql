/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_upgrade$length_unit]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_upgrade$length_unit 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'day' THEN 1
            WHEN 'month' THEN 2
            WHEN 'year' THEN 3
            WHEN '' THEN 4
            ELSE 0
         END
   END
GO
