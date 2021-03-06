/****** Object:  StoredProcedure [dbo].[proc_SecListScopeGroups]    Script Date: 5/15/2018 12:12:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecListScopeGroups(
    @SiteId  uniqueidentifier,
    @ScopeId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT DISTINCT
        V.*
    FROM
        Sec_SiteGroupsView V
    INNER JOIN
        RoleAssignment
    ON
        RoleAssignment.PrincipalId = V.ID
    WHERE
        RoleAssignment.ScopeId = @ScopeId AND
        V.SiteID = @SiteId

GO
