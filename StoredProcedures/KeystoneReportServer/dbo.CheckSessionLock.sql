/****** Object:  StoredProcedure [dbo].[CheckSessionLock]    Script Date: 5/15/2018 12:09:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[CheckSessionLock]
@SessionID as varchar(32),
@LockVersion  int OUTPUT
AS
DECLARE @Selected nvarchar(32)
SELECT @Selected=SessionID, @LockVersion = LockVersion FROM [KeystoneReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) WHERE SessionID = @SessionID

GO
