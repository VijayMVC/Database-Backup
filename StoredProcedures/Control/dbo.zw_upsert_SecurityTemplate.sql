/****** Object:  StoredProcedure [dbo].[zw_upsert_SecurityTemplate]    Script Date: 5/15/2018 12:09:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_SecurityTemplate ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](50)   = NULL , 
@ModifiedByComputer [nvarchar](50)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@TemplateName [nvarchar](50)   = NULL , 
@OneUser bit  = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [SecurityTemplate] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[TemplateName] = @TemplateName, 
		[OneUser] = @OneUser, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [SecurityTemplate]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [TemplateName], [OneUser], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @TemplateName, @OneUser, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
