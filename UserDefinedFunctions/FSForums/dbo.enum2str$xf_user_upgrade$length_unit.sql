/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user_upgrade$length_unit]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user_upgrade$length_unit 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'day'
            WHEN 2 THEN 'month'
            WHEN 3 THEN 'year'
            WHEN 4 THEN ''
            ELSE ''
         END
   END
GO
