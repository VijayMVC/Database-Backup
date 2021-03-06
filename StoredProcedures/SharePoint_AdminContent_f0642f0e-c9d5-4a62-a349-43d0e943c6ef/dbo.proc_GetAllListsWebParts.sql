/****** Object:  StoredProcedure [dbo].[proc_GetAllListsWebParts]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetAllListsWebParts(
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        WebParts.tp_ListID,
        WebParts.tp_Type,
        WebParts.tp_ID,
        WebParts.tp_Flags,
        WebParts.tp_DisplayName,
        WebParts.tp_ContentTypeId,
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
        AS
            tp_PageUrl,
        WebParts.tp_BaseViewId,
        WebParts.tp_View,
        WebParts.tp_Level,
        WebParts.tp_ContentTypeId
    FROM
        WebParts INNER JOIN Docs
    ON
        Docs.SiteId = WebParts.tp_SiteID AND
        Docs.Id = WebParts.tp_PageUrlID AND
        Docs.Level = WebParts.tp_Level AND
        Docs.Level = 1
    WHERE
        WebParts.tp_ListId IN (
            SELECT DISTINCT
                tp_ID
            FROM
                Lists AS Lists2
            WHERE
                Lists2.tp_WebID = @WebId)
    ORDER BY
        WebParts.tp_ListId,
        WebParts.tp_CreationTime
    RETURN 0

GO
