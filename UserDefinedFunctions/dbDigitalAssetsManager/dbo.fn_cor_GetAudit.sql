/****** Object:  UserDefinedFunction [dbo].[fn_cor_GetAudit]    Script Date: 5/15/2018 12:14:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create function [dbo].[fn_cor_GetAudit] (@Id int)

		returns @collaborator table 
		(	Success bit,
			UserId int,
			ActionCode int,
			Date datetime,
			LastAuditId int,
			Done tinyint
		) as
		BEGIN
			insert 	@collaborator
			select	Success,
					UserId,
					ActionCode,
					Date,
					LastAuditID,
					0
			from		COR_AUDIT
			where		AuditID = @Id
			RETURN
		END 


GO
