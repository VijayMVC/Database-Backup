/****** Object:  StoredProcedure [dbo].[proc_GetSizeOfWebPartsOnPage]    Script Date: 5/15/2018 12:12:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetSizeOfWebPartsOnPage(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @UserID int)
AS
    SET NOCOUNT ON
    DECLARE @DocId uniqueidentifier
    DECLARE @DocWebId uniqueidentifier
    DECLARE @Level tinyint
    EXEC proc_GetLevel  @SiteId,
        @DirName,
        @LeafName,
        @UserID,
        2,
        @Level OUTPUT
    SELECT
        @DocId = Id,
        @DocWebId = WebId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        Level = @Level
    IF ((@DocId IS NULL) OR (@DocWebId <> @WebId))
    BEGIN
        RETURN 2    
    END
    SELECT dbo.fn_SizeOfSmartPage(@SiteId, @DocId, @Level);

GO
