/****** Object:  StoredProcedure [dbo].[proc_MSS_GetDeletedScopesForCompilation]    Script Date: 5/15/2018 12:13:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetDeletedScopesForCompilation
AS
    SELECT 
        ScopeID
    FROM 
        dbo.MSSDeletedScopesForCompilation
    RETURN @@ERROR

GO
