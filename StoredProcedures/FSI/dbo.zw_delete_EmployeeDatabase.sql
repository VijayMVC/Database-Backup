/****** Object:  StoredProcedure [dbo].[zw_delete_EmployeeDatabase]    Script Date: 5/15/2018 12:09:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_EmployeeDatabase ( 
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
 
	 UPDATE [Employee Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [EmployeeID] = @EmployeeID
		AND [StoreID] = @StoreID

GO
