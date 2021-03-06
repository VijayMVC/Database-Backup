/****** Object:  StoredProcedure [dbo].[zw_upsert_PromotionDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_PromotionDatabase ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@Promotion varchar(30)   = NULL , 
@DiscountPercent float  = NULL , 
@DiscountAmount float  = NULL , 
@MinimumPurchase float  = NULL , 
@ActivePromotion bit  = NULL , 
@StartDate datetime  = NULL , 
@EndDate datetime  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Promotion Database'
 
	 UPDATE [Promotion Database] 
	 SET   
		[Promotion] = @Promotion, 
		[DiscountPercent] = @DiscountPercent, 
		[DiscountAmount] = @DiscountAmount, 
		[MinimumPurchase] = @MinimumPurchase, 
		[ActivePromotion] = @ActivePromotion, 
		[StartDate] = @StartDate, 
		[EndDate] = @EndDate, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Promotion Database]( [ID], [StoreID], [Promotion], [DiscountPercent], [DiscountAmount], [MinimumPurchase], [ActivePromotion], [StartDate], [EndDate], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @Promotion, @DiscountPercent, @DiscountAmount, @MinimumPurchase, @ActivePromotion, @StartDate, @EndDate, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
