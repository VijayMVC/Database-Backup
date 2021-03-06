/****** Object:  StoredProcedure [dbo].[proc_UpdateFailOver]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateFailOver (
        @Id                    uniqueidentifier,
        @SiteId                uniqueidentifier,
        @FailOverInMin         int
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
    DECLARE @NULL_GUID uniqueidentifier
    SET @NULL_GUID = CONVERT(uniqueidentifier, '00000000-0000-0000-0000-000000000000')
    IF @SiteId IS NULL
        SET @SiteId = @NULL_GUID 
    EXEC @iRet = proc_UpdateWorkItem @Id, @SiteId, @FailOver , NULL , NULL , NULL 
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
