/****** Object:  StoredProcedure [dbo].[zw_upsert_CustomRange]    Script Date: 5/15/2018 12:09:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE [dbo].[zw_upsert_CustomRange] ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@RangeName varchar(50)  = NULL , 
@SortIndex float  = NULL , 
@StartDateTime datetime  = NULL , 
@StartDTDif datetime  = NULL , 
@StartDTFixed bit  = NULL , 
@FlexStartType int  = NULL , 
@StartRangeType int  = NULL , 
@EndDateTime datetime  = NULL , 
@EndDTDif datetime  = NULL , 
@EndDTFixed bit  = NULL , 
@FlexEndType int  = NULL , 
@EndRangeType int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [CustomRange] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[RangeName] = @RangeName, 
		[SortIndex] = @SortIndex, 
		[StartDateTime] = @StartDateTime, 
		[StartDTDif] = @StartDTDif, 
		[StartDTFixed] = @StartDTFixed, 
		[FlexStartType] = @FlexStartType, 
		[StartRangeType] = @StartRangeType, 
		[EndDateTime] = @EndDateTime, 
		[EndDTDif] = @EndDTDif, 
		[EndDTFixed] = @EndDTFixed, 
		[FlexEndType] = @FlexEndType, 
		[EndRangeType] = @EndRangeType, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [CustomRange]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [RangeName], [SortIndex], [StartDateTime], [StartDTDif], [StartDTFixed], [FlexStartType], [StartRangeType], [EndDateTime], [EndDTDif], [EndDTFixed], [FlexEndType], [EndRangeType], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @RangeName, @SortIndex, @StartDateTime, @StartDTDif, @StartDTFixed, @FlexStartType, @StartRangeType, @EndDateTime, @EndDTDif, @EndDTFixed, @FlexEndType, @EndRangeType, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 


GO
