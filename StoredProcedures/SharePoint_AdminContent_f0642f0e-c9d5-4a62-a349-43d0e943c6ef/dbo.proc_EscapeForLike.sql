/****** Object:  StoredProcedure [dbo].[proc_EscapeForLike]    Script Date: 5/15/2018 12:12:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EscapeForLike(
    @Source nvarchar(260),
    @Escaped nvarchar(1024) OUTPUT,
    @AddTerminalWildcard bit = 1)
AS
    SELECT @Escaped = dbo.fn_EscapeForLike(@Source, @AddTerminalWildcard)
    RETURN 0

GO
