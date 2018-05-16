/****** Object:  StoredProcedure [dbo].[ExactTarget_Store_listid_iu]    Script Date: 5/15/2018 12:09:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[ExactTarget_Store_listid_iu]
(
@zw_franchise_id varchar(10),
@listid varchar(200)
)
as

SET NOCOUNT ON
BEGIN

	UPDATE _ExactTarget_Integration_Stores 
	SET ListID = @listid
	WHERE zw_franchise_id = @zw_franchise_id

END



GO
