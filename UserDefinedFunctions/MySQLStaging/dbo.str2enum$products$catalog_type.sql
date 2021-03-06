/****** Object:  UserDefinedFunction [dbo].[str2enum$products$catalog_type]    Script Date: 5/15/2018 12:15:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$products$catalog_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'None' THEN 1
            WHEN 'Private' THEN 2
            WHEN 'Account' THEN 3
            ELSE 0
         END
   END
GO
