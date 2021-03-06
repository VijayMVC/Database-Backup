/****** Object:  StoredProcedure [dbo].[zw_upsert_RecurringActivity]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_RecurringActivity ( 
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
 
     INSERT INTO [RecurringActivity]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [Month], [Day], [Interval], [RecurrenceType], [StartDate], [EndType], [EndInterval], [EndDate], [LookAheadCount], [TemplateID], [LastScheduled], [NextScheduled], [zw_franchise_id], [sys_di], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @Month, @Day, @Interval, @RecurrenceType, @StartDate, @EndType, @EndInterval, @EndDate, @LookAheadCount, @TemplateID, @LastScheduled, @NextScheduled, @zw_franchise_id, getdate(), 1 )

GO
