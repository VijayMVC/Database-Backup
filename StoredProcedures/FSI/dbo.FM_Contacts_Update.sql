/****** Object:  StoredProcedure [dbo].[FM_Contacts_Update]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		Alex Montminy
-- Create date: 10/08/2012
-- Description:	New Fastmail procs
-- =============================================
CREATE PROCEDURE [dbo].[FM_Contacts_Update]
	-- Add the parameters for the stored procedure here
@zw_franchise_id varchar(10),
@contactid int,
@first_name varchar(20),
@last_name varchar(20),
@email varchar(50),
@zip_code varchar(25),
@company varchar(100),
@customer_industry varchar(100),
@last_order_date datetime,
@first_order_date datetime,
@average_total money,
@last_order_amount money,
@customer_origin varchar(100),
@last_product_ordered varchar(100),
@salesperson varchar(100),
@pickedup_date datetime,
@last_modified datetime,
@optout bit,
@LastSync datetime


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE _ExactTarget_Integration_Contacts
	SET
		first_name = @first_name,
		last_name = @last_name,
		email = @email,
		zip_code = @zip_code,
		company = @company, 
		customer_industry = @customer_industry, 
		last_order_date = @last_order_date, 
		first_order_date = @first_order_date, 
		average_total = @average_total, 
		last_order_amount = @last_order_amount, 
		customer_origin = @customer_origin, 
		last_product_ordered = @last_product_ordered, 
		salesperson = @salesperson, 
		pickedup_date = @pickedup_date,
		last_modified = @last_modified,
		OptOut2 = @optout,
		LastSync2 = @LastSync
	WHERE 
		[contactid] = @contactid
    -- Insert statements for procedure here
	
END

GO
