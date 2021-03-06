/****** Object:  StoredProcedure [dbo].[zw_upsert_GL]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_GL ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@EntryDateTime datetime  = NULL , 
@Amount [decimal](18,4)  = NULL , 
@Classification int  = NULL , 
@IsTaxable bit  = NULL , 
@GroupID int  = NULL , 
@GLAccountID int  = NULL , 
@GLAccountClassTypeID int  = NULL , 
@AccountID int  = NULL , 
@AccountClassTypeID int  = NULL , 
@TransactionID int  = NULL , 
@TransactionClassTypeID int  = NULL , 
@TransDetailID int  = NULL , 
@TransDetailClassTypeID int  = NULL , 
@GoodsItemID int  = NULL , 
@GoodsItemClassTypeID int  = NULL , 
@Description [nvarchar](50)   = NULL , 
@DivisionID int  = NULL , 
@Notes [nvarchar](MAX)   = NULL , 
@IsModified bit  = NULL , 
@IsUser bit  = NULL , 
@TaxClassID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [GL] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[EntryDateTime] = @EntryDateTime, 
		[Amount] = @Amount, 
		[Classification] = @Classification, 
		[IsTaxable] = @IsTaxable, 
		[GroupID] = @GroupID, 
		[GLAccountID] = @GLAccountID, 
		[GLAccountClassTypeID] = @GLAccountClassTypeID, 
		[AccountID] = @AccountID, 
		[AccountClassTypeID] = @AccountClassTypeID, 
		[TransactionID] = @TransactionID, 
		[TransactionClassTypeID] = @TransactionClassTypeID, 
		[TransDetailID] = @TransDetailID, 
		[TransDetailClassTypeID] = @TransDetailClassTypeID, 
		[GoodsItemID] = @GoodsItemID, 
		[GoodsItemClassTypeID] = @GoodsItemClassTypeID, 
		[Description] = @Description, 
		[DivisionID] = @DivisionID, 
		[Notes] = @Notes, 
		[IsModified] = @IsModified, 
		[IsUser] = @IsUser, 
		[TaxClassID] = @TaxClassID, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [GL]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [EntryDateTime], [Amount], [Classification], [IsTaxable], [GroupID], [GLAccountID], [GLAccountClassTypeID], [AccountID], [AccountClassTypeID], [TransactionID], [TransactionClassTypeID], [TransDetailID], [TransDetailClassTypeID], [GoodsItemID], [GoodsItemClassTypeID], [Description], [DivisionID], [Notes], [IsModified], [IsUser], [TaxClassID], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @EntryDateTime, @Amount, @Classification, @IsTaxable, @GroupID, @GLAccountID, @GLAccountClassTypeID, @AccountID, @AccountClassTypeID, @TransactionID, @TransactionClassTypeID, @TransDetailID, @TransDetailClassTypeID, @GoodsItemID, @GoodsItemClassTypeID, @Description, @DivisionID, @Notes, @IsModified, @IsUser, @TaxClassID, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
