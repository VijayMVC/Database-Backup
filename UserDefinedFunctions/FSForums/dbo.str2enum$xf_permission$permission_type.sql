/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_permission$permission_type]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_permission$permission_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'flag' THEN 1
            WHEN 'integer' THEN 2
            ELSE 0
         END
   END
GO
