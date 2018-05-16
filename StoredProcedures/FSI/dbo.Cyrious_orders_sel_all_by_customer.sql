/****** Object:  StoredProcedure [dbo].[Cyrious_orders_sel_all_by_customer]    Script Date: 5/15/2018 12:09:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Cyrious_orders_sel_all_by_customer]
(
@customerid int,
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON

select orderid, customerid, contactid, orderdate, pickedupdate, salestotal, description, sys_du, zw_franchise_id
from [order database]
where zw_franchise_id = @zw_franchise_id
and customerid = @customerid



GO
