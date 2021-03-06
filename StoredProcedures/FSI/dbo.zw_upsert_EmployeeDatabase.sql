/****** Object:  StoredProcedure [dbo].[zw_upsert_EmployeeDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_EmployeeDatabase ( 
@EmployeeID int  = NULL , 
@StoreID int  = NULL , 
@FirstName varchar(15)   = NULL , 
@LastName varchar(15)   = NULL , 
@SocialSecurityNumber varchar(16)   = NULL , 
@Birthdate datetime  = NULL , 
@HireDate datetime  = NULL , 
@TerminationDate datetime  = NULL , 
@Title varchar(20)   = NULL , 
@PhoneNumber varchar(20)   = NULL , 
@PhoneExtention varchar(10)   = NULL , 
@FaxNumber varchar(10)   = NULL , 
@EmailAddress varchar(75)   = NULL , 
@EmployeeStoreID int  = NULL , 
@Department varchar(15)   = NULL , 
@Address varchar(30)   = NULL , 
@City varchar(15)   = NULL , 
@State varchar(25)   = NULL , 
@Zip varchar(25)   = NULL , 
@HomePhoneNumber varchar(20)   = NULL , 
@PagerNumber varchar(30)   = NULL , 
@CellularPhoneNumber varchar(20)   = NULL , 
@CurrentStatus smallint  = NULL , 
@PricingRatio float  = NULL , 
@ReportsToID int  = NULL , 
@SalesPerson bit  = NULL , 
@CommissionSales bit  = NULL , 
@CommPaidOnPickedUp bit  = NULL , 
@CommRateProdLoc1 float  = NULL , 
@CommRateProdLoc2 float  = NULL , 
@CommRateProdLoc3 float  = NULL , 
@Password varchar(8)   = NULL , 
@SecurityRights varbinary(4)  = NULL , 
@Active bit  = NULL , 
@PareaCode varchar(25)   = NULL , 
@FareaCode varchar(25)   = NULL , 
@HPareaCode varchar(25)   = NULL , 
@CPareaCode varchar(25)   = NULL , 
@PGareaCode varchar(25)   = NULL , 
@EnteredByList bit  = NULL , 
@TimeClockList bit  = NULL , 
@EmergencyContact varchar(25)   = NULL , 
@EmergencyPhone varchar(20)   = NULL , 
@EmployeePhoto image  = NULL , 
@EmployeeSignature image  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@AllowFinInfo bit  = NULL , 
@CanVoidRefundOrder bit  = NULL , 
@CanVoidRefundCredit bit  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Employee Database'
 
	 UPDATE [Employee Database] 
	 SET   
		[FirstName] = @FirstName, 
		[LastName] = @LastName, 
		[SocialSecurityNumber] = @SocialSecurityNumber, 
		[Birthdate] = @Birthdate, 
		[HireDate] = @HireDate, 
		[TerminationDate] = @TerminationDate, 
		[Title] = @Title, 
		[PhoneNumber] = @PhoneNumber, 
		[PhoneExtention] = @PhoneExtention, 
		[FaxNumber] = @FaxNumber, 
		[EmailAddress] = @EmailAddress, 
		[EmployeeStoreID] = @EmployeeStoreID, 
		[Department] = @Department, 
		[Address] = @Address, 
		[City] = @City, 
		[State] = @State, 
		[Zip] = @Zip, 
		[HomePhoneNumber] = @HomePhoneNumber, 
		[PagerNumber] = @PagerNumber, 
		[CellularPhoneNumber] = @CellularPhoneNumber, 
		[CurrentStatus] = @CurrentStatus, 
		[PricingRatio] = @PricingRatio, 
		[ReportsToID] = @ReportsToID, 
		[SalesPerson] = @SalesPerson, 
		[CommissionSales] = @CommissionSales, 
		[CommPaidOnPickedUp] = @CommPaidOnPickedUp, 
		[CommRateProdLoc1] = @CommRateProdLoc1, 
		[CommRateProdLoc2] = @CommRateProdLoc2, 
		[CommRateProdLoc3] = @CommRateProdLoc3, 
		[Password] = @Password, 
		[SecurityRights] = @SecurityRights, 
		[Active] = @Active, 
		[PareaCode] = @PareaCode, 
		[FareaCode] = @FareaCode, 
		[HPareaCode] = @HPareaCode, 
		[CPareaCode] = @CPareaCode, 
		[PGareaCode] = @PGareaCode, 
		[EnteredByList] = @EnteredByList, 
		[TimeClockList] = @TimeClockList, 
		[EmergencyContact] = @EmergencyContact, 
		[EmergencyPhone] = @EmergencyPhone, 
		[EmployeePhoto] = @EmployeePhoto, 
		[EmployeeSignature] = @EmployeeSignature, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[AllowFinInfo] = @AllowFinInfo, 
		[CanVoidRefundOrder] = @CanVoidRefundOrder, 
		[CanVoidRefundCredit] = @CanVoidRefundCredit, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [EmployeeID] = @EmployeeID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Employee Database]( [EmployeeID], [StoreID], [FirstName], [LastName], [SocialSecurityNumber], [Birthdate], [HireDate], [TerminationDate], [Title], [PhoneNumber], [PhoneExtention], [FaxNumber], [EmailAddress], [EmployeeStoreID], [Department], [Address], [City], [State], [Zip], [HomePhoneNumber], [PagerNumber], [CellularPhoneNumber], [CurrentStatus], [PricingRatio], [ReportsToID], [SalesPerson], [CommissionSales], [CommPaidOnPickedUp], [CommRateProdLoc1], [CommRateProdLoc2], [CommRateProdLoc3], [Password], [SecurityRights], [Active], [PareaCode], [FareaCode], [HPareaCode], [CPareaCode], [PGareaCode], [EnteredByList], [TimeClockList], [EmergencyContact], [EmergencyPhone], [EmployeePhoto], [EmployeeSignature], [ModifiedByComputer], [ModifiedDate], [AllowFinInfo], [CanVoidRefundOrder], [CanVoidRefundCredit], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @EmployeeID, @StoreID, @FirstName, @LastName, @SocialSecurityNumber, @Birthdate, @HireDate, @TerminationDate, @Title, @PhoneNumber, @PhoneExtention, @FaxNumber, @EmailAddress, @EmployeeStoreID, @Department, @Address, @City, @State, @Zip, @HomePhoneNumber, @PagerNumber, @CellularPhoneNumber, @CurrentStatus, @PricingRatio, @ReportsToID, @SalesPerson, @CommissionSales, @CommPaidOnPickedUp, @CommRateProdLoc1, @CommRateProdLoc2, @CommRateProdLoc3, @Password, @SecurityRights, @Active, @PareaCode, @FareaCode, @HPareaCode, @CPareaCode, @PGareaCode, @EnteredByList, @TimeClockList, @EmergencyContact, @EmergencyPhone, @EmployeePhoto, @EmployeeSignature, @ModifiedByComputer, @ModifiedDate, @AllowFinInfo, @CanVoidRefundOrder, @CanVoidRefundCredit, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
