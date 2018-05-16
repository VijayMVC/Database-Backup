/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopeDisplayGroupListInfo]    Script Date: 5/15/2018 12:13:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopeDisplayGroupListInfo(
    @DisplayGroupID int )
AS
    SELECT
        ScopeID
    FROM
        dbo.MSSScopeDisplayGroupMemberships
    WHERE
        DisplayGroupID = @DisplayGroupID AND
        Rank >= 0
    ORDER BY
        Rank
    RETURN @@ERROR

GO
