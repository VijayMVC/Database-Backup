/****** Object:  StoredProcedure [dbo].[proc_ResyncWelcomeLinks]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ResyncWelcomeLinks(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @FormerLeafName nvarchar(128))
AS
    SET NOCOUNT ON
    DECLARE @CurrentLeafNameIsWelcomePage bit
    DECLARE @FormerLeafNameWasWelcomePage bit
    SET @CurrentLeafNameIsWelcomePage = 0
    SET @FormerLeafNameWasWelcomePage = 0
    IF @FormerLeafName IS NOT NULL AND EXISTS (
        SELECT
            *
        FROM
            WelcomeNames
        WHERE
            LeafName = @FormerLeafName)
    BEGIN
        SET @FormerLeafNameWasWelcomePage = 1
    END
    IF @LeafName IS NOT NULL
    BEGIN
        IF EXISTS (SELECT *
            FROM
                WelcomeNames
            WHERE
                LeafName = @LeafName)
        BEGIN
            SET @CurrentLeafNameIsWelcomePage = 1
        END
    END
    IF @FormerLeafNameWasWelcomePage = 0 AND @CurrentLeafNameIsWelcomePage = 0
        AND @LeafName IS NOT NULL
    BEGIN
        RETURN
    END
    DECLARE @NewWelcome nvarchar(128)
    DECLARE @DirDirName nvarchar(256)
    DECLARE @DirLeafName nvarchar(128)
    EXEC proc_SplitUrl @DirName, @DirDirName OUTPUT, @DirLeafName OUTPUT
    SELECT
        @NewWelcome = WelcomeName
    FROM
        fn_GetWelcomeName(@SiteId, @DirName)
    IF @LeafName IS NOT NULL
    BEGIN
        EXEC proc_UpdateHomeNavNode @SiteId, @DirName, @LeafName, @NewWelcome
    END
    IF @NewWelcome IS NULL
    BEGIN
        UPDATE
            Links
        SET
            TargetDirName = @DirDirName,
            TargetLeafName = @DirLeafName,
            PointsToDir = 0
        WHERE
            SiteId = @SiteId AND
            TargetDirName = @DirName AND
            PointsToDir = 1
    END
    ELSE
    BEGIN
        UPDATE 
            Links
        SET
            TargetDirName = @DirName,
            TargetLeafName = @NewWelcome,
            PointsToDir = 1
        WHERE
            SiteId = @SiteId AND
            TargetDirName = @DirDirName AND
            TargetLeafName = @DirLeafName
        UPDATE 
            Links
        SET
            TargetDirName = @DirName,
            TargetLeafName = @NewWelcome,
            PointsToDir = 1
        WHERE
            SiteId = @SiteId AND
            TargetDirName = @DirName AND
            PointsToDir = 1
    END
    IF @NewWelcome IS NOT NULL
    BEGIN
        UPDATE
            Docs
        SET
            MetaInfoTimeLastModified =
                dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
        WHERE
            SiteId = @SiteId AND
            DirName = @DirName AND
            LeafName IN (SELECT LeafName FROM WelcomeNames)
    END

GO
