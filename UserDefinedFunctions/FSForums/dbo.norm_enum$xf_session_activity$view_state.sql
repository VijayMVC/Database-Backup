/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_session_activity$view_state]    Script Date: 5/15/2018 12:14:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_session_activity$view_state 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_session_activity$view_state(dbo.str2enum$xf_session_activity$view_state(@setval))
   END
GO
