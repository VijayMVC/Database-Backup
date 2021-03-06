/****** Object:  StoredProcedure [dbo].[proc_SecGetIndividualUrlSecurityCheckEventReceivers]    Script Date: 5/15/2018 12:12:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetIndividualUrlSecurityCheckEventReceivers(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @FullUrl nvarchar(260),
    @DirName nvarchar(256),
    @LeafName nvarchar(128),   
    @UserId int,
    @AttachmentsFlag tinyint,
    @bGetAttachmentWritePerm bit,
    @bGetListMetaData bit = 0,
    @bGetListScopes bit = 0,
    @bLockLists bit = 0,
    @Level tinyint = NULL,
    @HasEventReceiver bit OUTPUT)
AS
    DECLARE @DocId uniqueidentifier
    EXEC proc_SecGetIndividualUrlSecurity
        @SiteId,
        @WebId,
        @FullUrl,
        @DirName,
        @LeafName,
        @UserId,
        @AttachmentsFlag,
        @bGetAttachmentWritePerm,
        @bGetListMetaData,
        @bGetListScopes,
        @bLockLists,
        @Level
    SELECT
        @DocId = Id
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        WebId = @WebId
    IF (@DocId IS NOT NULL AND
        EXISTS (SELECT * FROM EventReceivers WHERE
            SiteId = @SiteId AND
            WebId = @WebId AND
            HostId = @DocId))
        SET @HasEventReceiver = 1
    ELSE
        SET @HasEventReceiver = 0

GO
