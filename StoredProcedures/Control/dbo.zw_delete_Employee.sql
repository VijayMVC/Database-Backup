/****** Object:  StoredProcedure [dbo].[zw_delete_Employee]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Employee ( 
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
@FirstName [nvarchar](25)   = NULL , 
@LastName [nvarchar](25)   = NULL , 
@Title [nvarchar](10)   = NULL , 
@Position [nvarchar](25)   = NULL , 
@EmailAddress [nvarchar](50)   = NULL , 
@MainPhoneNumberID int  = NULL , 
@MainFaxNumberID int  = NULL , 
@AddressID int  = NULL , 
@Birthdate datetime  = NULL , 
@HireDate datetime  = NULL , 
@TerminationDate datetime  = NULL , 
@Department [nvarchar](50)   = NULL , 
@EmployeeStatus int  = NULL , 
@IsSalesperson bit  = NULL , 
@IsWorkerResource bit  = NULL , 
@ReportsToID int  = NULL , 
@TaxNumber [nvarchar](25)   = NULL , 
@UserID int  = NULL , 
@PricingLevel float  = NULL , 
@DiscountLevel float  = NULL , 
@GroupID int  = NULL , 
@ShowOnTimeClock bit  = NULL , 
@ShowOnActivityManager bit  = NULL , 
@PricingLevelID int  = NULL , 
@CommissionPlanID int  = NULL , 
@ReportTemplateID int  = NULL , 
@ReportTemplateStoreID int  = NULL , 
@MailAddressID int  = NULL , 
@IsTaxNumEncrypt bit  = NULL , 
@SignatureID int  = NULL , 
@PerImageID int  = NULL , 
@QPHomeListID int  = NULL , 
@QPHomeListStoreID int  = NULL , 
@QPTransListID int  = NULL , 
@QPTransListStoreID int  = NULL , 
@QPServiceListID int  = NULL , 
@QPServiceListStoreID int  = NULL , 
@ShowOnLineItems bit  = NULL , 
@PrimaryNumber varchar(75)  = NULL , 
@PriNumberTypeID int  = NULL , 
@PriNumberTypeText varchar(50)  = NULL , 
@SecondaryNumber varchar(75)  = NULL , 
@SecNumberTypeID int  = NULL , 
@SecNumberTypeText varchar(50)  = NULL , 
@IsInstructor bit  = NULL , 
@DefaultHomeScreen int  = NULL , 
@ThirdNumber varchar(75)  = NULL , 
@ThirdNumberTypeID int  = NULL , 
@ThirdNumberTypeText varchar(50)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Employee] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
