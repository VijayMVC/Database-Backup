/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_upgrade_log$log_type]    Script Date: 5/15/2018 12:14:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_upgrade_log$log_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'install' THEN 1
            WHEN 'upgrade' THEN 2
            ELSE 0
         END
   END
GO
