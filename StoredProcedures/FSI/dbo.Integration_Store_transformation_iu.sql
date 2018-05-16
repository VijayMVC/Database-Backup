/****** Object:  StoredProcedure [dbo].[Integration_Store_transformation_iu]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Integration_Store_transformation_iu]
(
@zw_franchise_id varchar(10),
@last_transformation datetime
)
AS
SET NOCOUNT ON

	UPDATE _ExactTarget_Integration_Stores
	SET 
		LastTransformation = @last_transformation
	WHERE 
		zw_franchise_id = @zw_franchise_id



GO
