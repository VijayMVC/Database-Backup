/****** Object:  StoredProcedure [dbo].[zw_upsert_PartGL]    Script Date: 5/15/2018 12:09:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_PartGL ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate smalldatetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@EntryDateTime smalldatetime  = NULL , 
@Cost [numeric](18,4)  = NULL , 
@UnitCost [numeric](18,4)  = NULL , 
@GroupID int  = NULL , 
@GLAccountID int  = NULL , 
@GLAccountClassTypeID int  = NULL , 
@CustomerID int  = NULL , 
@CustomerClassTypeID int  = NULL , 
@VendorID int  = NULL , 
@VendorClassTypeID int  = NULL , 
@PartID int  = NULL , 
@PartClassTypeID int  = NULL , 
@ProductID int  = NULL , 
@ProductClassTypeID int  = NULL , 
@ModifierID int  = NULL , 
@ModifierClassTypeID int  = NULL , 
@TransHeaderID int  = NULL , 
@TransHeaderClassTypeID int  = NULL , 
@TransDetailID int  = NULL , 
@TransDetailClassTypeID int  = NULL , 
@TransModID int  = NULL , 
@TransModClassTypeID int  = NULL , 
@TransPartID int  = NULL , 
@TransPartClassTypeID int  = NULL , 
@Quantity [numeric](18,4)  = NULL , 
@Description [nvarchar](50)   = NULL , 
@Reserved bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [PartGL] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[EntryDateTime] = @EntryDateTime, 
		[Cost] = @Cost, 
		[UnitCost] = @UnitCost, 
		[GroupID] = @GroupID, 
		[GLAccountID] = @GLAccountID, 
		[GLAccountClassTypeID] = @GLAccountClassTypeID, 
		[CustomerID] = @CustomerID, 
		[CustomerClassTypeID] = @CustomerClassTypeID, 
		[VendorID] = @VendorID, 
		[VendorClassTypeID] = @VendorClassTypeID, 
		[PartID] = @PartID, 
		[PartClassTypeID] = @PartClassTypeID, 
		[ProductID] = @ProductID, 
		[ProductClassTypeID] = @ProductClassTypeID, 
		[ModifierID] = @ModifierID, 
		[ModifierClassTypeID] = @ModifierClassTypeID, 
		[TransHeaderID] = @TransHeaderID, 
		[TransHeaderClassTypeID] = @TransHeaderClassTypeID, 
		[TransDetailID] = @TransDetailID, 
		[TransDetailClassTypeID] = @TransDetailClassTypeID, 
		[TransModID] = @TransModID, 
		[TransModClassTypeID] = @TransModClassTypeID, 
		[TransPartID] = @TransPartID, 
		[TransPartClassTypeID] = @TransPartClassTypeID, 
		[Quantity] = @Quantity, 
		[Description] = @Description, 
		[Reserved] = @Reserved, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [PartGL]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [EntryDateTime], [Cost], [UnitCost], [GroupID], [GLAccountID], [GLAccountClassTypeID], [CustomerID], [CustomerClassTypeID], [VendorID], [VendorClassTypeID], [PartID], [PartClassTypeID], [ProductID], [ProductClassTypeID], [ModifierID], [ModifierClassTypeID], [TransHeaderID], [TransHeaderClassTypeID], [TransDetailID], [TransDetailClassTypeID], [TransModID], [TransModClassTypeID], [TransPartID], [TransPartClassTypeID], [Quantity], [Description], [Reserved], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @EntryDateTime, @Cost, @UnitCost, @GroupID, @GLAccountID, @GLAccountClassTypeID, @CustomerID, @CustomerClassTypeID, @VendorID, @VendorClassTypeID, @PartID, @PartClassTypeID, @ProductID, @ProductClassTypeID, @ModifierID, @ModifierClassTypeID, @TransHeaderID, @TransHeaderClassTypeID, @TransDetailID, @TransDetailClassTypeID, @TransModID, @TransModClassTypeID, @TransPartID, @TransPartClassTypeID, @Quantity, @Description, @Reserved, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
