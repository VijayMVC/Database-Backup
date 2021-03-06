/****** Object:  StoredProcedure [dbo].[FM_GetOYBData]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Alex Montminy
-- Create date: 10/08/2012
-- Description:	New Fastmail procs
-- =============================================
CREATE PROCEDURE [dbo].[FM_GetOYBData] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

select top 10000 C.zw_franchise_id, C.contactID, C.first_name, C.last_name, C.email, C.zip_code, C.company,
 C.customer_industry, C.last_order_date,C.average_total,C.last_product_ordered,C.salesperson,
 C.pickedup_date,
C.pickedup_date last_modified, C.subscriber_id, C.LastSync2, C.OptOut2, C.Delete_Flag, C.Delete_Date,
S.WebNumber as StoreWebNumber, S.LastSync as StoreLastSync, S.LastTransformation as StoreLastTransformation, SI.State as StoreState,
 SI.City as StoreCity, SI.Zip as StoreZip, SI.Address as StoreAddress
from 
dbo._ExactTarget_Integration_Contacts C
inner join 
dbo._ExactTarget_Integration_Stores S
on
C.zw_franchise_id =S.zw_franchise_id
inner join 
dbo.[Store Information Database] SI
on
C.zw_franchise_id = SI.zw_franchise_id
inner join
(select email
from 
dbo._ExactTarget_Integration_Contacts
group by email
having count(email) =1) as myTable
on
myTable.email = c.email
where
C.LastSync2 < C.last_modified
and C.OptOut2=0 and 's'='S'




END

GO
