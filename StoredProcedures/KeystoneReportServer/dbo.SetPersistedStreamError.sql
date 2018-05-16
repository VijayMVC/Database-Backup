/****** Object:  StoredProcedure [dbo].[SetPersistedStreamError]    Script Date: 5/15/2018 12:10:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[SetPersistedStreamError]
@SessionID varchar(32),
@Index int,
@AllRows bit,
@Error nvarchar(512)
AS

if @AllRows = 0
BEGIN
    UPDATE [KeystoneReportServerTempDB].dbo.PersistedStream SET Error = @Error WHERE SessionID = @SessionID and [Index] = @Index
END
ELSE
BEGIN
    UPDATE [KeystoneReportServerTempDB].dbo.PersistedStream SET Error = @Error WHERE SessionID = @SessionID
END

GO
