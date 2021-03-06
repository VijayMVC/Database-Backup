/****** Object:  StoredProcedure [dbo].[zw_upsert_CommissionRate]    Script Date: 5/15/2018 12:09:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_upsert_CommissionRate] ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@PricingPlanTypeID int  = NULL , 
@CommissionPlanID int  = NULL , 
@Rate1Salesperson1 float  = NULL , 
@Rate2Salesperson1 float  = NULL , 
@Rate2Salesperson2 float  = NULL , 
@Rate3Salesperson1 float  = NULL , 
@Rate3Salesperson2 float  = NULL , 
@Rate3Salesperson3 float  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [CommissionRate] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[PricingPlanTypeID] = @PricingPlanTypeID, 
		[CommissionPlanID] = @CommissionPlanID, 
		[Rate1Salesperson1] = @Rate1Salesperson1, 
		[Rate2Salesperson1] = @Rate2Salesperson1, 
		[Rate2Salesperson2] = @Rate2Salesperson2, 
		[Rate3Salesperson1] = @Rate3Salesperson1, 
		[Rate3Salesperson2] = @Rate3Salesperson2, 
		[Rate3Salesperson3] = @Rate3Salesperson3, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [CommissionRate]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [PricingPlanTypeID], [CommissionPlanID], [Rate1Salesperson1], [Rate2Salesperson1], [Rate2Salesperson2], [Rate3Salesperson1], [Rate3Salesperson2], [Rate3Salesperson3], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @PricingPlanTypeID, @CommissionPlanID, @Rate1Salesperson1, @Rate2Salesperson1, @Rate2Salesperson2, @Rate3Salesperson1, @Rate3Salesperson2, @Rate3Salesperson3, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 


GO
