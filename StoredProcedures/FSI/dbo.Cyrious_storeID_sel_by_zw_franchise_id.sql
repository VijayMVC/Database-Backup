/****** Object:  StoredProcedure [dbo].[Cyrious_storeID_sel_by_zw_franchise_id]    Script Date: 5/15/2018 12:09:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Cyrious_storeID_sel_by_zw_franchise_id]
(
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON

select zw_franchise_id, max(storeid) as StoreID
from [store information database]
WHERE zw_franchise_id = @zw_franchise_id
GROUP BY zw_franchise_id

GO
