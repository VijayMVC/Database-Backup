/****** Object:  View [dbo].[vw_Contacts]    Script Date: 5/15/2018 12:13:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW vw_Contacts
AS
    SELECT
        vw_Locations.ZW_Franchise_ID ,
        ContactConsolidated.ID ,
        ContactConsolidated.FranchiseName ,
        ContactConsolidated.ContactId ,
        ContactConsolidated.AccountId ,
        ContactConsolidated.FirstName ,
        ContactConsolidated.MiddleName ,
        ContactConsolidated.LastName ,
        ContactConsolidated.Title ,
        ContactConsolidated.Position ,
        ContactConsolidated.EmailAddress ,
        ContactConsolidated.PrimaryPhoneNumber ,
        ContactConsolidated.PrimaryPhoneNumberExtension ,
        ContactConsolidated.PrimaryPhoneNumberType ,
        ContactConsolidated.SecondaryPhoneNumber ,
        ContactConsolidated.SecondaryPhoneNumberType ,
        ContactConsolidated.TertiaryPhoneNumber ,
        ContactConsolidated.TertiaryPhoneNumberType ,
        ContactConsolidated.IsUpdate ,
        ContactConsolidated.OLTP_InsertDate
    FROM
        ContactConsolidated
        INNER JOIN vw_Locations ON vw_Locations.Value = ContactConsolidated.CompanyLocationId
GO
