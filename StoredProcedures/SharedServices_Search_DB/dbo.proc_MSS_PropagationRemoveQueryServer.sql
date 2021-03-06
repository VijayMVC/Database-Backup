/****** Object:  StoredProcedure [dbo].[proc_MSS_PropagationRemoveQueryServer]    Script Date: 5/15/2018 12:11:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_MSS_PropagationRemoveQueryServer(
    @Name nvarchar(256) )
AS
    BEGIN TRANSACTION

    DELETE FROM
        dbo.MSSPropagationSearchServerReady
    WHERE
        SearchServerID = ( SELECT SearchServerID FROM dbo.MSSPropagationSearchServerTable WHERE SearchServerName = @Name )

    DELETE FROM
        dbo.MSSPropagationSearchServerTable
    WHERE
        SearchServerName = @Name

    COMMIT TRANSACTION


GO
