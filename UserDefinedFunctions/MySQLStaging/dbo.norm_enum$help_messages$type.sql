/****** Object:  UserDefinedFunction [dbo].[norm_enum$help_messages$type]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$help_messages$type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$help_messages$type(dbo.str2enum$help_messages$type(@setval))
   END
GO
