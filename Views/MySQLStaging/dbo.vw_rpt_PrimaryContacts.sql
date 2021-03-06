/****** Object:  View [dbo].[vw_rpt_PrimaryContacts]    Script Date: 5/15/2018 12:14:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vw_rpt_PrimaryContacts]
AS
    SELECT
        Driver.CustomerID ,
        Driver.users_id AS ContactID ,
        Driver.FirstName ,
        Driver.LastName ,
        Driver.PhoneNumber ,
        Driver.PhoneExtention ,
        Driver.Email ,
        Driver.primary_flag ,
        Driver.IsActive ,
        Driver.Title ,
        Driver.FaxNumber
    FROM
        ( SELECT
            ROW_NUMBER() OVER ( PARTITION BY vw_Contacts.CustomerID ORDER BY vw_Contacts.IsActive DESC, vw_Contacts.primary_flag DESC, vw_Contacts.users_id ) AS Ranker ,
            vw_Contacts.CustomerID ,
            vw_Contacts.users_id ,
            vw_Contacts.FirstName ,
            vw_Contacts.LastName ,
            vw_Contacts.PhoneNumber ,
            vw_Contacts.PhoneExtention ,
            vw_Contacts.Email ,
            vw_Contacts.primary_flag ,
            vw_Contacts.IsActive ,
            vw_Contacts.Title ,
            vw_Contacts.FaxNumber
          FROM
            vw_Contacts WITH ( NOLOCK )
        ) Driver
    WHERE
        Driver.Ranker = 1

GO
