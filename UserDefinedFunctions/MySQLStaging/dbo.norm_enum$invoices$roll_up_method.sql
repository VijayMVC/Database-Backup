/****** Object:  UserDefinedFunction [dbo].[norm_enum$invoices$roll_up_method]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$invoices$roll_up_method 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$invoices$roll_up_method(dbo.str2enum$invoices$roll_up_method(@setval))
   END
GO
