/****** Object:  StoredProcedure [dbo].[proc_NavStructAddNewNodeByDocId]    Script Date: 5/15/2018 12:12:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructAddNewNodeByDocId(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @Eid int,
    @EidParent int,
    @EidPrevSib int,
    @ElementType tinyint,
    @DocId uniqueidentifier,
    @Name nvarchar(256),
    @NodeMetainfo image,
    @NonNavPage bit,
    @NavSequence bit,
    @EidBase int,
    @@EidHome int OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @ret int
    IF NOT EXISTS(
        SELECT
            *
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            Id = @DocId AND
            Level = 1
        )
    BEGIN
        IF EXISTS(
            SELECT
                *
            FROM
                Docs
            WHERE
                SiteId = @SiteId AND
                Id = @DocId
            )
        BEGIN
            RETURN 10008
        END
        ELSE
        BEGIN
            RETURN 10007
        END
    END
    EXEC @ret = proc_NavStructAddNewNode @SiteId, @WebId,
        @Eid, @EidParent, @EidPrevSib, @ElementType, NULL, @DocId, @Name,
        @NodeMetainfo, @NonNavPage, @NavSequence, NULL, @EidBase,
        @@EidHome OUTPUT, @SelectNewNode = 1
    RETURN @ret

GO
