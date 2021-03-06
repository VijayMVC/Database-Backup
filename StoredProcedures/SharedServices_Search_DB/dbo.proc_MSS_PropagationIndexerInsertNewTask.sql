/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationIndexerInsertNewTask]    Script Date: 5/15/2018 12:11:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationIndexerInsertNewTask(
    @CatalogID int, @TaskType int, @ObjectID int, @MaxWorkID int, @BirthDate int )
AS
BEGIN

SET NOCOUNT ON

    IF EXISTS ( SELECT TaskType FROM dbo.MSSPropagationPropagationTask 
                WHERE CatalogID = @CatalogID AND
                      TaskType = @TaskType   AND 
                      ObjectID = @ObjectID )
        RETURN 1

    INSERT dbo.MSSPropagationPropagationTask VALUES ( @CatalogID, @TaskType, @ObjectID, @MaxWorkID, @BirthDate, GETUTCDATE() )

    RETURN 0

END


GO
