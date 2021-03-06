/****** Object:  StoredProcedure [dbo].[zw_delete_ReportElement]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_ReportElement ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate smalldatetime  = NULL , 
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
 
	 UPDATE [ReportElement] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
		AND [ModifiedByUser] = @ModifiedByUser
		AND [ModifiedByComputer] = @ModifiedByComputer
		AND [ModifiedDate] = @ModifiedDate
		AND [SeqID] = @SeqID
		AND [IsSystem] = @IsSystem
		AND [IsActive] = @IsActive
		AND [ParentID] = @ParentID
		AND [ParentStoreID] = @ParentStoreID
		AND [ParentClassTypeID] = @ParentClassTypeID
		AND [ElementName] = @ElementName
		AND [Description] = @Description
		AND [SortIndex] = @SortIndex
		AND [LinkID] = @LinkID
		AND [LinkStoreID] = @LinkStoreID
		AND [LinkClassTypeID] = @LinkClassTypeID
		AND [StartDate] = @StartDate
		AND [EndDate] = @EndDate
		AND [ItemPrefix] = @ItemPrefix
		AND [IncomeID] = @IncomeID
		AND [IncomeStoreID] = @IncomeStoreID
		AND [IncomeClassTypeID] = @IncomeClassTypeID
		AND [FamilyID] = @FamilyID
		AND [FamilyStoreID] = @FamilyStoreID
		AND [FamilyClassTypeID] = @FamilyClassTypeID

GO
