/****** Object:  StoredProcedure [dbo].[proc_MSS_GetContainingScopeDisplayGroups]    Script Date: 5/15/2018 12:11:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetContainingScopeDisplayGroups(
    @ScopeID int )
AS
    SELECT
        DisplayGroupID
    FROM
        dbo.MSSScopeDisplayGroupMemberships
    WHERE
        ScopeID = @ScopeID

    RETURN @@ERROR

GO
