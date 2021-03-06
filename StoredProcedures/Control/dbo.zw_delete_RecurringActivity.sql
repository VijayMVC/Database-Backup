/****** Object:  StoredProcedure [dbo].[zw_delete_RecurringActivity]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_RecurringActivity ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@Month int  = NULL , 
@Day int  = NULL , 
@Interval int  = NULL , 
@RecurrenceType int  = NULL , 
@StartDate datetime  = NULL , 
@EndType int  = NULL , 
@EndInterval int  = NULL , 
@EndDate datetime  = NULL , 
@LookAheadCount int  = NULL , 
@TemplateID int  = NULL , 
@LastScheduled datetime  = NULL , 
@NextScheduled datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [RecurringActivity] 
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
		AND [Month] = @Month
		AND [Day] = @Day
		AND [Interval] = @Interval
		AND [RecurrenceType] = @RecurrenceType
		AND [StartDate] = @StartDate
		AND [EndType] = @EndType
		AND [EndInterval] = @EndInterval
		AND [EndDate] = @EndDate
		AND [LookAheadCount] = @LookAheadCount
		AND [TemplateID] = @TemplateID
		AND [LastScheduled] = @LastScheduled
		AND [NextScheduled] = @NextScheduled

GO
