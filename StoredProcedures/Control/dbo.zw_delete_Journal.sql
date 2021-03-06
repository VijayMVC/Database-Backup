/****** Object:  StoredProcedure [dbo].[zw_delete_Journal]    Script Date: 5/15/2018 12:09:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Journal ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@EmployeeID int  = NULL , 
@JournalActivityType int  = NULL , 
@JournalActivityText [nvarchar](25)   = NULL , 
@Description [nvarchar](50)   = NULL , 
@Notes [nvarchar](MAX)   = NULL , 
@StartDateTime datetime  = NULL , 
@EndDateTime datetime  = NULL , 
@TotalTime datetime  = NULL , 
@ScheduledDateTime datetime  = NULL , 
@CompletedByID int  = NULL , 
@CompletedDateTime datetime  = NULL , 
@IsSummary bit  = NULL , 
@IsDetail bit  = NULL , 
@SummaryID int  = NULL , 
@SummaryClassTypeID int  = NULL , 
@SummaryAmount [decimal](18,4)  = NULL , 
@DetailAmount [decimal](18,4)  = NULL , 
@StartGLGroupID int  = NULL , 
@EndGLGroupID int  = NULL , 
@AccountID int  = NULL , 
@AccountClassTypeID int  = NULL , 
@ContactID int  = NULL , 
@ContactClassTypeID int  = NULL , 
@TransactionID int  = NULL , 
@TransactionClassTypeID int  = NULL , 
@IsVoided bit  = NULL , 
@VoidedDateTime datetime  = NULL , 
@VoidedEntryID int  = NULL , 
@VoidedEntryClassTypeID int  = NULL , 
@VoidedReason [nvarchar](MAX)   = NULL , 
@QueryStartDateTime datetime  = NULL , 
@QueryEndDateTime datetime  = NULL , 
@ReminderDateTime datetime  = NULL , 
@ReminderPrompt bit  = NULL , 
@PartID int  = NULL , 
@ActivityType int  = NULL , 
@ActivityTypeText [nvarchar](50)   = NULL , 
@IsBillable bit  = NULL , 
@BillableDateTime datetime  = NULL , 
@UseActualTime bit  = NULL , 
@BillingNotes [nvarchar](MAX)   = NULL , 
@BillingType int  = NULL , 
@TotalBilledTime float  = NULL , 
@RecurringActivityID int  = NULL , 
@LinkID int  = NULL , 
@LinkStoreID int  = NULL , 
@LinkClassTypeID int  = NULL , 
@SpecialCode varchar(25)  = NULL , 
@DivisionID int  = NULL , 
@HasCalendarLinks bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Journal] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
