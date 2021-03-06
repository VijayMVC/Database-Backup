/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_report_comment$state_change]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_report_comment$state_change 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN ''
            WHEN 2 THEN 'open'
            WHEN 3 THEN 'assigned'
            WHEN 4 THEN 'resolved'
            WHEN 5 THEN 'rejected'
            ELSE ''
         END
   END
GO
