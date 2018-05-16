/****** Object:  StoredProcedure [dbo].[usp_FM_SetIsModifiedFalse]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_FM_SetIsModifiedFalse]
(	@ContactKeys dbo.SingleColumnIntTable readonly)
	
AS
update Contact.FastMailDim 
set IsModified =0
from @ContactKeys as CK inner join Contact.FastMailDim on CK.value = Contact.FastMailDim.ContactKey
	
RETURN 0

GO
