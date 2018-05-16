/****** Object:  StoredProcedure [dbo].[Integration_Contact_sel]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Integration_Contact_sel](
@contactid int,
@zw_franchise_id varchar(10)
)
AS 
SET NOCOUNT ON
BEGIN
		SELECT *		
		FROM _ExactTarget_Integration_Contacts
		WHERE 
			[contactid] = @contactid
		AND 
			[zw_franchise_id] = @zw_franchise_id
END

GO
