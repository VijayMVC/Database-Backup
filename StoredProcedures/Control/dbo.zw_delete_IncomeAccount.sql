/****** Object:  StoredProcedure [dbo].[zw_delete_IncomeAccount]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_IncomeAccount ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@IsRoyaltyExempt bit  = NULL , 
@RoyaltyFee1 [decimal](18,5)  = NULL , 
@RoyaltyFee1OV bit  = NULL , 
@RoyaltyFee2 [decimal](18,5)  = NULL , 
@RoyaltyFee2OV bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [IncomeAccount] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
