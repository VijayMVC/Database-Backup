/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user_field$field_type]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user_field$field_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'textbox'
            WHEN 2 THEN 'textarea'
            WHEN 3 THEN 'select'
            WHEN 4 THEN 'radio'
            WHEN 5 THEN 'checkbox'
            WHEN 6 THEN 'multiselect'
            ELSE ''
         END
   END
GO
