/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_session_activity$view_state]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_session_activity$view_state 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'valid'
            WHEN 2 THEN 'error'
            ELSE ''
         END
   END
GO
