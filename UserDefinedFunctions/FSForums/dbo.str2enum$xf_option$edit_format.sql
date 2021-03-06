/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_option$edit_format]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_option$edit_format 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'textbox' THEN 1
            WHEN 'spinbox' THEN 2
            WHEN 'onoff' THEN 3
            WHEN 'radio' THEN 4
            WHEN 'select' THEN 5
            WHEN 'checkbox' THEN 6
            WHEN 'template' THEN 7
            WHEN 'callback' THEN 8
            WHEN 'onofftextbox' THEN 9
            ELSE 0
         END
   END
GO
