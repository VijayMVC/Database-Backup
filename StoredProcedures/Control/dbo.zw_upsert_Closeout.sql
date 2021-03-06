/****** Object:  StoredProcedure [dbo].[zw_upsert_Closeout]    Script Date: 5/15/2018 12:09:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_Closeout ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@CloseoutType int  = NULL , 
@CategoryID int  = NULL , 
@CloseoutTypeText [nvarchar](25)   = NULL , 
@CloseOutPeriod int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Closeout] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[CloseoutType] = @CloseoutType, 
		[CategoryID] = @CategoryID, 
		[CloseoutTypeText] = @CloseoutTypeText, 
		[CloseOutPeriod] = @CloseOutPeriod, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Closeout]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [CloseoutType], [CategoryID], [CloseoutTypeText], [CloseOutPeriod], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @CloseoutType, @CategoryID, @CloseoutTypeText, @CloseOutPeriod, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
