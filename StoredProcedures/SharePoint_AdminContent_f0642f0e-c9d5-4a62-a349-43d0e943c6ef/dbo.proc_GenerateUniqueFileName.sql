/****** Object:  StoredProcedure [dbo].[proc_GenerateUniqueFileName]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GenerateUniqueFileName(
    @SiteId uniqueidentifier,
    @BaseUrl nvarchar(260),
    @Extension nvarchar(10),
    @MaxAttempts int)
AS
    SET NOCOUNT ON
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    DECLARE @BaseLeafName nvarchar(128)
    DECLARE @Count int
    SELECT @Count = 0
    EXEC proc_SplitUrl @BaseUrl, @DirName OUTPUT, @BaseLeafName OUTPUT
    SELECT @LeafName = @BaseLeafName + N'.' + @Extension
    WHILE EXISTS (
        SELECT * From Docs WHERE SiteId = @SiteId AND 
            DirName = @DirName AND 
            LeafName = @LeafName)
    BEGIN
        SELECT @Count = @Count + 1
        IF @Count > @MaxAttempts
            RETURN 3
        SELECT @LeafName = @BaseLeafName +
            CAST(@Count AS nvarchar(32)) + N'.' + @Extension
    END
    SELECT
        CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    RETURN 0

GO
