/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user$user_state]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user$user_state 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'valid' THEN 1
            WHEN 'email_confirm' THEN 2
            WHEN 'email_confirm_edit' THEN 3
            WHEN 'moderated' THEN 4
            WHEN 'email_bounce' THEN 5
            ELSE 0
         END
   END
GO
