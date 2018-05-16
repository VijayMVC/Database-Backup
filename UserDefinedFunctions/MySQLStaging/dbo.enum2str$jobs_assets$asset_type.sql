/****** Object:  UserDefinedFunction [dbo].[enum2str$jobs_assets$asset_type]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$jobs_assets$asset_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'image'
            WHEN 2 THEN 'file'
            ELSE ''
         END
   END
GO
