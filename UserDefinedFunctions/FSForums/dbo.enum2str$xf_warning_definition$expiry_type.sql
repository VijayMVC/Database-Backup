/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_warning_definition$expiry_type]    Script Date: 5/15/2018 12:14:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_warning_definition$expiry_type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'never'
            WHEN 2 THEN 'days'
            WHEN 3 THEN 'weeks'
            WHEN 4 THEN 'months'
            WHEN 5 THEN 'years'
            ELSE ''
         END
   END
GO
