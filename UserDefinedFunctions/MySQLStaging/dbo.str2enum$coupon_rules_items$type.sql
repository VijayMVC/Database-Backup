/****** Object:  UserDefinedFunction [dbo].[str2enum$coupon_rules_items$type]    Script Date: 5/15/2018 12:15:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$coupon_rules_items$type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'min_amount' THEN 1
            WHEN 'min_quantity' THEN 2
            ELSE 0
         END
   END
GO
