/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_permission$default_value]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_permission$default_value 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'allow'
            WHEN 2 THEN 'deny'
            WHEN 3 THEN 'unset'
            ELSE ''
         END
   END
GO
