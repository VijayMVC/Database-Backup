/****** Object:  StoredProcedure [dbo].[zw_upsert_PricingElement]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_PricingElement ( 
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
@ElementName [nvarchar](50)   = NULL , 
@Description [nvarchar](50)   = NULL , 
@SortIndex float  = NULL , 
@LinkID int  = NULL , 
@LinkStoreID int  = NULL , 
@LinkClassTypeID int  = NULL , 
@StartDate datetime  = NULL , 
@EndDate datetime  = NULL , 
@ItemPrefix varchar(25)  = NULL , 
@IncomeID int  = NULL , 
@IncomeStoreID int  = NULL , 
@IncomeClassTypeID int  = NULL , 
@FamilyID int  = NULL , 
@FamilyStoreID int  = NULL , 
@FamilyClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [PricingElement] 
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
		[ElementName] = @ElementName, 
		[Description] = @Description, 
		[SortIndex] = @SortIndex, 
		[LinkID] = @LinkID, 
		[LinkStoreID] = @LinkStoreID, 
		[LinkClassTypeID] = @LinkClassTypeID, 
		[StartDate] = @StartDate, 
		[EndDate] = @EndDate, 
		[ItemPrefix] = @ItemPrefix, 
		[IncomeID] = @IncomeID, 
		[IncomeStoreID] = @IncomeStoreID, 
		[IncomeClassTypeID] = @IncomeClassTypeID, 
		[FamilyID] = @FamilyID, 
		[FamilyStoreID] = @FamilyStoreID, 
		[FamilyClassTypeID] = @FamilyClassTypeID, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [PricingElement]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [ParentID], [ParentStoreID], [ParentClassTypeID], [ElementName], [Description], [SortIndex], [LinkID], [LinkStoreID], [LinkClassTypeID], [StartDate], [EndDate], [ItemPrefix], [IncomeID], [IncomeStoreID], [IncomeClassTypeID], [FamilyID], [FamilyStoreID], [FamilyClassTypeID], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @ParentID, @ParentStoreID, @ParentClassTypeID, @ElementName, @Description, @SortIndex, @LinkID, @LinkStoreID, @LinkClassTypeID, @StartDate, @EndDate, @ItemPrefix, @IncomeID, @IncomeStoreID, @IncomeClassTypeID, @FamilyID, @FamilyStoreID, @FamilyClassTypeID, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
