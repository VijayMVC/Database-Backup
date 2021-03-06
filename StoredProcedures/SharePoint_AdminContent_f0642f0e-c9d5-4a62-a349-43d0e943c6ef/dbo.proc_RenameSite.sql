/****** Object:  StoredProcedure [dbo].[proc_RenameSite]    Script Date: 5/15/2018 12:12:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RenameSite(
    @SiteId uniqueidentifier,
    @OldUrl nvarchar(260),
    @NewUrl nvarchar(260),
    @SiteFullUrl nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @OldUrlDirName nvarchar(256)
    DECLARE @NewUrlDirName nvarchar(256)
    DECLARE @OldUrlLeafName nvarchar(128)
    DECLARE @NewUrlLeafName nvarchar(128)
    DECLARE @RowCount int, @ErrorCode int
    DECLARE @OldUrlLike nvarchar(1024)
    EXEC proc_SplitUrl
        @OldUrl,
        @OldUrlDirName OUTPUT,
        @OldUrlLeafName OUTPUT
    EXEC proc_SplitUrl
        @NewUrl,
        @NewUrlDirName OUTPUT,
        @NewUrlLeafName OUTPUT
    DECLARE @SlashOffset int
    SET @SlashOffset = CASE
        WHEN
            LEN(@NewUrl) <> 0 OR LEN(@OldUrl) = 0
        THEN
            0
        ELSE
            1
        END
    IF LEN(@OldUrl) <> 0
    BEGIN
        EXEC proc_EscapeForLike @OldUrl, @OldUrlLike OUTPUT
    END
    ELSE
    BEGIN
        SET @OldUrlLike = '%'
    END
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        32768,  8, NULL
    DECLARE @RootWebId uniqueidentifier
    DECLARE @RootWebTitle nvarchar(255)
    DECLARE @UrlStart int
    SELECT
        @RootWebId = Webs.[Id],
        @RootWebTitle = Webs.Title
    FROM
        Webs
    WHERE
        SiteId=@SiteId AND
        ParentWebId IS NULL
    SET @UrlStart = 1 + DATALENGTH(CONVERT(varbinary(16), @RootWebId))
                      + DATALENGTH(CONVERT(varbinary(4), N';#'))
                      + DATALENGTH(N'U')
                      + DATALENGTH(CONVERT(varbinary(4), N';#'))
                      + DATALENGTH(REPLACE(@RootWebTitle, N';', N';;'))
                      + DATALENGTH(CONVERT(varbinary(4), N';#'))
    UPDATE
        Webs
    SET
        FullUrl = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(FullUrl, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(FullUrl, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl),
        Ancestry = STUFF(SUBSTRING(Webs.Ancestry, 1, DATALENGTH(Webs.Ancestry)), @UrlStart,
                         DATALENGTH(@OldUrl),
                         CONVERT(varbinary(520), @NewUrl)),
        MasterUrl = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(MasterUrl, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(MasterUrl, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            MasterUrl),
        CustomMasterUrl = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(CustomMasterUrl, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(CustomMasterUrl, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            CustomMasterUrl),
        CachedNavDirty = 1
    WHERE  
        SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 1) BEGIN RETURN 1003 END END
    UPDATE
        ContentTypes
    SET
        Scope = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(Scope, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(Scope, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl)
    WHERE  
        SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 1) BEGIN RETURN 1003 END END
    UPDATE
        Perms
    SET
        ScopeUrl = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(ScopeUrl, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(ScopeUrl, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl)
    WHERE  
        SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 1) BEGIN RETURN 1003 END END
    UPDATE
        Docs
    SET
        DirName = COALESCE(
            CASE
            WHEN
                (DirName=@OldUrlDirName AND
                LeafName=@OldUrlLeafName)
            THEN 
                @NewUrlDirName
            ELSE
                CASE
                WHEN
                    LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
                THEN 
                    STUFF(DirName, 1,
                    LEN(@OldUrl), @NewUrl+N'/')
                ELSE 
                    STUFF(DirName, 1,
                    LEN(@OldUrl) + @SlashOffset, @NewUrl)
                END
            END,
            @NewUrl),
        LeafName = COALESCE(
            CASE
            WHEN
                (DirName=@OldUrlDirName AND
                LeafName=@OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                LeafName
            END,
            LeafName
            ),
        Dirty =            CASE
            WHEN
                DocFlags IS NOT NULL AND
                DocFlags & 4 = 4
            THEN
                1
            ELSE
                Dirty
            END
    WHERE  
        SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 1) BEGIN RETURN 1003 END END
    SELECT
        @RowCount = COUNT(*)
    FROM Docs
    WHERE
        SiteId=@SiteId AND
        LEN(CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END) > 260
    IF(@RowCount > 0)
    BEGIN
        RETURN 206
    END
    EXEC proc_DirtyDependents @SiteId, 1, NULL, @OldUrlLike
    UPDATE
        UserData
    SET
        tp_DirName = COALESCE(
            CASE
            WHEN
                (tp_DirName=@OldUrlDirName AND
                tp_LeafName=@OldUrlLeafName)
            THEN 
                @NewUrlDirName
            ELSE
                CASE
                WHEN
                    LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
                THEN 
                    STUFF(tp_DirName, 1,
                    LEN(@OldUrl), @NewUrl+N'/')
                ELSE 
                    STUFF(tp_DirName, 1,
                    LEN(@OldUrl) + @SlashOffset, @NewUrl)
                END
            END,
            @NewUrl),
        tp_LeafName = COALESCE(
            CASE
            WHEN
                (tp_DirName=@OldUrlDirName AND
                tp_LeafName=@OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                tp_LeafName
            END,
            tp_LeafName
            )
    WHERE  
        tp_SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 1) BEGIN RETURN 1003 END END
    UPDATE
        UserDataVersioned
    SET
        tp_DirName = COALESCE(
            CASE
            WHEN
                (tp_DirName=@OldUrlDirName AND
                tp_LeafName=@OldUrlLeafName)
            THEN 
                @NewUrlDirName
            ELSE
                CASE
                WHEN
                    LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
                THEN 
                    STUFF(tp_DirName, 1,
                    LEN(@OldUrl), @NewUrl+N'/')
                ELSE 
                    STUFF(tp_DirName, 1,
                    LEN(@OldUrl) + @SlashOffset, @NewUrl)
                END
            END,
            @NewUrl),
        tp_LeafName = COALESCE(
            CASE
            WHEN
                (tp_DirName=@OldUrlDirName AND
                tp_LeafName=@OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                tp_LeafName
            END,
            tp_LeafName
            )
    WHERE  
        tp_SiteId=@SiteId AND
        tp_IsCurrentVersion = CONVERT(bit,0);
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        Links
    SET
        DirName = COALESCE(
            CASE
            WHEN
                (DirName=@OldUrlDirName AND
                LeafName=@OldUrlLeafName)
            THEN 
                @NewUrlDirName
            ELSE
                CASE
                WHEN
                    LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
                THEN 
                    STUFF(DirName, 1,
                    LEN(@OldUrl), @NewUrl+N'/')
                ELSE 
                    STUFF(DirName, 1,
                    LEN(@OldUrl) + @SlashOffset, @NewUrl)
                END
            END,
            @NewUrl),
        LeafName = COALESCE(
            CASE
            WHEN
                (DirName=@OldUrlDirName AND
                LeafName=@OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                LeafName
            END,
            LeafName
            )
    WHERE  
        SiteId=@SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    EXEC @ErrorCode  =
        proc_DirtyListData @SiteId, @OldUrlDirName, @OldUrlLeafName, 1
    IF @ErrorCode  <> 0
    BEGIN
        RETURN @ErrorCode 
    END
    UPDATE
        Links
    SET
        TargetDirName = COALESCE(
            CASE
            WHEN
                (TargetDirName=@OldUrlDirName AND
                TargetLeafName=@OldUrlLeafName)
            THEN 
                LEFT(@NewUrlDirName, 256)
            ELSE
                CASE
                WHEN
                    LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
                THEN 
                    LEFT(STUFF(TargetDirName, 1,
                    LEN(@OldUrl), @NewUrl+N'/'), 256)
                ELSE 
                    LEFT(STUFF(TargetDirName, 1,
                    LEN(@OldUrl) + @SlashOffset, @NewUrl), 256)
                END
            END,
            @NewUrl),
        TargetLeafName = COALESCE(
            CASE
            WHEN
                (TargetLeafName=@OldUrlDirName AND
                TargetLeafName=@OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                TargetLeafName
            END,
            TargetLeafName
            )
    WHERE  
        SiteId=@SiteId AND
        ServerRel = 1 AND
        ((TargetDirName = @OldUrlDirName AND
            TargetLeafName = @OldUrlLeafName) OR
                TargetDirName = @OldUrl OR
                    TargetDirName LIKE @OldUrlLike)
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        Deps
    SET
        FullUrl = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(FullUrl, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(FullUrl, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl)
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        (FullUrl = @OldUrl OR
            FullUrl LIKE @OldUrlLike)
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        Deps
    SET
        DepDesc = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(DepDesc, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(DepDesc, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl)
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        (DepDesc = @OldUrl OR
            DepDesc LIKE @OldUrlLike) AND
        (DepType = 1 OR DepType = 8)
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    DECLARE @NewSiteUrl nvarchar(260)
    DECLARE @OldWebUrl nvarchar(1024)
    DECLARE @NewWebUrl nvarchar(1024)
    DECLARE @OldWebUrlLike nvarchar(1024)
    IF (@OldUrl = N'')
    BEGIN
        SET @OldWebUrl = N''
        SET @OldWebUrlLike = @OldUrlLike
    END
    ELSE
    BEGIN
        SET @OldWebUrl = N'/' + @OldUrl
        SET @OldWebUrlLike = N'/' + @OldUrlLike
    END
    SET @NewWebUrl = CASE WHEN @NewUrl = N'' THEN N''
        ELSE N'/' + @NewUrl
        END
    UPDATE
        ImmedSubscriptions
    SET
        SiteUrl = @SiteFullUrl
    WHERE
        SiteId = @SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        SchedSubscriptions
    SET
        SiteUrl = @SiteFullUrl
    WHERE
        SiteId = @SiteId
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        ImmedSubscriptions
    SET
        WebUrl = COALESCE(
            STUFF(WebUrl, 1, LEN(@OldWebUrl), @NewWebUrl),
            @NewWebUrl)
    WHERE
        SiteId = @SiteId AND
        (WebUrl = @OldWebUrl OR
            WebUrl LIKE @OldWebUrlLike)
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        SchedSubscriptions
    SET
        WebUrl = COALESCE(
            STUFF(WebUrl, 1, LEN(@OldWebUrl), @NewWebUrl),
            @NewWebUrl)
    WHERE
        SiteId = @SiteId AND
        (WebUrl = @OldWebUrl OR
            WebUrl LIKE @OldWebUrlLike)
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END
    UPDATE
        AllUserDataJunctions
    SET
        tp_DirName = COALESCE(
            CASE
            WHEN
                LEN(@OldUrl) = 0 AND LEN(@NewUrl) <> 0
            THEN  
                STUFF(tp_DirName, 1,
                LEN(@OldUrl), @NewUrl+N'/')
            ELSE  
                STUFF(tp_DirName, 1,
                LEN(@OldUrl) + @SlashOffset, @NewUrl)
            END,  
            @NewUrl)
    WHERE  
        tp_SiteId=@SiteId        
    SELECT @RowCount=@@ROWCOUNT,@ErrorCode=@@ERROR IF(@ErrorCode = 8152) BEGIN RETURN 206 END ELSE BEGIN IF(@ErrorCode <> 0 OR @RowCount < 0) BEGIN RETURN 1003 END END

GO
