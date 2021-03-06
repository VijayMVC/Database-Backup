/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationGetQueryServers]    Script Date: 5/15/2018 12:11:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationGetQueryServers
AS
    DECLARE @Temp table(
        ServerID int,
        SearchServerName nvarchar(31),
        IndexDirectory nvarchar(260),
        MachineStatus int,
        LastPropagationTime datetime,
        PropagationStatus int
    )

    INSERT INTO
        @Temp
    SELECT
        SearchServerID,
        SearchServerName, 
        IndexDirectory, 
        MachineStatus,
        LastPropagationTime,
        1
    AS 
        PropagationStatus
    FROM 
        dbo.MSSPropagationSearchServerTable

    UPDATE
        @Temp
    SET
        PropagationStatus = 0
    WHERE
        NOT EXISTS (SELECT * FROM dbo.MSSPropagationSearchServerReady AS R WHERE ServerID = R.SearchServerID) AND
        (1 < DATEDIFF(m, LastPropagationTime, GETUTCDATE()) OR
        30 < DATEDIFF(s, LastPropagationTime, GETUTCDATE()))

    CREATE TABLE #UnresponsiveQueryServers ( 
        ServerID int )
    INSERT #UnresponsiveQueryServers    
    EXEC
        dbo.proc_MSS_PropagationGetUnresponsiveQueryServers

    UPDATE
        @Temp
    SET
        PropagationStatus = 3
    WHERE
        ServerID IN ( SELECT ServerID FROM #UnresponsiveQueryServers )

    UPDATE
        @Temp
    SET
        PropagationStatus = 2
    WHERE
        MachineStatus = 0 OR
        MachineStatus = 1 OR
        MachineStatus = 2

    SELECT 
        SearchServerName,
        IndexDirectory,
        MachineStatus,
        PropagationStatus 
    FROM 
        @Temp

GO
