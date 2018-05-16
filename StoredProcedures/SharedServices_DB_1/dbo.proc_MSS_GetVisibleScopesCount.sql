/****** Object:  StoredProcedure [dbo].[proc_MSS_GetVisibleScopesCount]    Script Date: 5/15/2018 12:11:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetVisibleScopesCount(
    @Count int OUTPUT )
AS
    SELECT
        @Count = COUNT(*)
    FROM
        dbo.MSSScopes
    WHERE
        DisplayInAdminUI = 1

    RETURN @@ERROR

GO
