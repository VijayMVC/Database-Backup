/****** Object:  StoredProcedure [dbo].[usp_FM_UpdateStoreSubscribers]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex, Montminy
-- Create date: 11/18/2014
-- Description:   Flags subscribers of a single store for update
-- =============================================
CREATE PROCEDURE usp_FM_UpdateStoreSubscribers @ZwId CHAR(7)
AS 
    BEGIN
        UPDATE
            Contact.FastMailDim
        SET 
            IsModified = 1
        FROM
            Contact.FastMailDim
            INNER JOIN Contact.ContactFact ON Contact.ContactFact.ContactKey = Contact.FastMailDim.ContactKey
            INNER JOIN Store.StoreFact ON Contact.ContactFact.ZW_Franchise_ID = Store.StoreFact.ZW_Franchise_ID
        WHERE
            Contact.ContactFact.ZW_Franchise_ID = @ZwId
    END

GO
