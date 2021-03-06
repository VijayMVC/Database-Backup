/****** Object:  StoredProcedure [dbo].[zw_delete_ContactActivity]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_ContactActivity ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@AllDayEvent bit  = NULL , 
@AutoRollOver bit  = NULL , 
@AutoRun bit  = NULL , 
@Color int  = NULL , 
@ContactActivityType int  = NULL , 
@ContactActivityTypeText [nvarchar](15)   = NULL , 
@ContactCallType int  = NULL , 
@ContactCallTypeText [nvarchar](15)   = NULL , 
@CreatedByID int  = NULL , 
@CreatedDateTime datetime  = NULL , 
@ImageID int  = NULL , 
@IsFromRecurring bit  = NULL , 
@IsTimeless bit  = NULL , 
@Location [nvarchar](50)   = NULL , 
@OriginalScheduledDateTime datetime  = NULL , 
@Priority int  = NULL , 
@PriorityText [nvarchar](15)   = NULL , 
@PrivateEvent bit  = NULL , 
@RecurringActivityID int  = NULL , 
@RunWithoutPrompting bit  = NULL , 
@ScheduledEndDateTime datetime  = NULL , 
@ScheduledStartDateTime datetime  = NULL , 
@Result [nvarchar](MAX)   = NULL , 
@ValidStatus int  = NULL , 
@TransPartID int  = NULL , 
@TransPartStoreID int  = NULL , 
@TransPartClassTypeID int  = NULL , 
@PartInstanceID int  = NULL , 
@IsLocked bit  = NULL , 
@LocationID int  = NULL , 
@LocationStoreID int  = NULL , 
@LocationClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [ContactActivity] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
