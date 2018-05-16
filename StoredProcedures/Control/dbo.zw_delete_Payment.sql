/****** Object:  StoredProcedure [dbo].[zw_delete_Payment]    Script Date: 5/15/2018 12:09:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Payment ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@NameOnCard [nvarchar](25)   = NULL , 
@TrackingNumber [nvarchar](25)   = NULL , 
@PaymentAccountID int  = NULL , 
@PaymentAccountClassTypeID int  = NULL , 
@ExpirationDate datetime  = NULL , 
@VCode varchar(10)  = NULL , 
@IsCCNumEncrypt bit  = NULL , 
@DisplayNumber varchar(50)  = NULL , 
@IsVCodeEncrypted bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Payment] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
