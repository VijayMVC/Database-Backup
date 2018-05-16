/****** Object:  UserDefinedFunction [dbo].[enum2str$xf_user$gender]    Script Date: 5/15/2018 12:14:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.enum2str$xf_user$gender 
( 
   @setval tinyint
)
RETURNS nvarchar(max)
AS 
   BEGIN
      RETURN 
         CASE @setval
            WHEN 1 THEN ''
            WHEN 2 THEN 'male'
            WHEN 3 THEN 'female'
            ELSE ''
         END
   END
GO
