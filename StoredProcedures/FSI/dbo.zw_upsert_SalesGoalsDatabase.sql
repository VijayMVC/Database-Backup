/****** Object:  StoredProcedure [dbo].[zw_upsert_SalesGoalsDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_SalesGoalsDatabase ( 
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
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'Sales Goals Database'
 
	 UPDATE [Sales Goals Database] 
	 SET   
		[StoreID] = @StoreID, 
		[MonthText] = @MonthText, 
		[Month] = @Month, 
		[Year] = @Year, 
		[SalesTotal] = @SalesTotal, 
		[SalesWIP1] = @SalesWIP1, 
		[SalesWIP2] = @SalesWIP2, 
		[SalesWIP3] = @SalesWIP3, 
		[YearOf] = @YearOf, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [Sales Goals Database]( [ID], [StoreID], [MonthText], [Month], [Year], [SalesTotal], [SalesWIP1], [SalesWIP2], [SalesWIP3], [YearOf], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @ID, @StoreID, @MonthText, @Month, @Year, @SalesTotal, @SalesWIP1, @SalesWIP2, @SalesWIP3, @YearOf, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
