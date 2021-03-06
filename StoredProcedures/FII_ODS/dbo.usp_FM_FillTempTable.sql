/****** Object:  StoredProcedure [dbo].[usp_FM_FillTempTable]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


-- =============================================
-- Author:           <Author,,Name>
-- Create date: <Create Date,,>
-- Description:      <Description,,>
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
              
        SELECT
            Contact.ContactKey ,
            Customer.CenterKey ,
            Customer.CustomerID ,
            Customer.ZW_Franchise_ID ,
            Contact.CompanyNameDim.CompanyNameName ,
            Customer.City ,
            Customer.State ,
            Contact.ZipDim.ZipName ,
            Contact.CountyDim.CountyName ,
            Contact.CountryDim.CountryName ,
            Customer.Prospect ,
            Customer.CreateDate ,
            Customer.LastPickedUpDate AS LastOrderDate ,
            Customer.LastPickedUpDate AS LastPickedUpDate ,
            Customer.LastSaleAmount AS SalesSubtotal ,
            Customer.ActiveCustomer ,
            Contact.EmployeeFact.FirstName AS SalesPersonFirstName ,
            Contact.EmployeeFact.LastName AS SalesPersonLastName ,
            Contact.FirstName ,
            Contact.LastName ,
            Contact.Title ,
            Contact.PareaCode + Contact.PhoneNumber AS PhoneNumber ,
            Contact.PhoneExtention ,
            Contact.FareaCode + Contact.FaxNumber AS FaxNumber ,
            Contact.EmailAddress ,
            Contact.BirthMonth ,
            Contact.BirthDay ,
            Contact.FastMailDim.IsModified ,
            Contact.FastMailDim.LastUpdated ,
            ISNULL(Contact.IndustryTypeDim.CleanedIndustry, 'UNASSIGNED') AS CleanedIndustry ,
            Contact.IndustryTypeDim.IndustryTypeName ,
            Contact.IsActive,
			Contact.DoNotEmail
        INTO
            tempdb.dbo.FM_ToSync
        FROM
            Contact.ContactFact Contact WITH ( NOLOCK )
            JOIN Contact.CustomerFact Customer WITH ( NOLOCK ) ON Contact.CustomerKey = Customer.CustomerKey
            LEFT JOIN Contact.CompanyNameDim WITH ( NOLOCK ) ON Customer.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey
            LEFT JOIN Contact.CountryDim WITH ( NOLOCK ) ON Customer.CountryKey = Contact.CountryDim.CountryKey
            LEFT JOIN Contact.CountyDim WITH ( NOLOCK ) ON Customer.CountyKey = Contact.CountyDim.CountyKey
            LEFT JOIN Contact.ZipDim WITH ( NOLOCK ) ON Customer.ZipKey = Contact.ZipDim.ZipKey
            LEFT JOIN Contact.IndustryDim WITH ( NOLOCK ) ON Customer.IndustryTypeID = Contact.IndustryDim.IndustryTypeID
                                                             AND Customer.ZW_Franchise_ID = Contact.IndustryDim.ZW_Franchise_ID
            LEFT JOIN Contact.IndustryTypeDim WITH ( NOLOCK ) ON Contact.IndustryDim.IndustryTypeKey = Contact.IndustryTypeDim.IndustryTypeKey
            LEFT JOIN Contact.EmployeeFact WITH ( NOLOCK ) ON Customer.SalesPersonKey = Contact.EmployeeFact.EmployeeKey
            JOIN Contact.FastMailDim WITH ( NOLOCK ) ON Contact.ContactKey = Contact.FastMailDim.ContactKey
        WHERE
            Contact.EmailAddress IS NOT NULL
            AND Customer.LastPickedUpDate > @RecordsAfter
        ORDER BY
            Customer.LastPickedUpDate

    END



GO
