/****** Object:  StoredProcedure [dbo].[ut_ClearLogs]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE ut_ClearLogs 
AS
SET NOCOUNT ON
DUMP TRAN Marketing WITH NO_LOG
DBCC SHRINKFILE('Marketing_Log', 1)



GO
