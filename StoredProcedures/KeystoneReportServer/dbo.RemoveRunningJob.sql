/****** Object:  StoredProcedure [dbo].[RemoveRunningJob]    Script Date: 5/15/2018 12:10:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[RemoveRunningJob]
@JobID as nvarchar(32)
AS
SET NOCOUNT OFF
DELETE FROM RunningJobs WHERE JobID = @JobID

GO
