/****** Object:  StoredProcedure [dbo].[ups_FM_ResetLastSync2]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:        Alex Montminy
-- Create date: 2/01/2013
-- Description: Resets the LastSync2 Field in both the FSI and Control Databases 
-- This needed when a clear of the ET contact List is done
-- =============================================
CREATE PROCEDURE [dbo].[ups_FM_ResetLastSync2]
      -- Add the parameters for the stored procedure here
    @Toggle CHAR(1) = 'A'
AS 
    BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here

        IF @Toggle = 'A'
            OR @Toggle = 'F' 
            BEGIN 
                UPDATE
                    dbo._ExactTarget_Integration_Contacts
                SET 
                    LastSync2 = 01 / 01 / 1901
            END 
        IF @Toggle = 'A'
            OR @Toggle = 'C' 
            BEGIN 
                UPDATE
                    [Control].dbo.AccountContact
                SET 
                    LastSync2 = 01 / 01 / 1901
            END 
    END

GO
