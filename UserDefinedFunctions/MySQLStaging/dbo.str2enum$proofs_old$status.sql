/****** Object:  UserDefinedFunction [dbo].[str2enum$proofs_old$status]    Script Date: 5/15/2018 12:15:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.str2enum$proofs_old$status 
( 
   @setval nvarchar(max)
)
RETURNS tinyint
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 'PENDING' THEN 1
            WHEN 'SENT' THEN 2
            WHEN 'ACCEPTED' THEN 3
            WHEN 'REJECTED' THEN 4
            ELSE 0
         END
   END
GO
