/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_ip_match$match_type]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_ip_match$match_type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_ip_match$match_type(dbo.str2enum$xf_ip_match$match_type(@setval))
   END
GO
