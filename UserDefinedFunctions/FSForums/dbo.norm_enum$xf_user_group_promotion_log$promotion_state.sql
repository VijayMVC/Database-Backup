/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_user_group_promotion_log$promotion_state]    Script Date: 5/15/2018 12:14:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_user_group_promotion_log$promotion_state 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_user_group_promotion_log$promotion_state(dbo.str2enum$xf_user_group_promotion_log$promotion_state(@setval))
   END
GO
