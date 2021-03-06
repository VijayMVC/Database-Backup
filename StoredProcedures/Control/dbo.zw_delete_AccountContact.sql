/****** Object:  StoredProcedure [dbo].[zw_delete_AccountContact]    Script Date: 5/15/2018 12:09:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_AccountContact ( 
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
@AccountID int  = NULL , 
@IsPrimaryContact bit  = NULL , 
@IsAccountingContact bit  = NULL , 
@BillingAddressID int  = NULL , 
@ShippingAddressID int  = NULL , 
@BirthDateMonth int  = NULL , 
@BirthDateDay int  = NULL , 
@DefaultPaymentExpDate datetime  = NULL , 
@DefaultPaymentTrackingNumber [nvarchar](25)   = NULL , 
@DefaultPaymentNameOnCard [nvarchar](25)   = NULL , 
@DefaultPaymentTypeID int  = NULL , 
@CCBillingAddress [nvarchar](50)   = NULL , 
@DefaultPaymentVCode [nvarchar](10)   = NULL , 
@UserID int  = NULL , 
@SalespersonID1 int  = NULL , 
@SalespersonID2 int  = NULL , 
@SalespersonID3 int  = NULL , 
@UseCompanySalespeople bit  = NULL , 
@IsCCNumEncrypt bit  = NULL , 
@DisplayNumber varchar(50)  = NULL , 
@BirthDate datetime  = NULL , 
@IsVCodeEncrypted bit  = NULL , 
@PrimaryNumber varchar(75)  = NULL , 
@PriNumberTypeID int  = NULL , 
@PriNumberTypeText varchar(50)  = NULL , 
@SecondaryNumber varchar(75)  = NULL , 
@SecNumberTypeID int  = NULL , 
@SecNumberTypeText varchar(50)  = NULL , 
@PaymentAddressID int  = NULL , 
@CCSwiped bit  = NULL , 
@SendBillingAddress bit  = NULL , 
@IDNumber varchar(50)  = NULL , 
@ImageID int  = NULL , 
@MiddleName varchar(50)  = NULL , 
@ContactType int  = NULL , 
@GenderType int  = NULL , 
@NumOfMakeups int  = NULL , 
@ThirdNumber varchar(75)  = NULL , 
@ThirdNumberTypeID int  = NULL , 
@ThirdNumberTypeText varchar(50)  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [AccountContact] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
