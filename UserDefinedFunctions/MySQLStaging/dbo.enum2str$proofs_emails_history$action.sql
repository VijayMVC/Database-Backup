/****** Object:  UserDefinedFunction [dbo].[enum2str$proofs_emails_history$action]    Script Date: 5/15/2018 12:15:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$proofs_emails_history$action 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN 'viewed'
            WHEN 2 THEN 'response'
            WHEN 3 THEN 'status'
            ELSE ''
         END
   END
GO
