/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_permission_entry$permission_value]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_permission_entry$permission_value 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'unset'
            WHEN 2 THEN 'allow'
            WHEN 3 THEN 'deny'
            WHEN 4 THEN 'use_int'
            ELSE ''
         END
   END
GO
