/****** Object:  UserDefinedFunction [dbo].[norm_enum$help$type]    Script Date: 5/15/2018 12:15:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.norm_enum$help$type 
( 
   @setval nvarchar(max)
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN dbo.enum2str$help$type(dbo.str2enum$help$type(@setval))
   END
GO
