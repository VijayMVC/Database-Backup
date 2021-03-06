/****** Object:  StoredProcedure [dbo].[proc_MIP_RefreshScheduledJob]    Script Date: 5/15/2018 12:11:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
create procedure dbo.proc_MIP_RefreshScheduledJob
(
   @JobId uniqueidentifier,
   @NextDueTime datetime
) as
   set nocount on
   declare @retval as int
   set @retval = 0

   update 
      MIPScheduledJob
   set
      NextDueTime = @NextDueTime
   where
      JobId = @JobId

   if (@@error != 0) or (@@rowcount != 1)
   begin
      return 1 -- update error
   end

   return @retval -- 0 = success

GO
