/****** Object:  UserDefinedFunction [dbo].[enum2str$report_tpl$auto_break]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$report_tpl$auto_break 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'true'
            WHEN 2 THEN 'false'
            ELSE ''
         END
   END
GO
