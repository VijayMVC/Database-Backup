/****** Object:  UserDefinedFunction [dbo].[norm_enum$coupon_rules$compound_type]    Script Date: 5/15/2018 12:15:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$coupon_rules$compound_type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$coupon_rules$compound_type(dbo.str2enum$coupon_rules$compound_type(@setval))
   END
GO
