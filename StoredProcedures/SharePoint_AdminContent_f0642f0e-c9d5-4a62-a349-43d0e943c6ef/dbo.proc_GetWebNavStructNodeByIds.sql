/****** Object:  StoredProcedure [dbo].[proc_GetWebNavStructNodeByIds]    Script Date: 5/15/2018 12:12:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebNavStructNodeByIds(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @Eid int)
AS
    SET NOCOUNT ON
    SELECT
        NavNodes.Eid,
        NavNodes.EidParent,
        NavNodes.ElementType,
        CASE
            WHEN
                NavNodes.ElementType = 1 OR
                NavNodes.NavSequence = 1
            THEN
                NavNodes.Url 
            ELSE
                CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END 
            END,
        NavNodes.Name,
        NavNodes.NodeMetainfo,
        NavNodes.NonNavPage,
        NavNodes.NavSequence,
        NavNodes.ChildOfSequence,
        NavNodes.DateLastModified
    FROM
        NavNodes
    LEFT OUTER JOIN
        Docs
    ON
        NavNodes.DocId = Docs.Id AND
        Docs.Level = 1
    WHERE
        NavNodes.SiteId = @SiteId AND
        NavNodes.WebId = @WebId AND
        NavNodes.Eid = @Eid
    SELECT
        NavNodes.Eid
    FROM
        NavNodes
    WHERE
        NavNodes.SiteId = @SiteId AND
        NavNodes.WebId = @WebId AND
        NavNodes.EidParent = @Eid
    RETURN 0

GO
