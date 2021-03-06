/****** Object:  StoredProcedure [dbo].[proc_DeplGetIncrementalChanges]    Script Date: 5/15/2018 12:11:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetIncrementalChanges(
    @SiteId uniqueidentifier,
    @SearchEntireSite tinyint,
    @ChangeTimeStart datetime,
    @ChangeNumberStart int,
    @ChangeTimeEnd datetime,
    @ChangeNumberEnd int,
    @IncludeUsers tinyint,
    @IncludeGroups tinyint,
    @IsMajorFileOnly tinyint,
    @MinChangeTime datetime out,
    @MinChangeNumber int out)
AS
    SET NOCOUNT ON
    DECLARE @ReturnValue int
    SET @ReturnValue = 0
    IF @SearchEntireSite = 1
        EXEC @ReturnValue = proc_DeplGetIncrementalChangesForSite @SiteId,
                                                          @ChangeTimeStart,
                                                          @ChangeNumberStart,
                                                          @ChangeTimeEnd,
                                                          @ChangeNumberEnd,
                                                          @IncludeUsers,
                                                          @IncludeGroups,
                                                          @IsMajorFileOnly,
                                                          @MinChangeTime out,
                                                          @MinChangeNumber out
    ELSE
        EXEC @ReturnValue = proc_DeplGetIncrementalChangesForScope @SiteId,
                                                          @ChangeTimeEnd,
                                                          @ChangeNumberEnd,
                                                          @IncludeUsers,
                                                          @IncludeGroups,
                                                          @IsMajorFileOnly,
                                                          @MinChangeTime out,
                                                          @MinChangeNumber out
    RETURN @ReturnValue

GO
