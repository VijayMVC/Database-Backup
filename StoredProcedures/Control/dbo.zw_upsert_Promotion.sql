/****** Object:  StoredProcedure [dbo].[zw_upsert_Promotion]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_Promotion ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@PromotionName varchar(25)  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@IsAlwaysValid bit  = NULL , 
@ValidStartDateTime datetime  = NULL , 
@ValidEndDateTime datetime  = NULL , 
@PromotionType int  = NULL , 
@PercentageOff float  = NULL , 
@FixedDiscount float  = NULL , 
@SaleAccountID int  = NULL , 
@SaleAccountStoreID int  = NULL , 
@SaleAccountClassTypeID int  = NULL , 
@AllowOrderEdit bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Promotion] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[PromotionName] = @PromotionName, 
		[Description] = @Description, 
		[IsAlwaysValid] = @IsAlwaysValid, 
		[ValidStartDateTime] = @ValidStartDateTime, 
		[ValidEndDateTime] = @ValidEndDateTime, 
		[PromotionType] = @PromotionType, 
		[PercentageOff] = @PercentageOff, 
		[FixedDiscount] = @FixedDiscount, 
		[SaleAccountID] = @SaleAccountID, 
		[SaleAccountStoreID] = @SaleAccountStoreID, 
		[SaleAccountClassTypeID] = @SaleAccountClassTypeID, 
		[AllowOrderEdit] = @AllowOrderEdit, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Promotion]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [PromotionName], [Description], [IsAlwaysValid], [ValidStartDateTime], [ValidEndDateTime], [PromotionType], [PercentageOff], [FixedDiscount], [SaleAccountID], [SaleAccountStoreID], [SaleAccountClassTypeID], [AllowOrderEdit], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @PromotionName, @Description, @IsAlwaysValid, @ValidStartDateTime, @ValidEndDateTime, @PromotionType, @PercentageOff, @FixedDiscount, @SaleAccountID, @SaleAccountStoreID, @SaleAccountClassTypeID, @AllowOrderEdit, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
