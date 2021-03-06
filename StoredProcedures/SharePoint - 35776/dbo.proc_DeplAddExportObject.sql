/****** Object:  StoredProcedure [dbo].[proc_DeplAddExportObject]    Script Date: 5/15/2018 12:11:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddExportObject(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @Type tinyint,
    @IncludeDescendants tinyint,
    @IsMajorFileOnly int,
    @IsLink tinyint,
    @IsSelected tinyint)
AS
    SET NOCOUNT ON
    DECLARE @RetVal int
    IF @Id IS NULL AND @Url IS NULL
        RETURN 87
    SET @RetVal = 0
    IF @Type = 1
        EXEC @RetVal = proc_DeplAddWeb @SiteId, @Id, @Url, @IncludeDescendants, @IsSelected
    ELSE IF @Type = 3
        EXEC @RetVal = proc_DeplAddList @SiteId, @Id, @Url, @IncludeDescendants, @IsSelected
    ELSE IF @Type = 2 OR @Type = 6
        EXEC @RetVal = proc_DeplAddFolder @SiteId, @Id, @Url, @IncludeDescendants, @IsLink, @IsSelected
    ELSE IF @Type = 5 OR @Type = 7
        EXEC @RetVal = proc_DeplAddFile @SiteId, @Id, @Url, @IncludeDescendants, @IsMajorFileOnly, @IsLink, @IsSelected
    ELSE IF @Type = 4
        EXEC @RetVal = proc_DeplAddListItem @SiteId, @Id, @Url, @IncludeDescendants, @IsMajorFileOnly, @IsLink, @IsSelected
    ELSE
        RETURN 87
    RETURN @RetVal

GO
