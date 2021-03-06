/****** Object:  StoredProcedure [dbo].[zw_upsert_TimeCard]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_TimeCard ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@StatusID int  = NULL , 
@StatusName [nvarchar](25)   = NULL , 
@AdjustedByID int  = NULL , 
@ManuallyAdjusted bit  = NULL , 
@TransDetailID int  = NULL , 
@TransDetailStoreID int  = NULL , 
@TransDetailClassTypeID int  = NULL , 
@TransPartID int  = NULL , 
@TransPartStoreID int  = NULL , 
@TransPartClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [TimeCard] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[StatusID] = @StatusID, 
		[StatusName] = @StatusName, 
		[AdjustedByID] = @AdjustedByID, 
		[ManuallyAdjusted] = @ManuallyAdjusted, 
		[TransDetailID] = @TransDetailID, 
		[TransDetailStoreID] = @TransDetailStoreID, 
		[TransDetailClassTypeID] = @TransDetailClassTypeID, 
		[TransPartID] = @TransPartID, 
		[TransPartStoreID] = @TransPartStoreID, 
		[TransPartClassTypeID] = @TransPartClassTypeID, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [TimeCard]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [StatusID], [StatusName], [AdjustedByID], [ManuallyAdjusted], [TransDetailID], [TransDetailStoreID], [TransDetailClassTypeID], [TransPartID], [TransPartStoreID], [TransPartClassTypeID], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @StatusID, @StatusName, @AdjustedByID, @ManuallyAdjusted, @TransDetailID, @TransDetailStoreID, @TransDetailClassTypeID, @TransPartID, @TransPartStoreID, @TransPartClassTypeID, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
