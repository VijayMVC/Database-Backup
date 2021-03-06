/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_option$default_watch_state]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_option$default_watch_state 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN '' THEN 1
            WHEN 'watch_no_email' THEN 2
            WHEN 'watch_email' THEN 3
            ELSE 0
         END
   END
GO
