/****** Object:  StoredProcedure [dbo].[proc_DeplAddIncrementalSearchScope]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddIncrementalSearchScope(
    @SiteId uniqueidentifier,
    @Id uniqueidentifier,
    @Url nvarchar(260),
    @Type tinyint,
    @IncludeDescendants tinyint,
    @IsMajorFileOnly int,
    @ChangeTimeStart datetime,
    @ChangeNumberStart int)
AS
    SET NOCOUNT ON
    DECLARE @RetVal int
    IF @Id IS NULL AND @Url IS NULL
        RETURN 87
    SET @RetVal = 0
    IF @Type = 1
        EXEC @RetVal = proc_DeplAddWebToIncremental @SiteId, @Id, @Url, @IncludeDescendants, @ChangeTimeStart, @ChangeNumberStart
    ELSE
        RETURN 87
    RETURN @RetVal

GO
