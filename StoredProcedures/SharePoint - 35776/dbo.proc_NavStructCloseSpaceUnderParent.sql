/****** Object:  StoredProcedure [dbo].[proc_NavStructCloseSpaceUnderParent]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructCloseSpaceUnderParent(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @EidParent int,
    @RankChild int)
AS
    SET NOCOUNT ON
    UPDATE
        NavNodes
    SET
        NumChildren = NumChildren - 1
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        Eid = @EidParent
    IF @@RowCount <> 1
    BEGIN
        RETURN 10002
    END
    UPDATE
        NavNodes
    SET
        RankChild = RankChild - 1
    WHERE
        SiteId = @SiteId AND
        WebId = @WebId AND
        EidParent = @EidParent AND
        RankChild > @RankChild

GO
