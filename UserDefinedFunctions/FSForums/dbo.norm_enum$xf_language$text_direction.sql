/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_language$text_direction]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_language$text_direction 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_language$text_direction(dbo.str2enum$xf_language$text_direction(@setval))
   END
GO
