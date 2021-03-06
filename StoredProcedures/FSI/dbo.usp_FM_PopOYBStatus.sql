/****** Object:  StoredProcedure [dbo].[usp_FM_PopOYBStatus]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:        Alex Montminy
-- Create date: 01/28/2013
-- Description:   Populates OYB status of customers from store info FOr both FSI and COntrol
-- =============================================
CREATE PROCEDURE [dbo].[usp_FM_PopOYBStatus]
      -- Add the parameters for the stored procedure here
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;
    -- Insert statements for procedure here
        UPDATE
            dbo._ExactTarget_Integration_Contacts
        SET 
            dbo._ExactTarget_Integration_Contacts.OptOut2 = ~OYBS.IsOYB ,
            dbo._ExactTarget_Integration_Contacts.last_modified = GETDATE()
        FROM
            dbo._ExactTarget_Integration_Contacts EIC
            INNER JOIN dbo.FM_OYBStatus OYBS ON EIC.zw_franchise_id = OYBS.ZW_ID
        WHERE
           ISNULL( OptOut2, 0) = OYBS.IsOYB 
      
        UPDATE
            [Control].dbo.AccountContact
        SET 
            [Control].dbo.AccountContact.OptOut2 = ~OYBS.IsOYB
        FROM
            [Control].dbo.AccountContact
            INNER JOIN [FSI].dbo.FM_OYBStatus OYBS ON [Control].dbo.AccountContact.zw_franchise_id = OYBS.ZW_ID
        WHERE
            ISNULL( OptOut2, 0) = OYBS.IsOYB 
      
    END


GO
