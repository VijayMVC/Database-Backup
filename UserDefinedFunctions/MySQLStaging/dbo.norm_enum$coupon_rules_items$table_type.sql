/****** Object:  UserDefinedFunction [dbo].[norm_enum$coupon_rules_items$table_type]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$coupon_rules_items$table_type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$coupon_rules_items$table_type(dbo.str2enum$coupon_rules_items$table_type(@setval))
   END
GO
