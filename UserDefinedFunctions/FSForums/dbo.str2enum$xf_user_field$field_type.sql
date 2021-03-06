/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_field$field_type]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_field$field_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'textbox' THEN 1
            WHEN 'textarea' THEN 2
            WHEN 'select' THEN 3
            WHEN 'radio' THEN 4
            WHEN 'checkbox' THEN 5
            WHEN 'multiselect' THEN 6
            ELSE 0
         END
   END
GO
