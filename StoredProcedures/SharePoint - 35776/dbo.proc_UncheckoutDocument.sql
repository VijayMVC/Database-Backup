/****** Object:  StoredProcedure [dbo].[proc_UncheckoutDocument]    Script Date: 5/15/2018 12:12:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UncheckoutDocument(
    @SiteId  uniqueidentifier,
    @WebId   uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @UserId int,
    @ShortTerm bit,
    @Force bit)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @Level tinyint
    DECLARE @CheckinLevel tinyint
    DECLARE @UserIdForLevel int
    IF @Force = 1
        SET @UserIdForLevel = -1
    ELSE
        SET @UserIdForLevel = @UserId
    EXEC proc_GetLevel  @SiteId, 
        @DirName, 
        @LeafName,
        @UserIdForLevel,
        2,
        @Level OUTPUT,
        @CheckinLevel OUTPUT
    IF @ShortTerm = 0 AND @CheckinLevel IS NULL
        RETURN 2401
    BEGIN TRANSACTION
    EXEC @Ret = proc_UncheckoutDocumentInternal @SiteId,
        @WebId,
        @DirName,
        @LeafName,
        @UserId,
        @ShortTerm,
        @Force,
        @CheckinLevel,
        @Level OUTPUT
    EXEC proc_UpdateDiskUsed @SiteId, 1
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    EXEC proc_GetLinkInfoSingleDoc @SiteId, @DirName, @LeafName, @Level
    EXEC proc_GetMetaInfoForSingleDoc @SiteId,
        @DirName,
        @LeafName,
        @UserId,
        @Level,
        0, 
        @WebId
    RETURN @Ret

GO
