/****** Object:  StoredProcedure [dbo].[proc_ReplaceCtoOffset]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ReplaceCtoOffset(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @CtoOffset int,
    @NewCtoOffset int)
AS
    SET NOCOUNT ON
    IF @CtoOffset = @NewCtoOffset OR
        @CtoOffset IS NULL AND @NewCtoOffset IS NULL
    BEGIN
        RETURN 0
    END
    DECLARE @FullUrl nvarchar(260)
    DECLARE @UrlLike nvarchar(260)
    SET @FullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    EXEC proc_EscapeForLike @FullUrl, @UrlLike OUTPUT
    UPDATE
        Docs
    SET
        CtoOffset = @NewCtoOffset
    WHERE
        SiteId = @SiteId AND
        (DirName = @DirName AND LeafName = @LeafName OR 
        DirName = @FullUrl OR 
        DirName LIKE @UrlLike) AND
        Type = 1 AND
        (CtoOffset = @CtoOffset OR CtoOffset IS NULL AND @CtoOffset IS NULL)
    RETURN 0

GO
