/****** Object:  UserDefinedFunction [dbo].[fn_sec_get_Modules]    Script Date: 5/15/2018 12:14:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE   Function [dbo].[fn_sec_get_Modules]
(	@ObjectID int,
	@ObjectTYPE int
)
RETURNS TABLE AS 
RETURN(	
	select 		moduleid, 
				name,
				max(	case when childtype=2 and parenttype=@ObjectTYPE and parentid = @ObjectID
						then SEC_relationships.accesscode
						else 0
					end
				) as access
	from 		SEC_Modules 	left join  SEC_relationships 
					on 		childid=moduleid 
	group by			moduleid, name
)
	



GO
