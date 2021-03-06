/****** Object:  StoredProcedure [dbo].[proc_ManageVersions]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ManageVersions(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @ListId uniqueidentifier,
    @ItemId int,
    @MajorVersionsLimit int,
    @MajorMinorVersionsLimit int)
AS
    DECLARE @DocId uniqueIdentifier
    DECLARE @MinUIVersionToKeep int
    DECLARE @bHadCurrentMajorVersion bit
    DECLARE @RowCountRead int
    DECLARE @MajorCountInc int
    SELECT 
        @DocId = Id
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName       
    IF (@MajorVersionsLimit > 0)
    BEGIN
        SET @MajorCountInc = @MajorVersionsLimit+1
        SET ROWCOUNT @MajorCountInc
        SELECT 
            @MinUIVersionToKeep = Version 
        FROM 
            DocVersions
        WHERE 
            Id = @DocId AND
            Level= 1
        ORDER BY 
            Version DESC
        SET @RowCountRead = @@RowCount
        SET ROWCOUNT 0
        IF @RowCountRead = @MajorCountInc
        BEGIN            
            DELETE 
                DocVersions
            FROM DocVersions
            WHERE
                Id = @DocId AND
                Version <= @MinUIVersionToKeep
        END
        IF (@ListId IS NOT NULL AND @ItemId IS NOT NULL)
        BEGIN
            SET ROWCOUNT @MajorCountInc
            SELECT 
                @MinUIVersionToKeep = tp_UIVersion 
            FROM 
                UserDataVersioned
            WHERE 
                tp_ListId = @ListId AND
                tp_ID = @ItemId AND
                tp_Level= 1 AND
                tp_RowOrdinal = 0 AND
                tp_IsCurrentVersion = 0
            ORDER BY 
                tp_UIVersion DESC
            SET @RowCountRead = @@RowCount
            SET ROWCOUNT 0
            IF @RowCountRead = @MajorCountInc
            BEGIN
                DELETE 
                    UserDataVersioned
                FROM UserDataVersioned
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ItemId AND
                    tp_IsCurrentVersion = 0 AND
                    tp_UIVersion <= @MinUIVersionToKeep
                DELETE
                    UserDataJunctionsVersioned
                WHERE
                    tp_SiteId = @SiteId AND
                    tp_DirName = @DirName AND
                    tp_LeafName = @LeafName AND
                    tp_IsCurrentVersion = 0 AND
                    tp_UIVersion <= @MinUIVersionToKeep
            END
        END
    END
    IF (@MajorMinorVersionsLimit > 0)
    BEGIN
        DECLARE @NeedClean bit
        DECLARE @VersionLimitInDocVersions int
        SET @NeedClean = 1
        SELECT 
            @MinUIVersionToKeep = UIVersion 
        FROM 
            Docs
        WHERE 
            Id = @DocId AND
            Level= 1
        IF @@RowCount = 1   
            SET @VersionLimitInDocVersions = @MajorMinorVersionsLimit - 1
        ELSE
            SET @VersionLimitInDocVersions = @MajorMinorVersionsLimit;
        IF @VersionLimitInDocVersions > 0
        BEGIN
            SET ROWCOUNT @VersionLimitInDocVersions
            SELECT 
                @MinUIVersionToKeep = Version 
            FROM 
                DocVersions
            WHERE 
                Id = @DocId AND
                Level= 1
            ORDER BY 
                Version DESC
            IF @@RowCount < @VersionLimitInDocVersions
                SET @NeedClean = 0
        END
        SET ROWCOUNT 0
        IF @NeedClean = 1 AND @MinUIVersionToKeep IS NOT NULL
        BEGIN            
            DELETE 
                DocVersions
            FROM 
                DocVersions
            WHERE
                Id = @DocId AND
                Version < @MinUIVersionToKeep AND
                Level = 2
        END
        IF (@ListId IS NOT NULL AND @ItemId IS NOT NULL)
        BEGIN
            SET ROWCOUNT @MajorMinorVersionsLimit
            SELECT 
                @MinUIVersionToKeep = tp_UIVersion 
            FROM 
                UserDataVersioned
            WHERE 
                tp_ListId = @ListId AND
                tp_ID = @ItemId AND
                tp_Level= 1 AND
                tp_RowOrdinal = 0
            ORDER BY 
                tp_UIVersion DESC
            SET @RowCountRead = @@RowCount
            SET ROWCOUNT 0
            IF @RowCountRead = @MajorMinorVersionsLimit
            BEGIN
                DELETE 
                    UserDataVersioned
                FROM 
                    UserDataVersioned
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ItemId AND
                    tp_Level= 2 AND
                    tp_IsCurrentVersion = 0 AND
                    tp_UIVersion < @MinUIVersionToKeep
                DELETE
                    UserDataJunctionsVersioned
                WHERE
                    tp_SiteId = @SiteId AND
                    tp_DirName = @DirName AND
                    tp_LeafName = @LeafName AND
                    tp_Level= 2 AND
                    tp_IsCurrentVersion = 0 AND
                    tp_UIVersion < @MinUIVersionToKeep
            END
        END
    END
    SET ROWCOUNT 0
    EXEC proc_UpdateDiskUsed @SiteId

GO
