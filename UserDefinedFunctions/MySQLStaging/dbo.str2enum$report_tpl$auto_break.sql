/****** Object:  UserDefinedFunction [dbo].[str2enum$report_tpl$auto_break]    Script Date: 5/15/2018 12:15:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$report_tpl$auto_break 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'true' THEN 1
            WHEN 'false' THEN 2
            ELSE 0
         END
   END
GO
