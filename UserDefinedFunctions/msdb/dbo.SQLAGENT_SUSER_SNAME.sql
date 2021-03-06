/****** Object:  UserDefinedFunction [dbo].[SQLAGENT_SUSER_SNAME]    Script Date: 5/15/2018 12:14:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE FUNCTION dbo.SQLAGENT_SUSER_SNAME(@user_sid VARBINARY(85)) RETURNS sysname
AS
BEGIN
  DECLARE @ret sysname
  IF @user_sid = 0xFFFFFFFF
    SELECT @ret = N'$(SQLAgentAccount)'
  ELSE
    SELECT @ret = SUSER_SNAME(@user_sid)
  RETURN @ret
END

GO
