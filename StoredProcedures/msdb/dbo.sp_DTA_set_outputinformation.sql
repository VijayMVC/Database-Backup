/****** Object:  StoredProcedure [dbo].[sp_DTA_set_outputinformation]    Script Date: 5/15/2018 12:10:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_DTA_set_outputinformation
	@SessionID int,
	@TuningResults ntext,
	@FinishStatus tinyint
as 
begin
	declare @retval  int							
	set nocount on

	exec @retval =  sp_DTA_check_permission @SessionID

	if @retval = 1
	begin
		raiserror(31002,-1,-1)
		return(1)
	end	
	
	Insert into [msdb].[dbo].[DTA_output]([SessionID], [TuningResults],[FinishStatus]) values(@SessionID,@TuningResults,@FinishStatus)
end	

GO
