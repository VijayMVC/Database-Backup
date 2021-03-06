/****** Object:  StoredProcedure [dbo].[zw_delete_AccountContactUserField]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_AccountContactUserField ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@username [nvarchar](MAX)   = NULL , 
@password [nvarchar](MAX)   = NULL , 
@OPT___OUT_of_FASTMAIL varchar(1)  = NULL , 
@AllowWebAccess varchar(1)  = NULL , 
@LastWebAccess datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [AccountContactUserField] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
