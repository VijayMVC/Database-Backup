/****** Object:  StoredProcedure [dbo].[proc_UpdateChildCount]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateChildCount(
    @SiteId uniqueidentifier,
    @ChildDirName  nvarchar(256),
    @ChildLeafName  nvarchar(256),
    @ChildDocLibRowId int,
    @ChildLevel int,
    @ChildType int,
    @Change int)
AS
SET NOCOUNT ON
    DECLARE @ParentDirName nvarchar(256)
    DECLARE @ParentLeafName nvarchar(128)
    DECLARE @ShouldChangeCount bit
    DECLARE @Now datetime
    IF @ChildDocLibRowId IS NULL
        RETURN 0
    EXEC proc_SplitUrl @ChildDirName, 
                       @ParentDirName OUTPUT, 
                       @ParentLeafName OUTPUT
    SET @ShouldChangeCount = 1
    IF @ChildLevel <> 0
    BEGIN
        SELECT @ShouldChangeCount = 
            CASE WHEN EXISTS
                (SELECT * FROM Docs 
                    WHERE SiteId = @SiteId AND 
                          DirName = @ChildDirName AND 
                          LeafName = @ChildLeafName AND
                          Level <> @ChildLevel
                ) THEN
            0 ELSE 1 END        
    END
    IF @ShouldChangeCount = 0
        RETURN 0
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    IF @ChildType = 0
    BEGIN
        UPDATE 
            Docs
        SET
            TimeLastModified = @Now,
            ItemChildCount = 
                CASE WHEN ItemChildCount + @Change < 0 THEN 0 
                ELSE ItemChildCount + @Change END
        WHERE
            SiteId = @SiteId AND
            DirName = @ParentDirName AND
            LeafName = @ParentLeafName
    END
    ELSE IF @ChildType = 1
    BEGIN
        UPDATE 
            Docs
        SET
            TimeLastModified = @Now,
            FolderChildCount = 
                CASE WHEN FolderChildCount + @Change < 0 THEN 0 
                ELSE FolderChildCount + @Change END
        WHERE
            SiteId = @SiteId AND
            DirName = @ParentDirName AND
            LeafName = @ParentLeafName
    END
    RETURN 0

GO
