/****** Object:  StoredProcedure [dbo].[proc_GetListContentTypeOrder]    Script Date: 5/15/2018 12:12:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetListContentTypeOrder(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT
        CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
        CASE 
        WHEN Docs.DocFlags & 8192 = 8192 THEN MetaInfo 
        ELSE NULL 
        END
    FROM
        Docs WITH (NOLOCK)
    INNER JOIN
        Lists
    ON
        Lists.tp_RootFolder = Docs.Id
    WHERE
        Lists.tp_WebId = @WebId AND
        Lists.tp_Id = @ListId

GO
