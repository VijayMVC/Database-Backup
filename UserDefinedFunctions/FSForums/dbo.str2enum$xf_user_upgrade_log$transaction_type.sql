/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_user_upgrade_log$transaction_type]    Script Date: 5/15/2018 12:14:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_user_upgrade_log$transaction_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'payment' THEN 1
            WHEN 'cancel' THEN 2
            WHEN 'info' THEN 3
            WHEN 'error' THEN 4
            ELSE 0
         END
   END
GO
