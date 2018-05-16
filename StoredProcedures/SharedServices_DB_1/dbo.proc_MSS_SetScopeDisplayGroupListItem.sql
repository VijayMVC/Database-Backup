/****** Object:  StoredProcedure [dbo].[proc_MSS_SetScopeDisplayGroupListItem]    Script Date: 5/15/2018 12:11:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetScopeDisplayGroupListItem(
    @DisplayGroupID int,
    @ScopeID int,
    @Rank int )
AS
    INSERT INTO
        dbo.MSSScopeDisplayGroupMemberships
    VALUES (
        @DisplayGroupID,
        @ScopeID,
        @Rank )

    RETURN @@ERROR

GO
