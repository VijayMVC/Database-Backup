/****** Object:  StoredProcedure [dbo].[zw_upsert_EmployeeGroup]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_EmployeeGroup ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@Notes [nvarchar](MAX)   = NULL , 
@GroupName [nvarchar](25)   = NULL , 
@GroupCode [nvarchar](25)   = NULL , 
@EmailAddress [nvarchar](50)   = NULL , 
@MainPhoneNumberID int  = NULL , 
@MainFaxNumberID int  = NULL , 
@AddressID int  = NULL , 
@ManagerID int  = NULL , 
@PricingPlanID int  = NULL , 
@TaxClassID int  = NULL , 
@PrintAsName [nvarchar](75)   = NULL , 
@ParentID int  = NULL , 
@QPHomeListID int  = NULL , 
@QPHomeListStoreID int  = NULL , 
@QPTransListID int  = NULL , 
@QPTransListStoreID int  = NULL , 
@QPServiceListID int  = NULL , 
@QPServiceListStoreID int  = NULL , 
@IsDivision bit  = NULL , 
@DivisionName varchar(25)  = NULL , 
@PrimaryNumber varchar(75)  = NULL , 
@PriNumberTypeID int  = NULL , 
@PriNumberTypeText varchar(50)  = NULL , 
@SecondaryNumber varchar(75)  = NULL , 
@SecNumberTypeID int  = NULL , 
@SecNumberTypeText varchar(50)  = NULL , 
@DefaultHomeScreen int  = NULL , 
@ThirdNumber varchar(75)  = NULL , 
@ThirdNumberTypeID int  = NULL , 
@ThirdNumberTypeText varchar(50)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [EmployeeGroup] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[Notes] = @Notes, 
		[GroupName] = @GroupName, 
		[GroupCode] = @GroupCode, 
		[EmailAddress] = @EmailAddress, 
		[MainPhoneNumberID] = @MainPhoneNumberID, 
		[MainFaxNumberID] = @MainFaxNumberID, 
		[AddressID] = @AddressID, 
		[ManagerID] = @ManagerID, 
		[PricingPlanID] = @PricingPlanID, 
		[TaxClassID] = @TaxClassID, 
		[PrintAsName] = @PrintAsName, 
		[ParentID] = @ParentID, 
		[QPHomeListID] = @QPHomeListID, 
		[QPHomeListStoreID] = @QPHomeListStoreID, 
		[QPTransListID] = @QPTransListID, 
		[QPTransListStoreID] = @QPTransListStoreID, 
		[QPServiceListID] = @QPServiceListID, 
		[QPServiceListStoreID] = @QPServiceListStoreID, 
		[IsDivision] = @IsDivision, 
		[DivisionName] = @DivisionName, 
		[PrimaryNumber] = @PrimaryNumber, 
		[PriNumberTypeID] = @PriNumberTypeID, 
		[PriNumberTypeText] = @PriNumberTypeText, 
		[SecondaryNumber] = @SecondaryNumber, 
		[SecNumberTypeID] = @SecNumberTypeID, 
		[SecNumberTypeText] = @SecNumberTypeText, 
		[DefaultHomeScreen] = @DefaultHomeScreen, 
		[ThirdNumber] = @ThirdNumber, 
		[ThirdNumberTypeID] = @ThirdNumberTypeID, 
		[ThirdNumberTypeText] = @ThirdNumberTypeText, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [EmployeeGroup]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [Notes], [GroupName], [GroupCode], [EmailAddress], [MainPhoneNumberID], [MainFaxNumberID], [AddressID], [ManagerID], [PricingPlanID], [TaxClassID], [PrintAsName], [ParentID], [QPHomeListID], [QPHomeListStoreID], [QPTransListID], [QPTransListStoreID], [QPServiceListID], [QPServiceListStoreID], [IsDivision], [DivisionName], [PrimaryNumber], [PriNumberTypeID], [PriNumberTypeText], [SecondaryNumber], [SecNumberTypeID], [SecNumberTypeText], [DefaultHomeScreen], [ThirdNumber], [ThirdNumberTypeID], [ThirdNumberTypeText], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @Notes, @GroupName, @GroupCode, @EmailAddress, @MainPhoneNumberID, @MainFaxNumberID, @AddressID, @ManagerID, @PricingPlanID, @TaxClassID, @PrintAsName, @ParentID, @QPHomeListID, @QPHomeListStoreID, @QPTransListID, @QPTransListStoreID, @QPServiceListID, @QPServiceListStoreID, @IsDivision, @DivisionName, @PrimaryNumber, @PriNumberTypeID, @PriNumberTypeText, @SecondaryNumber, @SecNumberTypeID, @SecNumberTypeText, @DefaultHomeScreen, @ThirdNumber, @ThirdNumberTypeID, @ThirdNumberTypeText, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
