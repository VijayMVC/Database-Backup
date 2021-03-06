/****** Object:  StoredProcedure [dbo].[zw_delete_GLDatabase]    Script Date: 5/15/2018 12:09:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_GLDatabase ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@DateTime datetime  = NULL , 
@OrderID int  = NULL , 
@CustomerID int  = NULL , 
@RecordID int  = NULL , 
@AccountCode int  = NULL , 
@UserID int  = NULL , 
@Amount float  = NULL , 
@Description varchar(25)   = NULL , 
@Closed bit  = NULL , 
@ClosedDate datetime  = NULL , 
@Exported bit  = NULL , 
@ExportedDate datetime  = NULL , 
@ExportedBatch int  = NULL , 
@EnteredByID int  = NULL , 
@SubAccountCode int  = NULL , 
@Taxable bit  = NULL , 
@Consolidated bit  = NULL , 
@Category int  = NULL , 
@RoyaltyGroupID int  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@OrderDetailID int  = NULL , 
@ProductID int  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [GL Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID

GO
