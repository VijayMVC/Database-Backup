/****** Object:  StoredProcedure [dbo].[TempResetTimeout]    Script Date: 5/15/2018 12:09:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.TempResetTimeout
            @id     tSessionId
        AS
            UPDATE [ASPState].dbo.ASPStateTempSessions
            SET Expires = DATEADD(n, Timeout, GETUTCDATE())
            WHERE SessionId = @id
            RETURN 0
GO
