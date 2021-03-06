/****** Object:  StoredProcedure [dbo].[proc_GetUniqueFileName]    Script Date: 5/15/2018 12:12:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetUniqueFileName(
    @DocSiteId   uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128) OUTPUT)
AS
    SET NOCOUNT ON
    IF EXISTS (
            SELECT
                *
            FROM
                Docs
            WHERE
                SiteId = @DocSiteId AND
                DirName = @DocDirName AND
                LeafName = @DocLeafName
                )
    BEGIN
        DECLARE @ExtLen int
        DECLARE @LeafLen int
        SET @ExtLen = 1
        SET @LeafLen = DATALENGTH(@DocLeafName)/2
        WHILE
            SUBSTRING(@DocLeafName, @LeafLen - @ExtLen, 1) <> N'.'
        BEGIN
            SET @ExtLen = @ExtLen + 1
            IF @ExtLen >= @LeafLen 
            BEGIN
                BREAK
            END
        END
        DECLARE @Count int
        DECLARE @NewDocLeafName nvarchar(128)
        DECLARE @NumTries int
        SET @NumTries = 0
        SET @Count = 0
        SET @NewDocLeafName = @DocLeafName
        WHILE EXISTS (
            SELECT
                *
            FROM
                Docs
            WHERE
                SiteId = @DocSiteId AND
                DirName = @DocDirName AND
                LeafName = @NewDocLeafName
            )
        BEGIN
            DECLARE @TruncLen int
            DECLARE @StartIndex int
            DECLARE @FullUrlTemp nvarchar(
                280)
            SET @TruncLen = 0
            SET @Count = @Count + 1
            SET @NumTries = @NumTries + 1
            SET @StartIndex = 0
            IF @NumTries > 300
                RETURN 3
            IF @Count > 256
                BEGIN  
                    SET @Count = CONVERT(int, RAND()*1000000000+257)
                END
            SET @FullUrlTemp = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END;
            IF DATALENGTH(@FullUrlTemp)/2 > 260 -10
                BEGIN
                    IF DATALENGTH(@DocLeafName)/2 <= 10 OR
                    DATALENGTH(@FullUrlTemp)/2 > 260
                        RETURN 3
                    SET @TruncLen = 10
                END
            ELSE IF DATALENGTH(@DocLeafName)/2 > 128 - 10
                BEGIN
                    SET @TruncLen = 10
                END
            SET @StartIndex = @LeafLen - (@ExtLen + @TruncLen)
            IF @StartIndex = 0 SET @StartIndex = 1
            SET @NewDocLeafName = STUFF(@DocLeafName, @StartIndex,
                @TruncLen, CAST(@Count AS nvarchar(10)))
        END
        IF @Count > 0
        BEGIN
            SET @DocLeafName = @NewDocLeafName
        END
    END

GO
