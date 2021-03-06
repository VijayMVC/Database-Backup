/****** Object:  UserDefinedFunction [dbo].[enum2str$products$pricing_method]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$products$pricing_method 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'area'
            WHEN 2 THEN 'linear'
            WHEN 3 THEN 'fixed'
            WHEN 4 THEN 'rigid'
            WHEN 5 THEN 'manual'
            WHEN 6 THEN 'table'
            ELSE ''
         END
   END
GO
