/****** Object:  StoredProcedure [dbo].[proc_CheckNavStructContainsPage]    Script Date: 5/15/2018 12:11:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CheckNavStructContainsPage(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128)
    )
AS
    IF EXISTS(
        SELECT
            *
        FROM
            Docs
        INNER JOIN
            NavNodes
        ON
            Docs.SiteId = NavNodes.SiteId AND
            Docs.WebId = NavNodes.WebId AND
            Docs.Id = NavNodes.DocId
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DirName AND
            Docs.LeafName = @LeafName
        )
        RETURN 1
    ELSE
        RETURN 0

GO
