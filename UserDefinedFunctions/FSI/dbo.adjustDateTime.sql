/****** Object:  UserDefinedFunction [dbo].[adjustDateTime]    Script Date: 5/15/2018 12:14:50 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE FUNCTION [dbo].[adjustDateTime] (
@inputdate datetime
) RETURNS datetime 
AS  
BEGIN 
 return (DATEADD(hour,-13, @inputdate))
END
GO
