/****** Object:  StoredProcedure [dbo].[zw_delete_Sequence]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Sequence ( 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@NextNumber int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Sequence] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
		AND [NextNumber] = @NextNumber

GO
