/****** Object:  StoredProcedure [dbo].[zw_upsert_Timeclock]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_Timeclock ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@EmployeeID int  = NULL , 
@Date datetime  = NULL , 
@Open bit  = NULL , 
@TimeIn datetime  = NULL , 
@TimeOut datetime  = NULL , 
@LunchOut datetime  = NULL , 
@LunchIn datetime  = NULL , 
@Adjusted bit  = NULL , 
@AdjustedDateTime datetime  = NULL , 
@StraightTime float  = NULL , 
@OverTime float  = NULL , 
@Flags varchar(5)   = NULL , 
@SpecialDay bit  = NULL , 
@SpecialCode varchar(1)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Timeclock'
 
	 UPDATE [Timeclock] 
	 SET   
		[EmployeeID] = @EmployeeID, 
		[Date] = @Date, 
		[Open] = @Open, 
		[TimeIn] = @TimeIn, 
		[TimeOut] = @TimeOut, 
		[LunchOut] = @LunchOut, 
		[LunchIn] = @LunchIn, 
		[Adjusted] = @Adjusted, 
		[AdjustedDateTime] = @AdjustedDateTime, 
		[StraightTime] = @StraightTime, 
		[OverTime] = @OverTime, 
		[Flags] = @Flags, 
		[SpecialDay] = @SpecialDay, 
		[SpecialCode] = @SpecialCode, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Timeclock]( [ID], [StoreID], [EmployeeID], [Date], [Open], [TimeIn], [TimeOut], [LunchOut], [LunchIn], [Adjusted], [AdjustedDateTime], [StraightTime], [OverTime], [Flags], [SpecialDay], [SpecialCode], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @EmployeeID, @Date, @Open, @TimeIn, @TimeOut, @LunchOut, @LunchIn, @Adjusted, @AdjustedDateTime, @StraightTime, @OverTime, @Flags, @SpecialDay, @SpecialCode, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
