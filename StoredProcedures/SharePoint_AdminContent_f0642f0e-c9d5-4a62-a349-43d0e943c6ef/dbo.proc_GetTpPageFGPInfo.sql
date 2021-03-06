/****** Object:  StoredProcedure [dbo].[proc_GetTpPageFGPInfo]    Script Date: 5/15/2018 12:12:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetTpPageFGPInfo(
    @SiteId uniqueidentifier,
    @DocId uniqueidentifier,
    @RootWebId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @UserInfoListId uniqueidentifier,
    @UserId int,
    @Level tinyint)
AS
    DECLARE @ListIdTable TABLE (
        tp_ListId uniqueidentifier, 
        tp_HasFGP bit,
        tp_HasInternalFGP bit,
        tp_ScopeId uniqueidentifier,
        tp_ListRootUrlEscaped nvarchar(1024) COLLATE Latin1_General_CI_AS_KS_WS,
        tp_WebId uniqueidentifier)
    INSERT INTO
         @ListIdTable(
         tp_ListId,
         tp_HasFGP,
         tp_HasInternalFGP,
         tp_ScopeId,
         tp_ListRootUrlEscaped,
         tp_WebId)
    SELECT
         tp_ListId,
         tp_HasFGP,
         tp_HasInternalFGP,
         tp_ScopeId,
         tp_ListRootUrlEscaped,
         tp_WebId
    FROM
        fn_GetPageListIdTableWithUrls(@SiteId, @DocId, @RootWebId, @WebId,
        @ListId, @UserInfoListId, @UserId, @Level) AS ListUrlsTbl
    SELECT
        tp_ListId AS ListId,
        0x0 AS ScopeId,
        NULL AS Acl,
        0 AS AnonymousPermMask
    FROM 
        @ListIdTable AS WebPartList
    WHERE
        tp_HasFGP = 0
    UNION ALL
    SELECT
        Tbl.tp_ListId AS ListId, 
        Perms.ScopeId AS ScopeId,
        Perms.Acl AS Acl,
        Perms.AnonymousPermMask AS AnonymousPermMask
    FROM 
        @ListIdTable AS Tbl
    INNER LOOP JOIN
        Perms
    ON
        Tbl.tp_HasFGP = 1 AND
        Perms.SiteId = @SiteId AND
        Perms.ScopeId = Tbl.tp_ScopeId
    UNION ALL
    SELECT TOP 1001 
        Tbl.tp_ListId AS ListId, 
        Perms.ScopeId AS ScopeId,
        Perms.Acl AS Acl,
        Perms.AnonymousPermMask AS AnonymousPermMask
    FROM 
        @ListIdTable AS Tbl
    INNER LOOP JOIN
        Perms
    ON
        Tbl.tp_HasInternalFGP = 1 AND
        Perms.SiteId = @SiteId AND
        Perms.DelTransId = 0x AND
        Perms.ScopeUrl LIKE Tbl.tp_listRootUrlEscaped
    ORDER BY
        ListId

GO
