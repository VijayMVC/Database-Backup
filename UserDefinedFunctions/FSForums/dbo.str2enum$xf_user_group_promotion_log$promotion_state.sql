/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_group_promotion_log$promotion_state]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_group_promotion_log$promotion_state 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'automatic' THEN 1
            WHEN 'manual' THEN 2
            WHEN 'disabled' THEN 3
            ELSE 0
         END
   END
GO
