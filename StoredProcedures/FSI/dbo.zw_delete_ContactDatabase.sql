/****** Object:  StoredProcedure [dbo].[zw_delete_ContactDatabase]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_ContactDatabase ( 
@ContactID int  = NULL , 
@StoreID int  = NULL , 
@CustomerID int  = NULL , 
@FirstName varchar(20)   = NULL , 
@LastName varchar(20)   = NULL , 
@Title varchar(30)   = NULL , 
@PhoneNumber varchar(15)   = NULL , 
@PhoneExtention varchar(10)   = NULL , 
@FaxNumber varchar(15)   = NULL , 
@EmailAddress varchar(75)   = NULL , 
@PareaCode varchar(25)   = NULL , 
@FareaCode varchar(25)   = NULL , 
@P2AreaCode varchar(25)   = NULL , 
@P2PhoneNumber varchar(15)   = NULL , 
@P2PhoneType int  = NULL , 
@P3AreaCode varchar(25)   = NULL , 
@P3PhoneNumber varchar(15)   = NULL , 
@P3PhoneType int  = NULL , 
@PrimaryContact bit  = NULL , 
@ShippingContact bit  = NULL , 
@APContact bit  = NULL , 
@InvoicingContact bit  = NULL , 
@AlternateAddress varchar(MAX)   = NULL , 
@SortOrder int  = NULL , 
@BirthMonth int  = NULL , 
@BirthDay int  = NULL , 
@IsActive bit  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Contact Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ContactID] = @ContactID
		AND [StoreID] = @StoreID

GO
