/****** Object:  UserDefinedFunction [dbo].[str2enum$xf_ip_match$match_type]    Script Date: 5/15/2018 12:14:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$xf_ip_match$match_type 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'banned' THEN 1
            WHEN 'discouraged' THEN 2
            ELSE 0
         END
   END
GO
