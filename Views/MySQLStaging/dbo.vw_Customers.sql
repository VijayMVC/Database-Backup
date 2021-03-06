/****** Object:  View [dbo].[vw_Customers]    Script Date: 5/15/2018 12:14:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vw_Customers]
AS
     select
        accounts.accounts_id ,
        replace(accounts.accounts_id, accounts.franchise_id + ':a', '') as customerid ,
        accounts.company_name as companyname ,
        100 as pricingratio ,
        accounts_address.address_1 as billingaddress1 ,
        accounts_address.address_2 as billingaddress2 ,
        accounts_address.city as city ,
        states.code as state ,
        accounts_address.zipcode as zip ,
        countries.code as country ,
        accounts.franchise_id as zw_franchise_id ,
        accounts.credit_amount_approved as creditlimit ,
        accounts.tax_exempt as taxexempt ,
        accounts.tax_id_number as taxexemptnumber ,
        accounts.tax_id_expiry_date as taxidexpdate ,
        accounts.last_modified_on as sys_du
    from
        accounts
        inner join accounts_address on accounts.accounts_id = accounts_address.accounts_id
        left join states on accounts_address.state_id = states.state_id
        left join countries on accounts_address.country_id = countries.country_id




GO
