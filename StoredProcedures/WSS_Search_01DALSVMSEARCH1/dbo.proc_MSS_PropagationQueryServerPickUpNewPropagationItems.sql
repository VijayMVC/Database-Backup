/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationQueryServerPickUpNewPropagationItems]    Script Date: 5/15/2018 12:13:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationQueryServerPickUpNewPropagationItems(
    @CatalogID int, @ServerName nvarchar( 31 ) )
AS
BEGIN
SET NOCOUNT ON
    DECLARE
        @SearchServerID int
    SET
        @SearchServerID = -1
    SELECT
        @SearchServerID = SearchServerID
    FROM
        dbo.MSSPropagationSearchServerTable
    WHERE
        SearchServerName = @ServerName
    SELECT MSSPropagationPropagationTask.CatalogID, 
       MSSPropagationPropagationTask.TaskType, 
       MSSPropagationPropagationTask.ObjectID, 
       MSSPropagationPropagationTask.MaxWorkID, 
       MSSPropagationPropagationTask.BirthDate
    FROM MSSPropagationPropagationTask
    LEFT OUTER JOIN MSSPropagationSearchServerReady 
        ON MSSPropagationPropagationTask.CatalogId = MSSPropagationSearchServerReady.CatalogId
        AND MSSPropagationPropagationTask.TaskType = MSSPropagationSearchServerReady.TaskType
        AND MSSPropagationPropagationTask.ObjectId = MSSPropagationSearchServerReady.ObjectId
        AND MSSPropagationSearchServerReady.SearchServerID = @SearchServerID
    WHERE MSSPropagationPropagationTask.CatalogID = @CatalogId and MSSPropagationSearchServerReady.CatalogId IS NULL 
    ORDER BY MSSPropagationPropagationTask.BirthDate
END

GO
