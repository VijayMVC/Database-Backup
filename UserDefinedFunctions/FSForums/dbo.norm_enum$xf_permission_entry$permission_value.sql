/****** Object:  UserDefinedFunction [dbo].[norm_enum$xf_permission_entry$permission_value]    Script Date: 5/15/2018 12:14:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$xf_permission_entry$permission_value 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$xf_permission_entry$permission_value(dbo.str2enum$xf_permission_entry$permission_value(@setval))
   END
GO
