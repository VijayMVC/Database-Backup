/****** Object:  StoredProcedure [dbo].[CleanExpiredJobs]    Script Date: 5/15/2018 12:11:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[CleanExpiredJobs]
AS
SET NOCOUNT OFF
DELETE FROM RunningJobs WHERE DATEADD(s, Timeout, StartDate) < GETDATE()

GO
