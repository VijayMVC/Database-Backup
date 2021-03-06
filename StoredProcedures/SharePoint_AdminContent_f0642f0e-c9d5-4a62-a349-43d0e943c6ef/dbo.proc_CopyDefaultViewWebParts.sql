/****** Object:  StoredProcedure [dbo].[proc_CopyDefaultViewWebParts]    Script Date: 5/15/2018 12:12:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CopyDefaultViewWebParts(
    @SiteID              uniqueidentifier,
    @DefaultViewDirName  nvarchar(256),
    @DefaultViewLeafName nvarchar(128),
    @NewViewDocId        uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @DefaultViewDocId uniqueidentifier
    DECLARE @NewViewDirName  nvarchar(256)
    DECLARE @NewViewLeafName nvarchar(128)
    DECLARE @iRet int
    SELECT TOP 1
        @DefaultViewDocId = Id
    FROM
        Docs
    WHERE
        SiteID = @SiteID AND
        DirName = @DefaultViewDirName AND
        LeafName = @DefaultViewLeafName
    IF @DefaultViewDocId IS NULL
        RETURN 2
    SELECT
        @NewViewDirName = DirName,
        @NewViewLeafName = LeafName
    FROM
        Docs
    WHERE
        Id = @NewViewDocId
    IF @@ROWCOUNT <> 1
        RETURN 2
    EXEC @iRet = proc_CopyWebParts
        @SiteID,
        @DefaultViewDocId,
        @DefaultViewDirName,
        @DefaultViewLeafName,
        @NewViewDocId,
        @NewViewDirName,
        @NewViewLeafName,
        1,                   
        1,
        1
    IF (@@ERROR <> 0 OR @iRet <> 0)
    BEGIN
        IF (@iRet = 0)
            SET @iRet = -2147467259
    END
    RETURN @iRet

GO
