/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user$user_state]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user$user_state 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'valid'
            WHEN 2 THEN 'email_confirm'
            WHEN 3 THEN 'email_confirm_edit'
            WHEN 4 THEN 'moderated'
            WHEN 5 THEN 'email_bounce'
            ELSE ''
         END
   END
GO
