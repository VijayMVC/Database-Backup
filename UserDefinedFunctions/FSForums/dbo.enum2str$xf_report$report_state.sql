/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_report$report_state]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_report$report_state 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'open'
            WHEN 2 THEN 'assigned'
            WHEN 3 THEN 'resolved'
            WHEN 4 THEN 'rejected'
            ELSE ''
         END
   END
GO
