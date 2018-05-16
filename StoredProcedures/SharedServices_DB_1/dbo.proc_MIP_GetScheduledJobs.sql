/****** Object:  StoredProcedure [dbo].[proc_MIP_GetScheduledJobs]    Script Date: 5/15/2018 12:11:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
create procedure dbo.proc_MIP_GetScheduledJobs
as
   set nocount on

   select
      t.Assembly,
      t.Class,
      t.JobId,
      t.Recurrence,
      t.JobData,
      t.NextDueTime,
      t.Disabled,
      t.DisplayName
   from
      dbo.MIPScheduledJob t


GO
