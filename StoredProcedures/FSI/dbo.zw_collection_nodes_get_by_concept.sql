/****** Object:  StoredProcedure [dbo].[zw_collection_nodes_get_by_concept]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
create procedure zw_collection_nodes_get_by_concept
(
@concept_id char(3)
)
as

SET NOCOUNT ON

select node_id
from collection_nodes
where concept_id = @concept_id
order by node_id
GO
