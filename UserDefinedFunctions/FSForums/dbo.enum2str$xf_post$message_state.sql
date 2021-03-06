/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_post$message_state]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_post$message_state 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'visible'
            WHEN 2 THEN 'moderated'
            WHEN 3 THEN 'deleted'
            ELSE ''
         END
   END
GO
