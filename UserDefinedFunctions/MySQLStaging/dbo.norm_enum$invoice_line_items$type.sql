/****** Object:  UserDefinedFunction [dbo].[norm_enum$invoice_line_items$type]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$invoice_line_items$type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$invoice_line_items$type(dbo.str2enum$invoice_line_items$type(@setval))
   END
GO
