/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_route_prefix$route_type]    Script Date: 5/15/2018 12:14:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_route_prefix$route_type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_route_prefix$route_type(dbo.str2enum$xf_route_prefix$route_type(@setval))
   END
GO
