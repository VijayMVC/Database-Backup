/****** Object:  StoredProcedure [dbo].[zw_upsert_ReportMenuItem]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_ReportMenuItem ( 
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
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[MenuItemName] = @MenuItemName, 
		[Description] = @Description, 
		[UseSystemReport] = @UseSystemReport, 
		[FileName] = @FileName, 
		[ParentID] = @ParentID, 
		[ParentStoreID] = @ParentStoreID, 
		[ParentClassTypeID] = @ParentClassTypeID, 
		[SystemReportID] = @SystemReportID, 
		[SystemReportClassTypeID] = @SystemReportClassTypeID, 
		[TemplateID] = @TemplateID, 
		[TemplateStoreID] = @TemplateStoreID, 
		[CriteriaOptions] = @CriteriaOptions, 
		[DeviceOptions] = @DeviceOptions, 
		[SortingOptions] = @SortingOptions, 
		[OtherOptions] = @OtherOptions, 
		[SecurityRightID] = @SecurityRightID, 
		[SecurityRightClassTypeID] = @SecurityRightClassTypeID, 
		[ChildSortOrder] = @ChildSortOrder, 
		[AllowGroupPrint] = @AllowGroupPrint, 
		[Shortcut] = @Shortcut, 
		[ChangedShowOnMenu] = @ChangedShowOnMenu, 
		[PrintOption] = @PrintOption, 
		[HasSeparator] = @HasSeparator, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [ReportMenuItem]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [MenuItemName], [Description], [UseSystemReport], [FileName], [ParentID], [ParentStoreID], [ParentClassTypeID], [SystemReportID], [SystemReportClassTypeID], [TemplateID], [TemplateStoreID], [CriteriaOptions], [DeviceOptions], [SortingOptions], [OtherOptions], [SecurityRightID], [SecurityRightClassTypeID], [ChildSortOrder], [AllowGroupPrint], [Shortcut], [ChangedShowOnMenu], [PrintOption], [HasSeparator], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @MenuItemName, @Description, @UseSystemReport, @FileName, @ParentID, @ParentStoreID, @ParentClassTypeID, @SystemReportID, @SystemReportClassTypeID, @TemplateID, @TemplateStoreID, @CriteriaOptions, @DeviceOptions, @SortingOptions, @OtherOptions, @SecurityRightID, @SecurityRightClassTypeID, @ChildSortOrder, @AllowGroupPrint, @Shortcut, @ChangedShowOnMenu, @PrintOption, @HasSeparator, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
