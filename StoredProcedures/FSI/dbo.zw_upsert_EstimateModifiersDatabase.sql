/****** Object:  StoredProcedure [dbo].[zw_upsert_EstimateModifiersDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_EstimateModifiersDatabase ( 
@ID int  = NULL , 
@OrderDetailID int  = NULL , 
@AVID int  = NULL , 
@OrderID int  = NULL , 
@Answer int  = NULL , 
@Price float  = NULL , 
@PriceOverridden bit  = NULL , 
@CalcPrice float  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Estimate Modifiers Database'
 
	 UPDATE [Estimate Modifiers Database] 
	 SET   
		[OrderDetailID] = @OrderDetailID, 
		[AVID] = @AVID, 
		[OrderID] = @OrderID, 
		[Answer] = @Answer, 
		[Price] = @Price, 
		[PriceOverridden] = @PriceOverridden, 
		[CalcPrice] = @CalcPrice, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Estimate Modifiers Database]( [ID], [OrderDetailID], [AVID], [OrderID], [Answer], [Price], [PriceOverridden], [CalcPrice], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @OrderDetailID, @AVID, @OrderID, @Answer, @Price, @PriceOverridden, @CalcPrice, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
