/****** Object:  StoredProcedure [dbo].[zw_delete_RuleActivity]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_RuleActivity ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@AutoRollOver bit  = NULL , 
@AutoRun bit  = NULL , 
@Color int  = NULL , 
@CreatedByID int  = NULL , 
@CreatedDateTime datetime  = NULL , 
@ImageID int  = NULL , 
@IsFromRecurring bit  = NULL , 
@IsTimeless bit  = NULL , 
@OriginalScheduledDateTime datetime  = NULL , 
@Priority int  = NULL , 
@PriorityText [nvarchar](15)   = NULL , 
@PrivateEvent bit  = NULL , 
@RecurringActivityID int  = NULL , 
@RunWithoutPrompting bit  = NULL , 
@ScheduledEndDateTime datetime  = NULL , 
@ScheduledStartDateTime datetime  = NULL , 
@RuleID int  = NULL , 
@RuleStoreID int  = NULL , 
@RuleClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [RuleActivity] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
