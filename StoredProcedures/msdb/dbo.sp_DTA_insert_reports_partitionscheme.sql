/****** Object:  StoredProcedure [dbo].[sp_DTA_insert_reports_partitionscheme]    Script Date: 5/15/2018 12:10:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure sp_DTA_insert_reports_partitionscheme
	@SessionID	int,   
	@PartitionFunctionID int,
	@PartitionSchemeName sysname,
	@PartitionSchemeDefinition ntext
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
	
	Insert into [msdb].[dbo].[DTA_reports_partitionscheme]( [PartitionFunctionID],[PartitionSchemeName],[PartitionSchemeDefinition]) values(@PartitionFunctionID,@PartitionSchemeName,@PartitionSchemeDefinition)
end	

GO
