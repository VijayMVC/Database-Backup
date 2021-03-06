/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationIndexerCleanUpTablesForTask]    Script Date: 5/15/2018 12:13:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationIndexerCleanUpTablesForTask(
    @CatalogID int, @TaskType int, @ObjectID int )
AS
BEGIN
SET NOCOUNT ON
    DECLARE @RetVal int SET @RetVal = 0
    BEGIN TRANSACTION
        DELETE dbo.MSSPropagationSearchServerReady
        FROM dbo.MSSPropagationSearchServerReady 
        WHERE dbo.MSSPropagationSearchServerReady.TaskType = @TaskType AND
              dbo.MSSPropagationSearchServerReady.CatalogID = @CatalogID AND
              dbo.MSSPropagationSearchServerReady.ObjectID = @ObjectID
        SELECT @RetVal = @@ERROR
        IF 0 <> @RetVal  BEGIN
            ROLLBACK TRANSACTION
            return @RetVal
        END
        DELETE dbo.MSSPropagationPropagationTask
        FROM dbo.MSSPropagationPropagationTask
        WHERE dbo.MSSPropagationPropagationTask.TaskType = @TaskType AND
              dbo.MSSPropagationPropagationTask.CatalogID = @CatalogID AND
              dbo.MSSPropagationPropagationTask.ObjectID = @ObjectID
        SELECT @RetVal = @@ERROR
        IF 0 <> @RetVal  BEGIN
            ROLLBACK TRANSACTION
            return @RetVal
        END
    COMMIT TRANSACTION
END

GO
