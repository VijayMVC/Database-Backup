/****** Object:  StoredProcedure [dbo].[zw_delete_INIT]    Script Date: 5/15/2018 12:09:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_INIT ( 
@OrderID int  = NULL , 
@CustomerID int  = NULL , 
@Amount float  = NULL , 
@TheDate datetime  = NULL , 
@TheTime datetime  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [INIT] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [OrderID] = @OrderID
		AND [CustomerID] = @CustomerID

GO
