/****** Object:  UserDefinedFunction [dbo].[norm_enum$popups$expires]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$popups$expires 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$popups$expires(dbo.str2enum$popups$expires(@setval))
   END
GO
