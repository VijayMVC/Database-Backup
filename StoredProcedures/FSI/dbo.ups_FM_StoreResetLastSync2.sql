/****** Object:  StoredProcedure [dbo].[ups_FM_StoreResetLastSync2]    Script Date: 5/15/2018 12:09:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =============================================
-- Author:        Alex Montminy
-- Create date: 2/20/2013
-- Description: Resets the LastSync2 Field in both the FSI and Control Databases 
-- This needed when a clear of the ET contact List is done
-- =============================================
CREATE  PROCEDURE [dbo].[ups_FM_StoreResetLastSync2]
      -- Add the parameters for the stored procedure here
@zwfranchiseID nvarchar(20)

AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
update dbo._ExactTarget_Integration_Contacts 
set LastSync2 = '01/01/1901'
where zw_franchise_id = @zwfranchiseID

update [Control].dbo.AccountContact
set LastSync2 = '01/01/1901'
where zw_franchise_id = @zwfranchiseID
END


GO
