/****** Object:  StoredProcedure [dbo].[zw_upsert_RuleMacro]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_RuleMacro ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@CategoryType int  = NULL , 
@AutoTriggerType int  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@FilterCondition [nvarchar](MAX)   = NULL , 
@FilterConditionType int  = NULL , 
@FilterType int  = NULL , 
@OwnsQuery bit  = NULL , 
@QueryID int  = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@QueryStoreID int  = NULL , 
@QueryClassTypeID int  = NULL , 
@ProceedCondition [nvarchar](MAX)   = NULL , 
@ProceedConditionType int  = NULL , 
@ProceedType int  = NULL , 
@RuleDataSource int  = NULL , 
@RuleName [nvarchar](35)   = NULL , 
@SecurityRightID int  = NULL , 
@RuleExecuteType int  = NULL , 
@SQLQuery [nvarchar](MAX)   = NULL , 
@IndirectTriggerType int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [RuleMacro] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[CategoryType] = @CategoryType, 
		[AutoTriggerType] = @AutoTriggerType, 
		[Description] = @Description, 
		[FilterCondition] = @FilterCondition, 
		[FilterConditionType] = @FilterConditionType, 
		[FilterType] = @FilterType, 
		[OwnsQuery] = @OwnsQuery, 
		[QueryID] = @QueryID, 
		[ParentID] = @ParentID, 
		[ParentStoreID] = @ParentStoreID, 
		[QueryStoreID] = @QueryStoreID, 
		[QueryClassTypeID] = @QueryClassTypeID, 
		[ProceedCondition] = @ProceedCondition, 
		[ProceedConditionType] = @ProceedConditionType, 
		[ProceedType] = @ProceedType, 
		[RuleDataSource] = @RuleDataSource, 
		[RuleName] = @RuleName, 
		[SecurityRightID] = @SecurityRightID, 
		[RuleExecuteType] = @RuleExecuteType, 
		[SQLQuery] = @SQLQuery, 
		[IndirectTriggerType] = @IndirectTriggerType, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [RuleMacro]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [CategoryType], [AutoTriggerType], [Description], [FilterCondition], [FilterConditionType], [FilterType], [OwnsQuery], [QueryID], [ParentID], [ParentStoreID], [QueryStoreID], [QueryClassTypeID], [ProceedCondition], [ProceedConditionType], [ProceedType], [RuleDataSource], [RuleName], [SecurityRightID], [RuleExecuteType], [SQLQuery], [IndirectTriggerType], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @CategoryType, @AutoTriggerType, @Description, @FilterCondition, @FilterConditionType, @FilterType, @OwnsQuery, @QueryID, @ParentID, @ParentStoreID, @QueryStoreID, @QueryClassTypeID, @ProceedCondition, @ProceedConditionType, @ProceedType, @RuleDataSource, @RuleName, @SecurityRightID, @RuleExecuteType, @SQLQuery, @IndirectTriggerType, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
