/****** Object:  UserDefinedFunction [dbo].[norm_enum$report_tpl$auto_break]    Script Date: 5/15/2018 12:15:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$report_tpl$auto_break 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$report_tpl$auto_break(dbo.str2enum$report_tpl$auto_break(@setval))
   END
GO
