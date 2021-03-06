/****** Object:  StoredProcedure [dbo].[proc_RecordWebLinks]    Script Date: 5/15/2018 12:12:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RecordWebLinks(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @MasterUrl nvarchar(260),
    @CustomMasterUrl nvarchar(260))
AS
    SET NOCOUNT ON
    DECLARE @MasterPageDir nvarchar (256)
    DECLARE @MasterPageLeaf nvarchar (256)
    DECLARE @LinkNumber int
    DELETE
    FROM
        Links
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        Level = 1
    SELECT @LinkNumber = 0
    IF @MasterUrl IS NOT NULL
    BEGIN
        EXEC proc_SplitUrl @MasterUrl, @MasterPageDir OUTPUT,
            @MasterPageLeaf OUTPUT
        EXEC proc_AL @SiteId, @DirName, @LeafName, 1,
            @LinkNumber, @MasterPageDir, @MasterPageLeaf,
            86, 
            85, 
            83, 
            1,  
            N'' 
        SELECT @LinkNumber = @LinkNumber + 1
    END
    IF @CustomMasterUrl IS NOT NULL AND @CustomMasterUrl <> @MasterUrl
    BEGIN
        EXEC proc_SplitUrl @CustomMasterUrl, @MasterPageDir OUTPUT,
            @MasterPageLeaf OUTPUT
        EXEC proc_AL @SiteId, @DirName, @LeafName, 1,
            @LinkNumber, @MasterPageDir, @MasterPageLeaf,
            86, 
            85, 
            83, 
            1,  
            N'' 
    END
    RETURN 0

GO
