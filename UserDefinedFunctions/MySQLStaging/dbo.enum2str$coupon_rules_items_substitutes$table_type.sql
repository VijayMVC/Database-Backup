/****** Object:  UserDefinedFunction [dbo].[enum2str$coupon_rules_items_substitutes$table_type]    Script Date: 5/15/2018 12:14:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$coupon_rules_items_substitutes$table_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'categories'
            WHEN 2 THEN 'services'
            WHEN 3 THEN 'products'
            WHEN 4 THEN 'packages'
            ELSE ''
         END
   END
GO
