/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_conversation_recipient$recipient_state]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_conversation_recipient$recipient_state 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'active' THEN 1
            WHEN 'deleted' THEN 2
            WHEN 'deleted_ignored' THEN 3
            ELSE 0
         END
   END
GO
