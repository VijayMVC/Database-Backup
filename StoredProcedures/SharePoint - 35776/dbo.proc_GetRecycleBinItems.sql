/****** Object:  StoredProcedure [dbo].[proc_GetRecycleBinItems]    Script Date: 5/15/2018 12:12:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetRecycleBinItems(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @UserId int)
AS
    SET NOCOUNT ON
    SELECT
        RecycleBin.Title,
        DirName,
        LeafName,
        AuthorId,
        UA.tp_Title AS AuthorName,
        UA.tp_Email AS AuthorEmail,
        DeleteDate,
        Size,
        DeleteUserId,
        UD.tp_Title AS DeletedByName,
        UD.tp_Email AS DeletedByEmail,
        DeleteTransactionId,
        ItemType,
        BinId,
        CASE 
        WHEN ItemType = 4 OR ItemType = 3
            THEN (SELECT tp_ImageUrl FROM AllLists WHERE tp_Id = RecycleBin.ListId)
        ELSE NULL
        END,
        ProgId
    FROM
        RecycleBin
    INNER JOIN
        Webs
    ON
        RecycleBin.WebId = Webs.Id
    LEFT OUTER JOIN
        UserInfo UD
    ON
        UD.tp_SiteId = RecycleBin.SiteId AND UD.tp_Id = DeleteUserId
    LEFT OUTER JOIN
        UserInfo UA
    ON
        UA.tp_SiteId = RecycleBin.SiteId AND UA.tp_Id = AuthorId
    WHERE
        WebId = @WebId AND
        BinId = 1 AND
        DeleteUserId = @UserId
    RETURN 0

GO
