/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationAddQueryServer]    Script Date: 5/15/2018 12:11:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationAddQueryServer(
    @Name nvarchar(256),
    @IndexDirectory nvarchar(260) )
AS
    DELETE FROM 
        dbo.MSSPropagationSearchServerTable
    WHERE 
        SearchServerName = @Name

    INSERT INTO
        dbo.MSSPropagationSearchServerTable (
            SearchServerName,
            IndexDirectory,
            MachineStatus,
            LastPropagationTime
        )
    VALUES ( 
        @Name,
        @IndexDirectory, 
        0,
        0
    )


GO
