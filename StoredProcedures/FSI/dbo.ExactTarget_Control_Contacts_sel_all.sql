/****** Object:  StoredProcedure [dbo].[ExactTarget_Control_Contacts_sel_all]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[ExactTarget_Control_Contacts_sel_all]
(
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
BEGIN

            SELECT ic.contactid, ic.zw_franchise_id, ic.first_name, ic.last_name, ic.email,
                        ic.zip_code, ic.company, ic.customer_industry, ic.last_order_date, ic.first_order_date,
                        ic.average_total, ic.last_order_amount, ic.customer_origin, ic.last_product_ordered,
                        ic.salesperson, ic.pickedup_date, ic.subscriber_id, ic.lastsync, ic.last_modified, ic.OptOut
            FROM _ExactTarget_Integration_Contacts ic
            WHERE ic.zw_franchise_id = @zw_franchise_id
            AND ic.email is not null 
            AND ic.email <> ''
            AND charindex('@',ic.email) > 0 

END

GO
