/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_forum_watch$notify_on]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_forum_watch$notify_on 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_forum_watch$notify_on(dbo.str2enum$xf_forum_watch$notify_on(@setval))
   END
GO
