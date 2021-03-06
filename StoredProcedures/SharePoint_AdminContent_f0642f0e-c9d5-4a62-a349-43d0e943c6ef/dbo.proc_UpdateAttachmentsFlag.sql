/****** Object:  StoredProcedure [dbo].[proc_UpdateAttachmentsFlag]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateAttachmentsFlag(
    @SiteID         uniqueidentifier,
    @DirName        nvarchar(256),
    @UserID         int,
    @UpdateOptions  int = 3
    )
AS
    DECLARE @ListID             uniqueidentifier
    DECLARE @AttachFolder       nvarchar(256)
    DECLARE @AttachSubFolder    nvarchar(128)
    DECLARE @AttachDirName      nvarchar(256)
    DECLARE @AttachLeafName     nvarchar(128)
    EXEC proc_SplitUrl  @DirName, @AttachFolder OUTPUT,
        @AttachSubFolder OUTPUT
    SET @AttachFolder = LEFT(@AttachFolder, LEN(@AttachFolder) -
        12)
    EXEC proc_SplitUrl  @AttachFolder, @AttachDirName OUTPUT,
        @AttachLeafName OUTPUT
    SELECT
        @ListID = Docs.ListId
    FROM
        Docs, Lists
    WHERE
        Docs.SiteId  = @SiteID AND
        Docs.DirName = @AttachDirName AND
        Docs.LeafName = @AttachLeafName AND
        Docs.WebId   = Lists.tp_WebId AND
        Docs.ListId  = Lists.tp_ID AND
        Docs.Id      = Lists.tp_RootFolder AND
        Lists.tp_BaseType <> 1  AND
        Lists.tp_BaseType <> 4 AND
        Lists.tp_Flags & 0x08 = 0
    IF (@ListID IS NULL)
        RETURN 0
    BEGIN
        IF @UpdateOptions = 1
        BEGIN
            UPDATE
                UserData
            SET
                tp_HasAttachment = CASE 
                    WHEN EXISTS (SELECT * FROM Docs WHERE SiteId = @SiteID AND
                        Type = 0 AND DirName =
                        @DirName)
                    THEN 1 ELSE 0 END
            WHERE
                tp_ListID = @ListID AND
                tp_ID     = @AttachSubFolder AND
                tp_RowOrdinal = 0
        END
        ELSE
        BEGIN
            DECLARE @DTM datetime
            SELECT @DTM = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
            IF @UpdateOptions = 2 OR
                @UpdateOptions = 3
            BEGIN
                UPDATE
                    UserData
                SET
                    tp_HasAttachment = CASE 
                        WHEN EXISTS (SELECT * FROM Docs WHERE SiteId = @SiteID AND
                            Type = 0 AND DirName =
                            @DirName)                                 
                        THEN 1 ELSE 0 END
                WHERE
                    tp_ListID = @ListID AND
                    tp_ID     = @AttachSubFolder AND
                    tp_RowOrdinal = 0
                DECLARE @CurrentLevel tinyint
                SELECT
                    @CurrentLevel = tp_Level
                FROM
                    UserData
                WHERE
                    tp_ListID = @ListID AND
                    tp_ID     = @AttachSubFolder AND
                    tp_IsCurrent = 1
                EXEC proc_UpdateItemInNameValuePair
                    @SiteID, NULL, @ListID, @AttachSubFolder, @CurrentLevel,
                    '{d31655d1-1d5b-4511-95a1-7a09e9b75bf2}', @UserID,
                    '{28cf69c5-fa48-462a-b5cd-27b6f9d2bd5f}', @DTM
                UPDATE
                    UserData
                SET
                    tp_Version = tp_Version + 1,
                    tp_Editor = @UserID,
                    tp_Modified = @DTM
                WHERE
                    tp_ListID = @ListID AND
                    tp_ID     = @AttachSubFolder AND
                    tp_Level = @CurrentLevel
            END            
        END
    END
    RETURN 0

GO
