/****** Object:  StoredProcedure [dbo].[proc_NavStructOpenSpaceUnderParent]    Script Date: 5/15/2018 12:12:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructOpenSpaceUnderParent(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @EidParent int,
    @EidPrevSib int,
    @@RankChildNew int OUTPUT,
    @@ParentIsSequence bit OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @NumChildren int
    DECLARE @GrandchildOfSequence bit
    SELECT
        @GrandchildOfSequence = ChildOfSequence,
        @@ParentIsSequence = NavSequence,
        @NumChildren = NumChildren
    FROM
        NavNodes
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        Eid = @EidParent
    IF @@RowCount <> 1
        RETURN 10002
    UPDATE
        NavNodes
    SET
        NumChildren = @NumChildren + 1
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        Eid = @EidParent
    IF @@RowCount <> 1
    BEGIN
        RETURN 10002
    END
    IF @EidPrevSib = -1 
    BEGIN
        SET @@RankChildNew = 0
    END
    ELSE
    BEGIN
        IF @EidPrevSib = -2 
        BEGIN
            SET @@RankChildNew = @NumChildren
        END
        ELSE 
        BEGIN
            SELECT
                @@RankChildNew = RankChild + 1
            FROM
                NavNodes
            WHERE
                SiteId = @SiteId AND
                WebId = @WebId AND
                Eid = @EidPrevSib AND
                EidParent = @EidParent
            IF @@RankChildNew IS NULL
            BEGIN
                SET @@RankChildNew = @NumChildren
            END
        END
    END
    IF @@RankChildNew < @NumChildren
    BEGIN
        UPDATE
            NavNodes
        SET
            RankChild = RankChild + 1
        WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            EidParent = @EidParent AND
            RankChild >= @@RankChildNew
    END
    RETURN 0

GO
