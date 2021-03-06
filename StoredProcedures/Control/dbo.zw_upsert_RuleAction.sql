/****** Object:  StoredProcedure [dbo].[zw_upsert_RuleAction]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_RuleAction ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ActionName [nvarchar](50)   = NULL , 
@AllowUserToCancel bit  = NULL , 
@ChildItemID int  = NULL , 
@ChildItemStoreID int  = NULL , 
@ChildItemClassTypeID int  = NULL , 
@ClearUserField bit  = NULL , 
@GroupAction bit  = NULL , 
@MessageText [nvarchar](MAX)   = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@SetOnlyIfBlank bit  = NULL , 
@SaveRecord bit  = NULL , 
@SortIndex float  = NULL , 
@UserFieldDataType int  = NULL , 
@UserFieldName [nvarchar](50)   = NULL , 
@UserFieldValue [nvarchar](MAX)   = NULL , 
@Category int  = NULL , 
@UserFieldSetValue bit  = NULL , 
@TextAppendOptions int  = NULL , 
@UseCurrentDate bit  = NULL , 
@FixedDaysOffset int  = NULL , 
@UseCurrentTime bit  = NULL , 
@FixedTime float  = NULL , 
@ExecuteAsGroup bit  = NULL , 
@Preview bit  = NULL , 
@ContactReplacementType int  = NULL , 
@EmployeeReplacementType int  = NULL , 
@ReplaceCustomer bit  = NULL , 
@ReplaceTransaction bit  = NULL , 
@TransactionType int  = NULL , 
@DelActivityOnStatusChange bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [RuleAction] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[ActionName] = @ActionName, 
		[AllowUserToCancel] = @AllowUserToCancel, 
		[ChildItemID] = @ChildItemID, 
		[ChildItemStoreID] = @ChildItemStoreID, 
		[ChildItemClassTypeID] = @ChildItemClassTypeID, 
		[ClearUserField] = @ClearUserField, 
		[GroupAction] = @GroupAction, 
		[MessageText] = @MessageText, 
		[ParentID] = @ParentID, 
		[ParentStoreID] = @ParentStoreID, 
		[ParentClassTypeID] = @ParentClassTypeID, 
		[SetOnlyIfBlank] = @SetOnlyIfBlank, 
		[SaveRecord] = @SaveRecord, 
		[SortIndex] = @SortIndex, 
		[UserFieldDataType] = @UserFieldDataType, 
		[UserFieldName] = @UserFieldName, 
		[UserFieldValue] = @UserFieldValue, 
		[Category] = @Category, 
		[UserFieldSetValue] = @UserFieldSetValue, 
		[TextAppendOptions] = @TextAppendOptions, 
		[UseCurrentDate] = @UseCurrentDate, 
		[FixedDaysOffset] = @FixedDaysOffset, 
		[UseCurrentTime] = @UseCurrentTime, 
		[FixedTime] = @FixedTime, 
		[ExecuteAsGroup] = @ExecuteAsGroup, 
		[Preview] = @Preview, 
		[ContactReplacementType] = @ContactReplacementType, 
		[EmployeeReplacementType] = @EmployeeReplacementType, 
		[ReplaceCustomer] = @ReplaceCustomer, 
		[ReplaceTransaction] = @ReplaceTransaction, 
		[TransactionType] = @TransactionType, 
		[DelActivityOnStatusChange] = @DelActivityOnStatusChange, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [RuleAction]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [ActionName], [AllowUserToCancel], [ChildItemID], [ChildItemStoreID], [ChildItemClassTypeID], [ClearUserField], [GroupAction], [MessageText], [ParentID], [ParentStoreID], [ParentClassTypeID], [SetOnlyIfBlank], [SaveRecord], [SortIndex], [UserFieldDataType], [UserFieldName], [UserFieldValue], [Category], [UserFieldSetValue], [TextAppendOptions], [UseCurrentDate], [FixedDaysOffset], [UseCurrentTime], [FixedTime], [ExecuteAsGroup], [Preview], [ContactReplacementType], [EmployeeReplacementType], [ReplaceCustomer], [ReplaceTransaction], [TransactionType], [DelActivityOnStatusChange], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @ActionName, @AllowUserToCancel, @ChildItemID, @ChildItemStoreID, @ChildItemClassTypeID, @ClearUserField, @GroupAction, @MessageText, @ParentID, @ParentStoreID, @ParentClassTypeID, @SetOnlyIfBlank, @SaveRecord, @SortIndex, @UserFieldDataType, @UserFieldName, @UserFieldValue, @Category, @UserFieldSetValue, @TextAppendOptions, @UseCurrentDate, @FixedDaysOffset, @UseCurrentTime, @FixedTime, @ExecuteAsGroup, @Preview, @ContactReplacementType, @EmployeeReplacementType, @ReplaceCustomer, @ReplaceTransaction, @TransactionType, @DelActivityOnStatusChange, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
