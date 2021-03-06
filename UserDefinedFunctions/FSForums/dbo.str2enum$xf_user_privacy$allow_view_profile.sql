/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_privacy$allow_view_profile]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_privacy$allow_view_profile 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'everyone' THEN 1
            WHEN 'members' THEN 2
            WHEN 'followed' THEN 3
            WHEN 'none' THEN 4
            ELSE 0
         END
   END
GO
