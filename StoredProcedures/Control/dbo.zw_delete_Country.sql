/****** Object:  StoredProcedure [dbo].[zw_delete_Country]    Script Date: 5/15/2018 12:09:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_Country ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](50)   = NULL , 
@ModifiedByComputer [nvarchar](50)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ParentID int  = NULL , 
@ParentClassTypeID int  = NULL , 
@Country [nvarchar](40)   = NULL , 
@CountryShortName [nvarchar](15)   = NULL , 
@CountryCode int  = NULL , 
@PhoneFormatString [nvarchar](30)   = NULL , 
@PhoneTemplate [nvarchar](50)   = NULL , 
@AddressFormatString [nvarchar](30)   = NULL , 
@AreaCodeDigits int  = NULL , 
@ZipMaxDigits int  = NULL , 
@ZipShortDigits int  = NULL , 
@TranslationLanguage [nvarchar](30)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Country] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
