/****** Object:  StoredProcedure [dbo].[zw_delete_ReportMenuItem]    Script Date: 5/15/2018 12:09:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_ReportMenuItem ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser varchar(25)  = NULL , 
@ModifiedByComputer varchar(25)  = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@MenuItemName varchar(40)  = NULL , 
@Description [nvarchar](MAX)   = NULL , 
@UseSystemReport bit  = NULL , 
@FileName [nvarchar](MAX)   = NULL , 
@ParentID int  = NULL , 
@ParentStoreID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@SystemReportID int  = NULL , 
@SystemReportClassTypeID int  = NULL , 
@TemplateID int  = NULL , 
@TemplateStoreID int  = NULL , 
@CriteriaOptions [nvarchar](MAX)   = NULL , 
@DeviceOptions [nvarchar](MAX)   = NULL , 
@SortingOptions [nvarchar](MAX)   = NULL , 
@OtherOptions [nvarchar](MAX)   = NULL , 
@SecurityRightID int  = NULL , 
@SecurityRightClassTypeID int  = NULL , 
@ChildSortOrder [nvarchar](MAX)   = NULL , 
@AllowGroupPrint bit  = NULL , 
@Shortcut varchar(20)  = NULL , 
@ChangedShowOnMenu varchar(1)  = NULL , 
@PrintOption int  = NULL , 
@HasSeparator varchar(1)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [ReportMenuItem] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
