/****** Object:  StoredProcedure [dbo].[proc_UpdateDocEventReceiver]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateDocEventReceiver(
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
    DECLARE @RC int
    EXEC @RC = proc_UpdateEventReceiver
                    @Id,
                    @Name,
                    @SiteId,
                    @WebId,
                    @DocId,
                    3,
                    @ItemId,
                    NULL,
                    NULL,
                    @Type,
                    @SequenceNumber,
                    @Assembly,
                    @Class,
                    @Data,
                    @Filter,
                    NULL ,
                    0 ,
                    @Credential,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    NULL
    RETURN @RC

GO
