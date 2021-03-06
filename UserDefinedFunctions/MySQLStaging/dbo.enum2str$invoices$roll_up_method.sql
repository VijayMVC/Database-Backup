/****** Object:  UserDefinedFunction [dbo].[enum2str$invoices$roll_up_method]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$invoices$roll_up_method 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'detailed'
            WHEN 2 THEN 'price'
            WHEN 3 THEN 'all'
            WHEN 4 THEN 'default'
            ELSE ''
         END
   END
GO
