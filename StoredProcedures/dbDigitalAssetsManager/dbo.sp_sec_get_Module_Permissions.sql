/****** Object:  StoredProcedure [dbo].[sp_sec_get_Module_Permissions]    Script Date: 5/15/2018 12:09:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[sp_sec_get_Module_Permissions]
	@node_id numeric,
	@node_type numeric
	AS	
	select 	* 
	into 		#dump  
	from 		dbo.sm_fn_GetAccess( @node_id , @node_type , 0 ) 
	
	DECLARE	@NodeId int, @NodeType int, @Access int, @Level int, @e tinyint, @numrows int
	
	select @numrows = count(*) from #dump where Done=0
	while @numrows > 0 
	BEGIN
		select top 1 @NodeId= NodeId, @NodeType= NodeType, @Access= Access, @Level= Level from #dump where Done=0
		update #dump set Done=1 where NodeId=@NodeId and NodeType=@NodeType and Level=@Level and Done=0
		set @Level = @Level + 1
		insert 
		into 		#dump 
		select 	* 
		from 		sm_fn_GetAccess(@NodeId,@NodeType,@Level) NewNodes
		where 	not exists ( 	select 	* 						-- This only inserts the node
							from 		#dump 					--   if it is not already in the table
							where 	NodeId=NewNodes.NodeId 
							and 		NodeType=NewNodes.NodeType 
							and		(		Access=NewNodes.Access	-- This allows the node to be added but
										or	Level<NewNodes.Level	-- 	only if it is in the same level
									)
						)
		select @numrows = count(*) from #dump where Done=0
		print @numrows 
	END
/*****************************************************************************************/	
		select 	NodeId,
				Name
		from 		#dump 
		join		sm_Modules
		on		NodeId = ModuleID
		where 	nodetype = 2 
		group by 	NodeId, Name
		order by	Name
 
/*****************************************************************************************/	
	drop table #dump


GO
