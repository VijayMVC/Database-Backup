/****** Object:  StoredProcedure [dbo].[proc_PatchLinkForWeb]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_PatchLinkForWeb
(
    @SiteId             uniqueidentifier,
    @WebId              uniqueidentifier,
    @OldLinkDirName     nvarchar(256),
    @OldLinkLeafName    nvarchar(128),
    @NewLinkDirName     nvarchar(256),
    @NewLinkLeafName    nvarchar(128),
    @PatchFlags         int = 0
)
AS
    SET NOCOUNT ON
    DECLARE @DirName nvarchar(256)
    DECLARE @OldLink nvarchar(260)
    DECLARE @NewLink nvarchar(260)
    DECLARE @OldLinkLike nvarchar(1024)
    DECLARE @DirNameLike nvarchar(1024)
    SELECT
        @DirName = FullUrl
    FROM
        Webs
    WHERE
        Id = @WebId AND
        SiteId = @SiteId
    SET @OldLink = CASE WHEN (DATALENGTH(@OldLinkDirName) = 0) THEN @OldLinkLeafName WHEN (DATALENGTH(@OldLinkLeafName) = 0) THEN @OldLinkDirName ELSE @OldLinkDirName + N'/' + @OldLinkLeafName END
    SET @NewLink = CASE WHEN (DATALENGTH(@NewLinkDirName) = 0) THEN @NewLinkLeafName WHEN (DATALENGTH(@NewLinkLeafName) = 0) THEN @NewLinkDirName ELSE @NewLinkDirName + N'/' + @NewLinkLeafName END
    EXEC proc_EscapeForLike @OldLink, @OldLinkLike OUTPUT
    IF ((DATALENGTH(@DirName) = 0))
    BEGIN
        SET @DirNameLike = N'%'
    END
    ELSE
    BEGIN
        EXEC proc_EscapeForLike @DirName, @DirNameLike OUTPUT
    END
    DECLARE @Now datetime
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE());
    UPDATE
        Docs
    SET
        NextToLastTimeModified = CASE
            WHEN
                (@PatchFlags & 2 = 
                    2)
            THEN
                NextToLastTimeModified
            ELSE
                TimeLastModified
            END,
        TimeLastModified = CASE
            WHEN
                (@PatchFlags & 2 = 
                    2)
            THEN
                TimeLastModified
            ELSE
                @Now
            END,
        MetaInfoTimeLastModified = @Now,
        Dirty = 1,
        CacheParseId = NULL
    WHERE
        SiteId    = @SiteId AND
        (DirName = @DirName OR
        DirName LIKE @DirNameLike) AND
        WebId     = @WebId
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 3
    END
    UPDATE
        Links
    SET
        TargetDirName = LEFT(@NewLinkDirName, 256),
        TargetLeafName = @NewLinkLeafName
    WHERE
        SiteId = @SiteId AND
        (DirName = @DirName OR
        DirName LIKE @DirNameLike) AND
        TargetDirName = @OldLinkDirName AND
        TargetLeafName = @OldLinkLeafName
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    IF (@PatchFlags & 1 = 
        1)
    BEGIN
        UPDATE
            Links
        SET
            TargetDirName = LEFT(COALESCE(
                STUFF(TargetDirName, 1,
                    LEN(@OldLink), @NewLink),
                @NewLinkDirName
                ), 256)
        WHERE
            SiteId = @SiteId AND
            (DirName = @DirName OR
            DirName LIKE @DirNameLike) AND
            TargetDirName = @OldLink
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
        UPDATE
            Links
        SET
            TargetDirName = LEFT(COALESCE(
                STUFF(TargetDirName, 1,
                    LEN(@OldLink), @NewLink), 
                @NewLinkDirName
                ), 256)
        WHERE
            SiteId = @SiteId AND
            (DirName = @DirName OR
            DirName LIKE @DirNameLike) AND
            TargetDirName LIKE @OldLinkLike
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
    END
    RETURN 0

GO
