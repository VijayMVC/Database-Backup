/****** Object:  UserDefinedFunction [dbo].[fn_GetPageListIdTableWithUrls]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetPageListIdTableWithUrls(
    @SiteId uniqueidentifier,
    @DocId uniqueidentifier,
    @RootWebId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @UserInfoListId uniqueidentifier,
    @UserId int,
    @Level tinyint)
RETURNS TABLE
AS
RETURN
(
    SELECT
        PageLists.tp_ListId AS tp_ListId,
        PageLists.tp_WebId AS tp_WebId,
        PageLists.tp_HasFGP AS tp_HasFGP,
        PageLists.tp_HasInternalFGP AS tp_HasInternalFGP,
        PageLists.tp_ScopeId AS tp_ScopeId,
        dbo.fn_EscapeForLike(CASE WHEN (DATALENGTH(AllDocs.DirName) = 0) THEN AllDocs.LeafName WHEN (DATALENGTH(AllDocs.LeafName) = 0) THEN AllDocs.DirName ELSE AllDocs.DirName + N'/' + AllDocs.LeafName END, 1) AS tp_listRootUrlEscaped
    FROM
        fn_GetPageListIdTable(@SiteId, @DocId, @RootWebId, @WebId,
        @ListId, @UserInfoListId, @UserId, @Level) PageLists
    INNER JOIN 
        AllDocs 
    ON 
        AllDocs.Id = PageLists.tp_RootFolder AND
        AllDocs.Level = 1
)

GO
