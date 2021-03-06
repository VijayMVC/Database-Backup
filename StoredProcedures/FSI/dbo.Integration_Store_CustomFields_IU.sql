/****** Object:  StoredProcedure [dbo].[Integration_Store_CustomFields_IU]    Script Date: 5/15/2018 12:09:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[Integration_Store_CustomFields_IU]
(
@zw_franchise_id varchar(10),
@APIUserName varchar(100) = null, 
@APIPassword varchar(25) = null, 
@FastMailDate varchar(25) = null, 
@WebNumber varchar(25) = null, 
@StoreNumber varchar(25) = null
)
AS
SET NOCOUNT ON

	UPDATE _ExactTarget_Integration_Stores
	SET 
		APIUserName = @APIUserName, 
		APIPassword = @APIPassword, 
		FastMailDate = @FastMailDate, 
		WebNumber = @WebNumber, 
		StoreNumber = @StoreNumber
	WHERE
		zw_franchise_id = @zw_franchise_id

IF( @@ROWCOUNT = 0 )
		BEGIN
			INSERT INTO _ExactTarget_Integration_Stores( zw_franchise_id, APIUserName, APIPassword, FastMailDate, WebNumber, StoreNumber )
			VALUES( @zw_franchise_id, @APIUserName, @APIPassword, @FastMailDate, @WebNumber, @StoreNumber )
		END


GO
