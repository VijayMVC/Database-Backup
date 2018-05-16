/****** Object:  UserDefinedFunction [dbo].[norm_enum$jobs_assets$asset_type]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$jobs_assets$asset_type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$jobs_assets$asset_type(dbo.str2enum$jobs_assets$asset_type(@setval))
   END
GO
