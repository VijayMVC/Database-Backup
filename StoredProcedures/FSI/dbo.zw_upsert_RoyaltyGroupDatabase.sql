/****** Object:  StoredProcedure [dbo].[zw_upsert_RoyaltyGroupDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_RoyaltyGroupDatabase ( 
@RoyaltyGroupID int  = NULL , 
@StoreID int  = NULL , 
@GroupName varchar(50)   = NULL , 
@Description varchar(MAX)   = NULL , 
@IsActive bit  = NULL , 
@AvailableToUser bit  = NULL , 
@RoyaltyRate float  = NULL , 
@AdvertisingRate float  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Royalty Group Database'
 
	 UPDATE [Royalty Group Database] 
	 SET   
		[GroupName] = @GroupName, 
		[Description] = @Description, 
		[IsActive] = @IsActive, 
		[AvailableToUser] = @AvailableToUser, 
		[RoyaltyRate] = @RoyaltyRate, 
		[AdvertisingRate] = @AdvertisingRate, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [RoyaltyGroupID] = @RoyaltyGroupID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Royalty Group Database]( [RoyaltyGroupID], [StoreID], [GroupName], [Description], [IsActive], [AvailableToUser], [RoyaltyRate], [AdvertisingRate], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @RoyaltyGroupID, @StoreID, @GroupName, @Description, @IsActive, @AvailableToUser, @RoyaltyRate, @AdvertisingRate, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
