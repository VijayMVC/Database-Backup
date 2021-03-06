/****** Object:  StoredProcedure [dbo].[zw_upsert_ColorDatabase]    Script Date: 5/15/2018 12:09:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_ColorDatabase ( 
@ColorListID int  = NULL , 
@ColorList varchar(30)   = NULL , 
@Colors varchar(MAX)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'ColorDatabase'
 
	 UPDATE [ColorDatabase] 
	 SET   
		[ColorList] = @ColorList, 
		[Colors] = @Colors, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ColorListID] = @ColorListID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [ColorDatabase]( [ColorListID], [ColorList], [Colors], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ColorListID, @ColorList, @Colors, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
