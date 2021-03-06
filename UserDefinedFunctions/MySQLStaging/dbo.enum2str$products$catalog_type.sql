/****** Object:  UserDefinedFunction [dbo].[enum2str$products$catalog_type]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$products$catalog_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'None'
            WHEN 2 THEN 'Private'
            WHEN 3 THEN 'Account'
            ELSE ''
         END
   END
GO
