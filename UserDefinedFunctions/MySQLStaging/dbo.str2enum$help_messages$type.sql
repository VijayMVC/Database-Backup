/****** Object:  UserDefinedFunction [dbo].[str2enum$help_messages$type]    Script Date: 5/15/2018 12:15:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$help_messages$type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'Info' THEN 1
            WHEN 'Lightbulb' THEN 2
            WHEN 'Warning' THEN 3
            WHEN 'Messages' THEN 4
            WHEN 'Failure' THEN 5
            WHEN 'Success' THEN 6
            ELSE 0
         END
   END
GO
