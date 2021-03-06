/****** Object:  StoredProcedure [dbo].[zw_delete_SalesGoalsDatabase]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_SalesGoalsDatabase ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@MonthText varchar(10)   = NULL , 
@Month smallint  = NULL , 
@Year smallint  = NULL , 
@SalesTotal float  = NULL , 
@SalesWIP1 float  = NULL , 
@SalesWIP2 float  = NULL , 
@SalesWIP3 float  = NULL , 
@YearOf int  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [Sales Goals Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID

GO
