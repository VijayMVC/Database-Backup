/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopesCount]    Script Date: 5/15/2018 12:11:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopesCount(
    @Count int OUTPUT )
AS
    SELECT
        @Count = COUNT(*)
    FROM
        dbo.MSSScopes

    RETURN @@ERROR

GO
