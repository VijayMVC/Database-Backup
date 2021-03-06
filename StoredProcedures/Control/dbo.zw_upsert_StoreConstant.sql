/****** Object:  StoredProcedure [dbo].[zw_upsert_StoreConstant]    Script Date: 5/15/2018 12:09:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_StoreConstant ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ItemText [nvarchar](50)   = NULL , 
@ConstantValue [decimal](18,4)  = NULL , 
@CategoryID int  = NULL , 
@CategoryStoreID int  = NULL , 
@CategoryClassTypeID int  = NULL , 
@ItemProperties [nvarchar](MAX)   = NULL , 
@UnitID int  = NULL , 
@Formula [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [StoreConstant] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[ItemText] = @ItemText, 
		[ConstantValue] = @ConstantValue, 
		[CategoryID] = @CategoryID, 
		[CategoryStoreID] = @CategoryStoreID, 
		[CategoryClassTypeID] = @CategoryClassTypeID, 
		[ItemProperties] = @ItemProperties, 
		[UnitID] = @UnitID, 
		[Formula] = @Formula, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [StoreConstant]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [ItemText], [ConstantValue], [CategoryID], [CategoryStoreID], [CategoryClassTypeID], [ItemProperties], [UnitID], [Formula], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @ItemText, @ConstantValue, @CategoryID, @CategoryStoreID, @CategoryClassTypeID, @ItemProperties, @UnitID, @Formula, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
