/****** Object:  StoredProcedure [dbo].[RemoveReportFromSession]    Script Date: 5/15/2018 12:10:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[RemoveReportFromSession]
@SessionID as varchar(32),
@ReportPath as nvarchar(440), 
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int
AS

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

EXEC DereferenceSessionSnapshot @SessionID, @OwnerID
   
DELETE
   SE
FROM
   [KeystoneReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @SessionID AND
   SE.ReportPath = @ReportPath AND
   SE.OwnerID = @OwnerID
   
DELETE FROM [KeystoneReportServerTempDB].dbo.SessionLock WHERE SessionID=@SessionID
   
-- Delete any persisted streams associated with this session
UPDATE PS
SET
    PS.RefCount = 0,
    PS.ExpirationDate = GETDATE()
FROM
    [KeystoneReportServerTempDB].dbo.PersistedStream AS PS
WHERE
    PS.SessionID = @SessionID

GO
