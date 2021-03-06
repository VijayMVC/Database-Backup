/****** Object:  StoredProcedure [dbo].[zw_delete_AccountCodeDatabase]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/******************************************* ALTER **************************************************/ 
 
 
CREATE PROCEDURE zw_delete_AccountCodeDatabase ( 
@ID varchar(20)   = NULL , 
@Type varchar(1)   = NULL , 
@Description varchar(30)   = NULL , 
@Number int  = NULL , 
@Text varchar(50)   = NULL , 
@BreakOutSub bit  = NULL , 
@BaseText varchar(50)   = NULL , 
@ModifierText varchar(50)   = NULL , 
@DiscountText varchar(50)   = NULL , 
@InstallText varchar(50)   = NULL , 
@OmitFromExport bit  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Account Code Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID

GO
