/****** Object:  UserDefinedFunction [dbo].[fn_EscapeForLike]    Script Date: 5/15/2018 12:15:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_EscapeForLike(
    @Source nvarchar(260), 
    @AddTerminalWildcard bit = 1)
RETURNS nvarchar(1024)
WITH SCHEMABINDING
BEGIN
    RETURN
	CASE 
        WHEN @AddTerminalWildcard = 1 THEN
            REPLACE(
                REPLACE(
                    REPLACE(
                        @Source COLLATE Latin1_General_BIN,
                        N'[', N'[[]'), N'%', N'[%]'), N'_', N'[_]') + N'/%'
        ELSE
            REPLACE(
                REPLACE(
                    REPLACE(
                        @Source COLLATE Latin1_General_BIN,
                        N'[', N'[[]'), N'%', N'[%]'), N'_', N'[_]')
	END
END

GO
