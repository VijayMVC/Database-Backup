/****** Object:  StoredProcedure [dbo].[zw_upsert_AccountUserField]    Script Date: 5/15/2018 12:09:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_AccountUserField ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@List_Source [nvarchar](MAX)   = NULL , 
@Sub_COMPANY_NAME [nvarchar](MAX)   = NULL , 
@Sub_CONTACT_NAME [nvarchar](MAX)   = NULL , 
@Sub_PHONE [nvarchar](MAX)   = NULL , 
@Sub_SHIPPING_METHOD [nvarchar](MAX)   = NULL , 
@Sub_P_O__NUMBER [nvarchar](MAX)   = NULL , 
@Sub_P_O__AMOUNT float  = NULL , 
@Sub_SHIP_DATE_PROJECTED datetime  = NULL , 
@Sub_TRACKING_NO_ float  = NULL , 
@Sub_ITEM_RECEIVED_DATE datetime  = NULL , 
@Sub_NOTES [nvarchar](MAX)   = NULL , 
@Recently_Picked_up_List datetime  = NULL , 
@Absent_Customers datetime  = NULL , 
@Do_not_mails datetime  = NULL , 
@Exclude_From_Fastmail datetime  = NULL , 
@letter_guide datetime  = NULL , 
@letter_guide_discount datetime  = NULL , 
@nothing datetime  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [AccountUserField] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[List_Source] = @List_Source, 
		[Sub_COMPANY_NAME] = @Sub_COMPANY_NAME, 
		[Sub_CONTACT_NAME] = @Sub_CONTACT_NAME, 
		[Sub_PHONE] = @Sub_PHONE, 
		[Sub_SHIPPING_METHOD] = @Sub_SHIPPING_METHOD, 
		[Sub_P_O__NUMBER] = @Sub_P_O__NUMBER, 
		[Sub_P_O__AMOUNT] = @Sub_P_O__AMOUNT, 
		[Sub_SHIP_DATE_PROJECTED] = @Sub_SHIP_DATE_PROJECTED, 
		[Sub_TRACKING_NO_] = @Sub_TRACKING_NO_, 
		[Sub_ITEM_RECEIVED_DATE] = @Sub_ITEM_RECEIVED_DATE, 
		[Sub_NOTES] = @Sub_NOTES, 
		[Recently_Picked_up_List] = @Recently_Picked_up_List, 
		[Absent_Customers] = @Absent_Customers, 
		[Do_not_mails] = @Do_not_mails, 
		[Exclude_From_Fastmail] = @Exclude_From_Fastmail, 
		[letter_guide] = @letter_guide, 
		[letter_guide_discount] = @letter_guide_discount, 
		[nothing] = @nothing, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [AccountUserField]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [List_Source], [Sub_COMPANY_NAME], [Sub_CONTACT_NAME], [Sub_PHONE], [Sub_SHIPPING_METHOD], [Sub_P_O__NUMBER], [Sub_P_O__AMOUNT], [Sub_SHIP_DATE_PROJECTED], [Sub_TRACKING_NO_], [Sub_ITEM_RECEIVED_DATE], [Sub_NOTES], [Recently_Picked_up_List], [Absent_Customers], [Do_not_mails], [Exclude_From_Fastmail], [letter_guide], [letter_guide_discount], [nothing], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @List_Source, @Sub_COMPANY_NAME, @Sub_CONTACT_NAME, @Sub_PHONE, @Sub_SHIPPING_METHOD, @Sub_P_O__NUMBER, @Sub_P_O__AMOUNT, @Sub_SHIP_DATE_PROJECTED, @Sub_TRACKING_NO_, @Sub_ITEM_RECEIVED_DATE, @Sub_NOTES, @Recently_Picked_up_List, @Absent_Customers, @Do_not_mails, @Exclude_From_Fastmail, @letter_guide, @letter_guide_discount, @nothing, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
