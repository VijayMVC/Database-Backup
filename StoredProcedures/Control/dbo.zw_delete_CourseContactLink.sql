/****** Object:  StoredProcedure [dbo].[zw_delete_CourseContactLink]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_delete_CourseContactLink] ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@AccountID int  = NULL , 
@ContactID int  = NULL , 
@OrderID int  = NULL , 
@TransactionNumber int  = NULL , 
@TransDetailID int  = NULL , 
@CourseEventID int  = NULL , 
@StatusID int  = NULL , 
@Enrolled bit  = NULL , 
@CourseID int  = NULL , 
@CourseTermID int  = NULL , 
@StudentType int  = NULL , 
@CanMakeUp bit  = NULL , 
@MakeupEventID int  = NULL , 
@SortIndex float  = NULL , 
@ContractPeriodID int  = NULL , 
@ContractStartDate datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [CourseContactLink] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID


GO
