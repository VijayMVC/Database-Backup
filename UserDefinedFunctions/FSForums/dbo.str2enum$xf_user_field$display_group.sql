/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_field$display_group]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_field$display_group 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'personal' THEN 1
            WHEN 'contact' THEN 2
            WHEN 'preferences' THEN 3
            ELSE 0
         END
   END
GO
