/****** Object:  StoredProcedure [dbo].[sp_DTA_delete_session]    Script Date: 5/15/2018 12:10:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

create procedure sp_DTA_delete_session 
	@SessionID int 
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

	delete from msdb.dbo.DTA_input where SessionID=@SessionID
end

GO
