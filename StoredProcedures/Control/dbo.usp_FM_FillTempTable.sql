/****** Object:  StoredProcedure [dbo].[usp_FM_FillTempTable]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



-- =============================================
-- Author:           <Alex Montminy>
-- Create date: <10/2/2015>
-- Description:      <Fills temp table with fastmail subscriber data>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_FillTempTable]
       -- Add the parameters for the stored procedure here
    @RecordsAfter VARCHAR(10)
AS
    BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here

        IF ( EXISTS ( SELECT
                        *
                      FROM
                        tempdb.INFORMATION_SCHEMA.TABLES
                      WHERE
                        TABLE_SCHEMA = 'dbo'
                        AND TABLE_NAME = 'FM_ToSync' ) )
            BEGIN
                PRINT 'Dopping table';
                DROP TABLE tempdb.dbo.FM_ToSync
       
            END

                     
                     
        PRINT 'Fill Table';
        WITH    OrderedTrans
                  AS ( SELECT
                        ROW_NUMBER() OVER ( PARTITION BY AccountContact.zw_franchise_id,
                                            AccountContact.ID ORDER BY TransHeader.ClosedDate DESC ) AS Ranker ,
                        TransHeader.ClosedDate ,
                        AccountContact.ID AS AccountContactID ,
                        TransHeader.ID AS TransHeaderID ,
                        TransHeader.SubTotalPrice ,
                        AccountContact.zw_franchise_id ,
                        AccountContact.EmailAddress ,
                        AccountContact.FirstName ,
                        AccountContact.LastName ,
                        AccountContact.ShippingAddressID ,
                        AccountContact.AccountID
                       FROM
                        AccountContact
                        INNER JOIN TransHeader ON TransHeader.ContactID = AccountContact.ID
                                                  AND TransHeader.zw_franchise_id = AccountContact.zw_franchise_id
                     )
            SELECT
                OrderedTrans.ClosedDate ,
                OrderedTrans.SubTotalPrice ,
                OrderedTrans.EmailAddress ,
                OrderedTrans.FirstName ,
                OrderedTrans.LastName ,
                OrderedTrans.ShippingAddressID ,
                OrderedTrans.AccountContactID ,
                Address.StreetAddress1 ,
                Address.City ,
                Address.State ,
                Address.Country ,
                Address.PostalCode ,
                OrderedTrans.Ranker ,
                Address.zw_franchise_id ,
                Account.CompanyName
            INTO
                tempdb.dbo.FM_ToSync
            FROM
                OrderedTrans
                INNER JOIN Address ON OrderedTrans.ShippingAddressID = Address.ID
                                      AND OrderedTrans.zw_franchise_id = Address.zw_franchise_id
                INNER JOIN Account ON OrderedTrans.AccountID = Account.ID
                                      AND OrderedTrans.zw_franchise_id = Account.zw_franchise_id
            WHERE
                OrderedTrans.ClosedDate > @RecordsAfter
                AND OrderedTrans.EmailAddress IS NOT NULL
                AND OrderedTrans.Ranker = 1
    END

GO
