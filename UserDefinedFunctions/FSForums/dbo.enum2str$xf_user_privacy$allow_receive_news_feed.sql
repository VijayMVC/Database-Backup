/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user_privacy$allow_receive_news_feed]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user_privacy$allow_receive_news_feed 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'everyone'
            WHEN 2 THEN 'members'
            WHEN 3 THEN 'followed'
            WHEN 4 THEN 'none'
            ELSE ''
         END
   END
GO
