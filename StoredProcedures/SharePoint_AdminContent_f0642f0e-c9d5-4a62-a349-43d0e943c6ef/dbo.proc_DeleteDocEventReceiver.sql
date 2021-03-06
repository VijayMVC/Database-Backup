/****** Object:  StoredProcedure [dbo].[proc_DeleteDocEventReceiver]    Script Date: 5/15/2018 12:12:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteDocEventReceiver(
    @DocUrl nvarchar(260),
    @Id uniqueidentifier,
    @Name nvarchar(256),
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ItemId int,
    @Type int,
    @SequenceNumber int,
    @Assembly nvarchar(256),
    @Class nvarchar(256),
    @Data nvarchar(256),
    @Filter nvarchar(256),
    @Credential int)
AS
    SET NOCOUNT ON
    DECLARE @DocDirName nvarchar(256)
    DECLARE @DocLeafName nvarchar(128)
    DECLARE @DocId uniqueidentifier
    EXEC proc_SplitUrl @DocUrl, @DocDirName OUTPUT, @DocLeafName OUTPUT
    SELECT
        @DocId = Id
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        WebId = @WebId
    IF (@DocId IS NULL)
        RETURN 3
    DELETE FROM
        EventReceivers
    WHERE
        SiteId = @SiteId AND
        Id = @Id AND
        Type != 32767
    IF @@ROWCOUNT <> 1
        RETURN 87
    RETURN 0

GO
