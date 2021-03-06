/****** Object:  StoredProcedure [dbo].[zw_delete_Element]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Element ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@ElementName [nvarchar](50)   = NULL , 
@Description [nvarchar](50)   = NULL , 
@SortIndex float  = NULL , 
@LinkID int  = NULL , 
@LinkStoreID int  = NULL , 
@LinkClassTypeID int  = NULL , 
@StartDate datetime  = NULL , 
@EndDate datetime  = NULL , 
@ItemPrefix varchar(25)  = NULL , 
@IncomeID int  = NULL , 
@IncomeStoreID int  = NULL , 
@IncomeClassTypeID int  = NULL , 
@FamilyID int  = NULL , 
@FamilyStoreID int  = NULL , 
@FamilyClassTypeID int  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Element] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
