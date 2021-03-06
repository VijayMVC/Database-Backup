/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_permission$default_value]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_permission$default_value 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'allow' THEN 1
            WHEN 'deny' THEN 2
            WHEN 'unset' THEN 3
            ELSE 0
         END
   END
GO
