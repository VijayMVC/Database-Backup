/****** Object:  StoredProcedure [dbo].[FM_Cont_LastSync2_update]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		Alex Montminy
-- Create date: 10/08/2012
-- Description:	New Fastmail procs
-- =============================================
create PROCEDURE [dbo].[FM_Cont_LastSync2_update]
	-- Add the parameters for the stored procedure here
	@SyncXML xml

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


update dbo._ExactTarget_Integration_Contacts
set
     [_ExactTarget_Integration_Contacts].LastSync2 = GetDate()


FROM
--dbo._ExactTarget_Integration_Contacts Cross Apply
  @SyncXML.nodes('/LastSyncXML/LastSyncNodes/LastSyncNode') 
    Sync(Nodes)  
   inner join [_ExactTarget_Integration_Contacts] EIC
   on  (Sync.Nodes.value('./contactID[1]','nvarchar(max)') = EIC.contactID
   and  Sync.Nodes.value('./ZW_ID[1]','nvarchar(max)') = EIC.zw_franchise_id)
   
END

GO
