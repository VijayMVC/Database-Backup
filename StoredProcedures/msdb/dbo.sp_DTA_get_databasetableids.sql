/****** Object:  StoredProcedure [dbo].[sp_DTA_get_databasetableids]    Script Date: 5/15/2018 12:10:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_DTA_get_databasetableids
	@SessionID	int
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

	select DatabaseID,DatabaseName 
	from [msdb].[dbo].[DTA_reports_database] as D 
	where D.SessionID = @SessionID

end	

GO
