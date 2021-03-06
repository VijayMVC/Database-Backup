/****** Object:  StoredProcedure [dbo].[proc_SetHomeNavNode]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetHomeNavNode(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DirName nvarchar(256),
    @NewWelcomeName nvarchar(128),
    @ChangedHome bit OUTPUT
    )
AS
    DECLARE @EidNewHome int
    SET @ChangedHome = 0
    SELECT 
        @EidNewHome = NavNodes.Eid
    FROM
        NavNodes
    INNER JOIN
        Docs
    ON
        Docs.SiteId = NavNodes.SiteId AND
        Docs.WebId = NavNodes.WebId AND
        Docs.Id = NavNodes.DocId
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.LeafName = @NewWelcomeName AND
        Docs.DirName = @DirName AND
        NavNodes.ChildOfSequence = 0
    IF @EidNewHome IS NOT NULL AND
        @EidNewHome <> 1000 AND
        NOT EXISTS(SELECT 1 FROM NavNodes
            WHERE SiteId = @SiteId AND WebId = @WebId AND Eid = 1000)
    BEGIN
        UPDATE
            NavNodes
        SET
            Eid = 1000
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            Eid = @EidNewHome
        UPDATE
            NavNodes
        SET
            EidParent = 1000
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            EidParent = @EidNewHome
        SET @ChangedHome = 1
        EXEC proc_NavStructLogChangesAndUpdateSiteChangedTime @SiteId, @WebId, NULL
    END

GO
