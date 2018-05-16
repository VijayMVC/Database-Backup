/****** Object:  UserDefinedFunction [dbo].[norm_enum$products$pricing_method]    Script Date: 5/15/2018 12:15:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$products$pricing_method 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$products$pricing_method(dbo.str2enum$products$pricing_method(@setval))
   END
GO
