/****** Object:  StoredProcedure [dbo].[proc_NavStructAddNewNode]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructAddNewNode(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @Eid int,
    @EidParent int,
    @EidPrevSib int,
    @ElementType tinyint,
    @Url nvarchar(260),
    @DocId uniqueidentifier,
    @Name nvarchar(256),
    @NodeMetainfo image,
    @NonNavPage bit,
    @NavSequence bit,
    @DateLastModified datetime,
    @EidBase int,
    @@EidHome int OUTPUT,
    @SelectNewNode bit = 0)
AS
    SET NOCOUNT ON
    DECLARE @ret int
    DECLARE @ChildOfSequence bit
    IF @SiteId IS NULL OR @WebId IS NULL
    BEGIN
        RETURN 10001
    END
    EXEC proc_TranslateTempEid @EidParent,
        @EidBase,
        @@EidHome,
        @EidParent OUTPUT
    EXEC proc_TranslateTempEid @EidPrevSib,
        @EidBase,
        @@EidHome,
        @EidPrevSib OUTPUT
    EXEC proc_NavStructDirtyPageDependents @SiteId, @WebId, @EidParent
    DECLARE @RankChild int
    EXEC @ret = proc_NavStructOpenSpaceUnderParent @SiteId, @WebId,
        @EidParent, @EidPrevSib, @RankChild OUTPUT, @ChildOfSequence OUTPUT
    IF @ret <> 0
    BEGIN
        RETURN @ret
    END
    IF @DocId IS NOT NULL AND @ChildOfSequence = 0
    BEGIN
        DECLARE @WebRootDir nvarchar(260)
        SELECT
            @WebRootDir = FullUrl
        FROM
            Webs
        WHERE
            SiteId = @SiteId AND
            Id = @WebId
        DECLARE @WebWelcomeName nvarchar(128)
        SELECT
            @WebWelcomeName = WelcomeName
        FROM
            fn_GetWelcomeName(@SiteId, @WebRootDir)
        IF EXISTS (
            SELECT
                *
            FROM
                Docs
            WHERE
                SiteId = @SiteId AND
                Id = @DocId AND
                DirName = @WebRootDir AND
                LeafName = @WebWelcomeName
            )
        BEGIN
            SET @@EidHome = @Eid
            EXEC proc_TranslateTempEid @@EidHome,
                @EidBase,
                NULL,
                @@EidHome OUTPUT
        END
    END
    EXEC proc_TranslateTempEid @Eid, @EidBase, @@EidHome, @Eid OUTPUT
    IF @DateLastModified IS NULL
    BEGIN
        SET @DateLastModified = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    END
    INSERT INTO NavNodes (
        SiteId,
        WebId,
        Eid,
        EidParent,
        NumChildren,
        RankChild,
        ElementType,
        Url,
        DocId,
        Name,
        DateLastModified,
        NodeMetainfo,
        NonNavPage,
        NavSequence,
        ChildOfSequence
        )
    VALUES (
        @SiteId,
        @WebId,
        @Eid,
        @EidParent,
        0, 
        @RankChild,
        @ElementType,
        @Url,
        @DocId,
        @Name,
        @DateLastModified,
        @NodeMetainfo,
        @NonNavPage,
        @NavSequence,
        @ChildOfSequence
        )
    IF @@RowCount <> 1
    BEGIN
        RETURN 10006
    END
    IF @Eid = 1000
    BEGIN
        EXEC proc_DirtyDependents @SiteId, 4, N'L:H'
    END
    IF @SelectNewNode = 1
        EXEC @ret = proc_GetWebNavStructNodeByIds @SiteId, @WebId, @Eid
    RETURN @ret

GO
