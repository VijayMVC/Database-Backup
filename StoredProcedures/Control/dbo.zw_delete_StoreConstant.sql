/****** Object:  StoredProcedure [dbo].[zw_delete_StoreConstant]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_StoreConstant ( 
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
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
