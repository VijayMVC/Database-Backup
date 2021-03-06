/****** Object:  StoredProcedure [dbo].[zw_upsert_IncomeAccount]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_IncomeAccount ( 
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
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[IsRoyaltyExempt] = @IsRoyaltyExempt, 
		[RoyaltyFee1] = @RoyaltyFee1, 
		[RoyaltyFee1OV] = @RoyaltyFee1OV, 
		[RoyaltyFee2] = @RoyaltyFee2, 
		[RoyaltyFee2OV] = @RoyaltyFee2OV, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [IncomeAccount]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [IsRoyaltyExempt], [RoyaltyFee1], [RoyaltyFee1OV], [RoyaltyFee2], [RoyaltyFee2OV], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @IsRoyaltyExempt, @RoyaltyFee1, @RoyaltyFee1OV, @RoyaltyFee2, @RoyaltyFee2OV, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
