/****** Object:  UserDefinedFunction [dbo].[norm_enum$proofs_old$status]    Script Date: 5/15/2018 12:15:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$proofs_old$status 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$proofs_old$status(dbo.str2enum$proofs_old$status(@setval))
   END
GO
