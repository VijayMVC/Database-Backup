/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user$gender]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user$gender 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN '' THEN 1
            WHEN 'male' THEN 2
            WHEN 'female' THEN 3
            ELSE 0
         END
   END
GO
