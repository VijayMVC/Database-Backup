/****** Object:  StoredProcedure [dbo].[sp_cor_get_AuditHistory]    Script Date: 5/15/2018 12:09:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE  PROCEDURE [dbo].[sp_cor_get_AuditHistory]
	@Id numeric
	AS	
	
	DECLARE	@B int, 
			@numrows int
	
	select 	* 
	into 		#dump  
	from 		dbo.fn_cor_GetAudit( @Id ) 
	
	select 	@numrows = count(*) 
	from 		#dump 
	where 	Done=0

	while @numrows > 0 
	BEGIN
		select 	
		top 1 	@B = LastAuditID 
		from 		#dump 
		where 	Done=0
		
		update 	#dump 
		set 		Done=1 
		where 	LastAuditID = @B 
		and 		Done=0

		insert 
		into 		#dump 
		select 	* 
		from 		fn_cor_GetAudit( @B )

		select 	@numrows = count(*) 
		from 		#dump 
		where 	Done=0

	END

/*****************************************************************************************/	
	select 	Date, UserId, ActionCode, Success
	from 		#dump 
	order by 	LastAuditId desc
/*****************************************************************************************/	

	drop table #dump



GO
