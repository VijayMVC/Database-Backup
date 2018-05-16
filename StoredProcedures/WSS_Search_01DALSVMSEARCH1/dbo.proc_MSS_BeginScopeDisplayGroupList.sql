/****** Object:  StoredProcedure [dbo].[proc_MSS_BeginScopeDisplayGroupList]    Script Date: 5/15/2018 12:13:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_BeginScopeDisplayGroupList(
    @DisplayGroupID int )
AS
    DELETE FROM
        dbo.MSSScopeDisplayGroupMemberships
    WHERE
        DisplayGroupID = @DisplayGroupID AND
        Rank < 0
    RETURN @@ERROR

GO
