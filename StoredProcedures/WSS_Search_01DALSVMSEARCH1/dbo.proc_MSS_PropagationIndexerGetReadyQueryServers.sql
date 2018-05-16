/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationIndexerGetReadyQueryServers]    Script Date: 5/15/2018 12:13:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationIndexerGetReadyQueryServers
AS
    SELECT 
        SearchServerName,
        IndexDirectory
    FROM 
        dbo.MSSPropagationSearchServerTable
    WHERE
        MachineStatus = 3

GO
