/****** Object:  StoredProcedure [dbo].[proc_MSS_ScopeCacheGetChanges]    Script Date: 5/15/2018 12:13:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ScopeCacheGetChanges(
    @ConsumerName nvarchar( 60 ) )
AS
    DECLARE
        @ConsumerID int
    SET
        @ConsumerID = ( SELECT ConsumerID 
                        FROM dbo.MSSRegisteredConsumers 
                        WHERE ConsumerName = @ConsumerName )
    SELECT
        C.ScopeID,
        C.Name,
        S.Description,
        S.AlternateResultsPageUrl,
        S.CompilationState
    FROM
        dbo.MSSCompiledScopes AS C
    JOIN
        dbo.MSSScopes AS S
    ON
        C.ScopeID = S.ScopeID
    WHERE
        C.ConsumerID = @ConsumerID
    SELECT
        DisplayGroupID,
        Name,
        DefaultScopeID
    FROM
        dbo.MSSScopeDisplayGroups
    WHERE
        ConsumerID = @ConsumerID
    SELECT
        M.DisplayGroupID,
        M.ScopeID,
        M.Rank
    FROM
        dbo.MSSScopeDisplayGroups AS G
    JOIN
        dbo.MSSScopeDisplayGroupMemberships AS M
    ON
        G.DisplayGroupID = M.DisplayGroupID
    JOIN
        dbo.MSSCompiledScopes AS S
    ON
        M.ScopeID = S.ScopeID
    WHERE
        G.ConsumerID = @ConsumerID AND
        M.Rank >= 0
    ORDER BY
        M.Rank
    SELECT
        LastUpdate
    FROM
        dbo.MSSRegisteredConsumers
    WHERE
        ConsumerName = @ConsumerName
    RETURN @@ERROR

GO
