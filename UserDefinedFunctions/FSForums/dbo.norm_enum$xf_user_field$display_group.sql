/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_user_field$display_group]    Script Date: 5/15/2018 12:14:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_user_field$display_group 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_user_field$display_group(dbo.str2enum$xf_user_field$display_group(@setval))
   END
GO
