/****** Object:  StoredProcedure [dbo].[zw_delete_ColorDatabase]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_ColorDatabase ( 
@ColorListID int  = NULL , 
@ColorList varchar(30)   = NULL , 
@Colors varchar(MAX)   = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [ColorDatabase] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ColorListID] = @ColorListID

GO
