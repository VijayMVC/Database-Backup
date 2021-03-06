/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user_group_promotion_log$promotion_state]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user_group_promotion_log$promotion_state 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'automatic'
            WHEN 2 THEN 'manual'
            WHEN 3 THEN 'disabled'
            ELSE ''
         END
   END
GO
