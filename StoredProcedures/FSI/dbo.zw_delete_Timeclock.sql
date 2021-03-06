/****** Object:  StoredProcedure [dbo].[zw_delete_Timeclock]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_Timeclock ( 
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
 
	 UPDATE [Timeclock] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID

GO
