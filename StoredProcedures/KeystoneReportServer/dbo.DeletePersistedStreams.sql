/****** Object:  StoredProcedure [dbo].[DeletePersistedStreams]    Script Date: 5/15/2018 12:09:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[DeletePersistedStreams]
@SessionID varchar(32)
AS
SET NOCOUNT OFF
delete top (10) p
from [KeystoneReportServerTempDB].dbo.PersistedStream p
where p.SessionID = @SessionID;

GO
