/****** Object:  StoredProcedure [dbo].[zw_upsert_EmailActivity]    Script Date: 5/15/2018 12:09:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_upsert_EmailActivity ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@Recipients [nvarchar](MAX)   = NULL , 
@CC [nvarchar](MAX)   = NULL , 
@BCC [nvarchar](MAX)   = NULL , 
@Subject [nvarchar](50)   = NULL , 
@Sender [nvarchar](50)   = NULL , 
@Body [nvarchar](MAX)   = NULL , 
@Attachments [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [EmailActivity] 
	 SET   
		[ModifiedByUser] = @ModifiedByUser, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[SeqID] = @SeqID, 
		[IsSystem] = @IsSystem, 
		[IsActive] = @IsActive, 
		[Recipients] = @Recipients, 
		[CC] = @CC, 
		[BCC] = @BCC, 
		[Subject] = @Subject, 
		[Sender] = @Sender, 
		[Body] = @Body, 
		[Attachments] = @Attachments, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [EmailActivity]( [ID], [StoreID], [ClassTypeID], [ModifiedByUser], [ModifiedByComputer], [ModifiedDate], [SeqID], [IsSystem], [IsActive], [Recipients], [CC], [BCC], [Subject], [Sender], [Body], [Attachments], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @ClassTypeID, @ModifiedByUser, @ModifiedByComputer, @ModifiedDate, @SeqID, @IsSystem, @IsActive, @Recipients, @CC, @BCC, @Subject, @Sender, @Body, @Attachments, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END

GO
