/****** Object:  UserDefinedFunction [dbo].[enum2str$proofs_old$status]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$proofs_old$status 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'PENDING'
            WHEN 2 THEN 'SENT'
            WHEN 3 THEN 'ACCEPTED'
            WHEN 4 THEN 'REJECTED'
            ELSE ''
         END
   END
GO
