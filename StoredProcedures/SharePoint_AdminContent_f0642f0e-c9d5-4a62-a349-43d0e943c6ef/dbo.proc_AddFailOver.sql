/****** Object:  StoredProcedure [dbo].[proc_AddFailOver]    Script Date: 5/15/2018 12:12:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddFailOver (
        @Id                    uniqueidentifier,
        @SiteId                uniqueidentifier,
        @ParentId              uniqueidentifier,
        @FailOverInMin         int,
        @FailOverType          int
        )
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    BEGIN TRAN
    DECLARE @Now    datetime
    DECLARE @FailOver datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    SET @FailOver = DATEADD(mi, @FailOverInMin, @Now)    
    DECLARE @FailWorkItemType uniqueidentifier
    SET @FailWorkItemType = CONVERT(uniqueidentifier, 'BDEADF17-C265-11d0-BCED-00A0C90AB50F')
    DECLARE @NULL_GUID uniqueidentifier
    SET @NULL_GUID = CONVERT(uniqueidentifier, '00000000-0000-0000-0000-000000000000')
    IF @SiteId IS NULL
        SET @SiteId = @NULL_GUID
    IF @ParentId IS NULL
        SET @ParentId = @Id 
    IF EXISTS (SELECT *
                   FROM
                       dbo.ScheduledWorkItems
                   WHERE
                       SiteId = @SiteId AND
                       Id = @Id AND 
                       Type = @FailWorkItemType)
    BEGIN
        EXEC @iRet = proc_UpdateFailOver @Id, @SiteId, @FailOverInMin
    END        
    ELSE
    BEGIN
        EXEC @iRet = proc_AddWorkItem @Id ,
                                      @FailOver ,
                                      @FailWorkItemType ,
                                      @NULL_GUID,
                                      @SiteId ,
                                      @ParentId ,
                                      @FailOverType ,
                                      NULL ,
                                      NULL ,
                                      NULL ,
                                      0 ,
                                      NULL ,
                                      NULL ,
                                      NULL 
    END                                  
    IF @iRet <> 0
        GOTO CLEANUP
CLEANUP:
    IF @iRet <> 0
    BEGIN
        IF @@TRANCOUNT = @oldTranCount + 1
        BEGIN
            ROLLBACK TRAN
        END
    END
    ELSE
    BEGIN
        COMMIT TRAN
    END
    RETURN @iRet

GO
