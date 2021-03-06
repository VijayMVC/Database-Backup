/****** Object:  UserDefinedFunction [dbo].[enum2str$help_messages$type]    Script Date: 5/15/2018 12:14:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$help_messages$type 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'Info'
            WHEN 2 THEN 'Lightbulb'
            WHEN 3 THEN 'Warning'
            WHEN 4 THEN 'Messages'
            WHEN 5 THEN 'Failure'
            WHEN 6 THEN 'Success'
            ELSE ''
         END
   END
GO
