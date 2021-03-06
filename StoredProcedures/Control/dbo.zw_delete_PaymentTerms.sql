/****** Object:  StoredProcedure [dbo].[zw_delete_PaymentTerms]    Script Date: 5/15/2018 12:09:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_PaymentTerms ( 
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
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
