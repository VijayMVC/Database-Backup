/****** Object:  UserDefinedFunction [dbo].[norm_enum$proofs_emails_history$action]    Script Date: 5/15/2018 12:15:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$proofs_emails_history$action 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$proofs_emails_history$action(dbo.str2enum$proofs_emails_history$action(@setval))
   END
GO
