/****** Object:  UserDefinedFunction [dbo].[fn_sec_get_Pages]    Script Date: 5/15/2018 12:14:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE       Function [dbo].[fn_sec_get_Pages]
(	@ObjectID int,
	@ObjectTYPE int
)
RETURNS TABLE AS 
RETURN(	
	select 		pageid, 
				URL + case when isnull(parameters,'.') = '.' or len(parameters)=0 then '' else '?' end + isnull(parameters,'')  as Name ,
				max(	case when childtype=3 and parenttype=@ObjectTYPE and parentid = @ObjectID
						then SEC_relationships.accesscode
						else 0
					end
				) as access
	from 		SEC_Pages 	left join  SEC_relationships 
					on 		childid=pageid 
	group by			pageid, URL + case when isnull(parameters,'.') = '.' or len(parameters)=0 then '' else '?' end + isnull(parameters,'')
)
	



GO
