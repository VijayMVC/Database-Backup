/****** Object:  StoredProcedure [dbo].[proc_MSS_ResetAlertsHistory]    Script Date: 5/15/2018 12:11:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ResetAlertsHistory
AS

BEGIN

    TRUNCATE TABLE MSSAlertDocHistory

END


GO
