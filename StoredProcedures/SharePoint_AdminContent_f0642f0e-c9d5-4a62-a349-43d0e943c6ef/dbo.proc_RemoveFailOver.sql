/****** Object:  StoredProcedure [dbo].[proc_RemoveFailOver]    Script Date: 5/15/2018 12:12:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RemoveFailOver (
        @Id                    uniqueidentifier,
        @SiteId                uniqueidentifier
        )
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    BEGIN TRAN
    DECLARE @NULL_GUID uniqueidentifier
    SET @NULL_GUID = CONVERT(uniqueidentifier, '00000000-0000-0000-0000-000000000000')
    IF @SiteId IS NULL
        SET @SiteId = @NULL_GUID 
    EXEC proc_DropWorkItem @SiteId, @Id    
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
