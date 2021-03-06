/****** Object:  StoredProcedure [dbo].[zw_upsert_PaymentTerms]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_PaymentTerms ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@TermsName [nvarchar](25)   = NULL , 
@GracePeriod int  = NULL , 
@InterestRate [decimal](18,4)  = NULL , 
@FeesBasedOnSaleDate bit  = NULL , 
@CompoundInterest bit  = NULL , 
@MessageText [nvarchar](MAX)   = NULL , 
@StatementText0To30 [nvarchar](MAX)   = NULL , 
@StatementText31To60 [nvarchar](MAX)   = NULL , 
@StatementText61To90 [nvarchar](MAX)   = NULL , 
@StatementTextOver90 [nvarchar](MAX)   = NULL , 
@PromptOnOrderSave bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [PaymentTerms] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[TermsName] = @TermsName, 
		[GracePeriod] = @GracePeriod, 
		[InterestRate] = @InterestRate, 
		[FeesBasedOnSaleDate] = @FeesBasedOnSaleDate, 
		[CompoundInterest] = @CompoundInterest, 
		[MessageText] = @MessageText, 
		[StatementText0To30] = @StatementText0To30, 
		[StatementText31To60] = @StatementText31To60, 
		[StatementText61To90] = @StatementText61To90, 
		[StatementTextOver90] = @StatementTextOver90, 
		[PromptOnOrderSave] = @PromptOnOrderSave, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [PaymentTerms]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [TermsName], [GracePeriod], [InterestRate], [FeesBasedOnSaleDate], [CompoundInterest], [MessageText], [StatementText0To30], [StatementText31To60], [StatementText61To90], [StatementTextOver90], [PromptOnOrderSave], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @TermsName, @GracePeriod, @InterestRate, @FeesBasedOnSaleDate, @CompoundInterest, @MessageText, @StatementText0To30, @StatementText31To60, @StatementText61To90, @StatementTextOver90, @PromptOnOrderSave, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
