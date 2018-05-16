/****** Object:  UserDefinedFunction [dbo].[enum2str$coupon_rules_items$type]    Script Date: 5/15/2018 12:14:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$coupon_rules_items$type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'min_amount'
            WHEN 2 THEN 'min_quantity'
            ELSE ''
         END
   END
GO
