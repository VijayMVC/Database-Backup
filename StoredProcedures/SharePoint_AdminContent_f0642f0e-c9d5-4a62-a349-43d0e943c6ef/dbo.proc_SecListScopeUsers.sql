/****** Object:  StoredProcedure [dbo].[proc_SecListScopeUsers]    Script Date: 5/15/2018 12:12:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecListScopeUsers(
    @SiteId     uniqueidentifier,
    @ScopeId    uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT DISTINCT
        tp_ID,
        tp_SystemID,
        tp_Title,
        tp_Login,
        tp_Email,
        tp_Notes,
        tp_SiteAdmin,
        tp_DomainGroup
    FROM
        RoleAssignment
    INNER LOOP JOIN
        UserInfo
    ON
        UserInfo.tp_SiteId = @SiteId AND
        RoleAssignment.SiteId = @SiteId AND
        UserInfo.tp_ID = RoleAssignment.PrincipalId AND
        RoleAssignment.ScopeId = @ScopeId
    WHERE
        UserInfo.tp_Deleted = 0
    OPTION (FORCE ORDER)

GO
