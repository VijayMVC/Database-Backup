/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationIndexerGetUnresponsiveQueryServers]    Script Date: 5/15/2018 12:11:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationIndexerGetUnresponsiveQueryServers
AS
    SET NOCOUNT ON

    CREATE TABLE #UnresponsiveQueryServers ( 
        ServerID int )
    INSERT #UnresponsiveQueryServers    
    EXEC
        dbo.proc_MSS_PropagationGetUnresponsiveQueryServers

    SELECT 
        SearchServerName,
        IndexDirectory
    FROM 
        dbo.MSSPropagationSearchServerTable
    WHERE
        SearchServerID IN ( SELECT ServerID FROM #UnresponsiveQueryServers )

GO
