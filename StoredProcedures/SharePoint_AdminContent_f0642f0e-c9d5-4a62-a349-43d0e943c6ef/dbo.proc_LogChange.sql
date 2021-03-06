/****** Object:  StoredProcedure [dbo].[proc_LogChange]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_LogChange(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ItemId int,
    @DocId uniqueidentifier,
    @Guid0 uniqueidentifier,
    @Int0 int,
    @FullUrl nvarchar(260),
    @EventType int,
    @ObjectType int,
    @TimeLastModifiedIncoming datetime,
    @ItemName nvarchar(255) = NULL,
    @Int1 int = NULL)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    DECLARE @TimeLastModified datetime
    SET @Now = GETUTCDATE()
    IF @TimeLastModifiedIncoming IS NOT NULL
    BEGIN
        SET @TimeLastModified = @TimeLastModifiedIncoming
    END
    ELSE
    BEGIN
        SET @TimeLastModified = @Now
    END
    INSERT INTO EventCache( 
        EventTime,
        SiteId,
        WebId,
        ListId,
        ItemId,
        DocId,
        Guid0,
        Int0,
        Int1,
        ItemFullUrl,
        EventType,
        ObjectType,
        TimeLastModified,
        ItemName)
    VALUES( 
        @Now,
        @SiteId,
        @WebId,
        @ListId,
        @ItemId,
        @DocId,
        @Guid0,
        @Int0,
        @Int1,
        @FullUrl,
        @EventType,
        @ObjectType,
        @TimeLastModified,
        @ItemName) 

GO
