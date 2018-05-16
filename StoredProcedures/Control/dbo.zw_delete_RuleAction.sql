/****** Object:  StoredProcedure [dbo].[zw_delete_RuleAction]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_RuleAction ( 
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
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
