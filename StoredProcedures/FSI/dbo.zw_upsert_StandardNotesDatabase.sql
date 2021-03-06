/****** Object:  StoredProcedure [dbo].[zw_upsert_StandardNotesDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_StandardNotesDatabase ( 
@NotesID int  = NULL , 
@StoreID int  = NULL , 
@OrderNotes varchar(MAX)   = NULL , 
@InstallNotes varchar(MAX)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Standard Notes Database'
 
	 UPDATE [Standard Notes Database] 
	 SET   
		[StoreID] = @StoreID, 
		[OrderNotes] = @OrderNotes, 
		[InstallNotes] = @InstallNotes, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [NotesID] = @NotesID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Standard Notes Database]( [NotesID], [StoreID], [OrderNotes], [InstallNotes], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @NotesID, @StoreID, @OrderNotes, @InstallNotes, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
