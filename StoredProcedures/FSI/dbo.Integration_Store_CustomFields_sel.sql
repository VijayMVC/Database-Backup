/****** Object:  StoredProcedure [dbo].[Integration_Store_CustomFields_sel]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Integration_Store_CustomFields_sel]
(
@zw_franchise_id varchar(10)
)
AS
	SET NOCOUNT ON

	SELECT *
	FROM 
		_ExactTarget_Integration_Stores
	WHERE 
		zw_franchise_id = @zw_franchise_id


GO
