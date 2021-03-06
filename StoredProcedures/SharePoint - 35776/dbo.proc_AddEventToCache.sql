/****** Object:  StoredProcedure [dbo].[proc_AddEventToCache]    Script Date: 5/15/2018 12:11:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddEventToCache(
    @SiteId             uniqueidentifier,
    @WebId              uniqueidentifier,
    @ListId             uniqueidentifier,
    @ItemId             int,
    @ItemName           nvarchar(255),
    @ItemFullUrl        nvarchar(260),
    @DocId              uniqueidentifier,
    @EventType          int,
    @ModifiedBy         nvarchar(255),
    @TimeLastModified   datetime,
    @EventData          image,
    @ACL                image,
    @ScopeId            uniqueidentifier = NULL)
AS
    SET NOCOUNT ON
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    DECLARE @InsertedRow bit
    SELECT  @InsertedRow = 0
    IF (@ItemId = -1)
    BEGIN
        EXEC proc_SplitUrl
                @ItemFullUrl,
                @DirName OUTPUT,
                @LeafName OUTPUT
        SELECT 
            @ItemId = DoclibRowId,
            @DocId = Id
        FROM
            Docs WITH(NOLOCK)            
        WHERE
            SiteId = @SiteId AND
            ListId = @ListId AND
            DirName = @DirName AND
            LeafName = @LeafName
    END  
    ELSE IF (@DocId IS NULL)
    BEGIN
        SELECT TOP 1
            @DocId = Docs.Id
        FROM
            UserData WITH (NOLOCK)
        INNER JOIN
            Docs WITH(NOLOCK)
        ON
            UserData.tp_SiteId = Docs.SiteId AND
            UserData.tp_DirName = Docs.DirName AND
            UserData.tp_LeafName = Docs.LeafName AND
            UserData.tp_Level = Docs.Level
        WHERE
            UserData.tp_ListId = @ListId AND
            UserData.tp_Id = @ItemId
    END
    IF @ItemFullUrl IS NULL
    BEGIN
        SELECT
            @ItemFullUrl = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
        FROM
            Docs WITH(NOLOCK)
        INNER JOIN
            WebParts WITH(NOLOCK)
        ON
            WebParts.tp_PageUrlID   = Docs.Id
        WHERE
            WebParts.tp_ListId      = @ListId   AND
            WebParts.tp_UserID      IS NULL     AND
            WebParts.tp_Type        = 4         AND     
            (WebParts.tp_Flags & 1048576)
                <> 0
    END
    If @EventType = 131081 
    BEGIN
        EXEC proc_SplitUrl @ItemFullUrl, @DirName output, @LeafName output
        IF NOT EXISTS (
            SELECT
                *
            FROM
                Docs WITH (NOLOCK)
            WHERE
                SiteId = @SiteId AND
                WebId = @WebId AND
                DirName = @DirName AND
                LeafName = @LeafName AND
                Level = 1)
            SET @EventType = 131072
    END
    IF (@ACL IS NULL)
    BEGIN
        IF @ScopeId IS NULL
        BEGIN
            EXEC proc_SplitUrl @ItemFullUrl, @DirName output, @LeafName output
            SELECT
                @ScopeId = ScopeId
            FROM
                Docs
            WHERE
                Docs.SiteId = @SiteId AND
                Docs.DirName = @DirName AND
                Docs.LeafName = @LeafName AND
                Docs.Level = 1
        END
        WHILE @ScopeId IS NULL AND @DirName<>N''
        BEGIN
            EXEC proc_SplitUrl @DirName, @DirName output, @LeafName output
            SELECT
                @ScopeId = ScopeId
            FROM
                Docs
            WHERE
                Docs.SiteId = @SiteId AND
                Docs.DirName = @DirName AND
                Docs.LeafName = @LeafName
        END
        INSERT INTO EventCache (
            EventTime,
            SiteId,
            WebId,
            ListId,
            ItemId,
            DocId,
            ItemName,
            ItemFullUrl,
            EventType,
            ObjectType,
            ModifiedBy,
            TimeLastModified,
            EventData,
            ACL)
        SELECT 
            GETUTCDATE(),
            @SiteId,
            @WebId,
            @ListId,
            @ItemId,
            @DocId,
            @ItemName,
            @ItemFullUrl,
            @EventType,
            1,
            @ModifiedBy,
            @TimeLastModified,
            @EventData,
            ACL
        FROM            
            Perms
        WHERE
            SiteId = @SiteId AND
            ScopeId = @ScopeId
        IF @@ROWCOUNT <> 0
            SELECT @InsertedRow = 1
    END
    IF (@InsertedRow = 0)
    BEGIN
        INSERT INTO EventCache (
            EventTime,
            SiteId,
            WebId,
            ListId,
            ItemId,
            DocId,
            ItemName,
            ItemFullUrl,
            EventType,
            ObjectType,
            ModifiedBy,
            TimeLastModified,
            EventData,
            ACL)
        VALUES (
            GETUTCDATE(),
            @SiteId,
            @WebId,
            @ListId,
            @ItemId,
            @DocId,
            @ItemName,
            @ItemFullUrl,
            @EventType,
            1,
            @ModifiedBy,
            @TimeLastModified,
            @EventData,
            @ACL)
    END

GO
