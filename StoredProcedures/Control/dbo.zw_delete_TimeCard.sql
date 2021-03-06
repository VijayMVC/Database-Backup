/****** Object:  StoredProcedure [dbo].[zw_delete_TimeCard]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_TimeCard ( 
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
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
