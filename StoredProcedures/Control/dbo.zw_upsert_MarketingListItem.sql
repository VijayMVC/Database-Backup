/****** Object:  StoredProcedure [dbo].[zw_upsert_MarketingListItem]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_MarketingListItem ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@ItemName [nvarchar](35)   = NULL , 
@Description [nvarchar](50)   = NULL , 
@CanSelect bit  = NULL , 
@Code1 [nvarchar](20)   = NULL , 
@Code2 [nvarchar](20)   = NULL , 
@MarketingListID int  = NULL , 
@MarketingListStoreID int  = NULL , 
@MarketingListClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [MarketingListItem] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[ParentID] = @ParentID, 
		[ParentStoreID] = @ParentStoreID, 
		[ParentClassTypeID] = @ParentClassTypeID, 
		[ItemName] = @ItemName, 
		[Description] = @Description, 
		[CanSelect] = @CanSelect, 
		[Code1] = @Code1, 
		[Code2] = @Code2, 
		[MarketingListID] = @MarketingListID, 
		[MarketingListStoreID] = @MarketingListStoreID, 
		[MarketingListClassTypeID] = @MarketingListClassTypeID, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [MarketingListItem]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [ParentID], [ParentStoreID], [ParentClassTypeID], [ItemName], [Description], [CanSelect], [Code1], [Code2], [MarketingListID], [MarketingListStoreID], [MarketingListClassTypeID], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @ParentID, @ParentStoreID, @ParentClassTypeID, @ItemName, @Description, @CanSelect, @Code1, @Code2, @MarketingListID, @MarketingListStoreID, @MarketingListClassTypeID, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
