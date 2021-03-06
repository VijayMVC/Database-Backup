/****** Object:  StoredProcedure [dbo].[zw_upsert_CourseContactLink]    Script Date: 5/15/2018 12:09:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_upsert_CourseContactLink] ( 
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
		[StoreID] = @StoreID, 
		[ClassTypeID] = @ClassTypeID, 
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[AccountID] = @AccountID, 
		[ContactID] = @ContactID, 
		[OrderID] = @OrderID, 
		[TransactionNumber] = @TransactionNumber, 
		[TransDetailID] = @TransDetailID, 
		[CourseEventID] = @CourseEventID, 
		[StatusID] = @StatusID, 
		[Enrolled] = @Enrolled, 
		[CourseID] = @CourseID, 
		[CourseTermID] = @CourseTermID, 
		[StudentType] = @StudentType, 
		[CanMakeUp] = @CanMakeUp, 
		[MakeupEventID] = @MakeupEventID, 
		[SortIndex] = @SortIndex, 
		[ContractPeriodID] = @ContractPeriodID, 
		[ContractStartDate] = @ContractStartDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [CourseContactLink]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [AccountID], [ContactID], [OrderID], [TransactionNumber], [TransDetailID], [CourseEventID], [StatusID], [Enrolled], [CourseID], [CourseTermID], [StudentType], [CanMakeUp], [MakeupEventID], [SortIndex], [ContractPeriodID], [ContractStartDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @AccountID, @ContactID, @OrderID, @TransactionNumber, @TransDetailID, @CourseEventID, @StatusID, @Enrolled, @CourseID, @CourseTermID, @StudentType, @CanMakeUp, @MakeupEventID, @SortIndex, @ContractPeriodID, @ContractStartDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 


GO
