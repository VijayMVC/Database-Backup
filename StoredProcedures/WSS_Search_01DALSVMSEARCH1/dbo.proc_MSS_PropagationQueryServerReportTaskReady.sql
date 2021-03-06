/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationQueryServerReportTaskReady]    Script Date: 5/15/2018 12:13:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationQueryServerReportTaskReady(
    @CatalogID int, @ServerName nvarchar( 31 ), @TaskType int, @ObjectID int )
AS
BEGIN
SET NOCOUNT ON
    IF NOT EXISTS ( SELECT * FROM dbo.MSSPropagationSearchServerTable 
                    WHERE SearchServerName = @ServerName AND
                          MachineStatus != 5 AND
                          MachineStatus != 6 )
        RETURN 1
    DECLARE
        @SearchServerID int
    SELECT
        @SearchServerID = SearchServerID
    FROM
        dbo.MSSPropagationSearchServerTable
    WHERE
        SearchServerName = @ServerName
    IF EXISTS ( SELECT * FROM dbo.MSSPropagationSearchServerReady 
                WHERE SearchServerID = @SearchServerID AND
                      CatalogID = @CatalogID AND
                      TaskType = @TaskType AND
                      ObjectID = @ObjectID )
        RETURN 1
    INSERT dbo.MSSPropagationSearchServerReady VALUES ( @CatalogID, @TaskType, @ObjectID, @SearchServerID )
    IF ( @TaskType = 1 )
    BEGIN
        UPDATE
            dbo.MSSPropagationSearchServerTable
        SET
            LastPropagationTime = GETUTCDATE()
        WHERE
            SearchServerName = @ServerName
    END
END

GO
