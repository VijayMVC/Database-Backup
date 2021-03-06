/****** Object:  StoredProcedure [dbo].[zw_upsert_ContactDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_ContactDatabase ( 
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
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Contact Database'
 
	 UPDATE [Contact Database] 
	 SET   
		[CustomerID] = @CustomerID, 
		[FirstName] = @FirstName, 
		[LastName] = @LastName, 
		[Title] = @Title, 
		[PhoneNumber] = @PhoneNumber, 
		[PhoneExtention] = @PhoneExtention, 
		[FaxNumber] = @FaxNumber, 
		[EmailAddress] = @EmailAddress, 
		[PareaCode] = @PareaCode, 
		[FareaCode] = @FareaCode, 
		[P2AreaCode] = @P2AreaCode, 
		[P2PhoneNumber] = @P2PhoneNumber, 
		[P2PhoneType] = @P2PhoneType, 
		[P3AreaCode] = @P3AreaCode, 
		[P3PhoneNumber] = @P3PhoneNumber, 
		[P3PhoneType] = @P3PhoneType, 
		[PrimaryContact] = @PrimaryContact, 
		[ShippingContact] = @ShippingContact, 
		[APContact] = @APContact, 
		[InvoicingContact] = @InvoicingContact, 
		[AlternateAddress] = @AlternateAddress, 
		[SortOrder] = @SortOrder, 
		[BirthMonth] = @BirthMonth, 
		[BirthDay] = @BirthDay, 
		[IsActive] = @IsActive, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ContactID] = @ContactID
		AND [StoreID] = @StoreID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Contact Database]( [ContactID], [StoreID], [CustomerID], [FirstName], [LastName], [Title], [PhoneNumber], [PhoneExtention], [FaxNumber], [EmailAddress], [PareaCode], [FareaCode], [P2AreaCode], [P2PhoneNumber], [P2PhoneType], [P3AreaCode], [P3PhoneNumber], [P3PhoneType], [PrimaryContact], [ShippingContact], [APContact], [InvoicingContact], [AlternateAddress], [SortOrder], [BirthMonth], [BirthDay], [IsActive], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ContactID, @StoreID, @CustomerID, @FirstName, @LastName, @Title, @PhoneNumber, @PhoneExtention, @FaxNumber, @EmailAddress, @PareaCode, @FareaCode, @P2AreaCode, @P2PhoneNumber, @P2PhoneType, @P3AreaCode, @P3PhoneNumber, @P3PhoneType, @PrimaryContact, @ShippingContact, @APContact, @InvoicingContact, @AlternateAddress, @SortOrder, @BirthMonth, @BirthDay, @IsActive, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
