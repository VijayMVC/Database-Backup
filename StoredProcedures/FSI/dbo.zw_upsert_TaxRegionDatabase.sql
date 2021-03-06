/****** Object:  StoredProcedure [dbo].[zw_upsert_TaxRegionDatabase]    Script Date: 5/15/2018 12:09:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_upsert_TaxRegionDatabase ( 
@TaxRegionID int  = NULL , 
@Region varchar(30)   = NULL , 
@Tax1Rate float  = NULL , 
@Tax2Rate float  = NULL , 
@Tax3Rate float  = NULL , 
@TaxIDNumber varchar(75)   = NULL , 
@Address varchar(MAX)   = NULL , 
@TaxesAlwaysRoundUp bit  = NULL , 
@Tax1Max float  = NULL , 
@Tax2Max float  = NULL , 
@Tax3Max float  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	exec [dbo].[zw_collection_meta_last_collection] @zw_franchise_id, 'TaxRegionDatabase'
 
	 UPDATE [TaxRegionDatabase] 
	 SET   
		[Region] = @Region, 
		[Tax1Rate] = @Tax1Rate, 
		[Tax2Rate] = @Tax2Rate, 
		[Tax3Rate] = @Tax3Rate, 
		[TaxIDNumber] = @TaxIDNumber, 
		[Address] = @Address, 
		[TaxesAlwaysRoundUp] = @TaxesAlwaysRoundUp, 
		[Tax1Max] = @Tax1Max, 
		[Tax2Max] = @Tax2Max, 
		[Tax3Max] = @Tax3Max, 
		[ModifiedByComputer] = @ModifiedByComputer, 
		[ModifiedDate] = @ModifiedDate, 
		[sys_du] = getdate(), 
		[zw_active] = 1 
		WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [TaxRegionID] = @TaxRegionID
 
	IF @@ROWCOUNT = 0 
	BEGIN 
		INSERT INTO [TaxRegionDatabase]( [TaxRegionID], [Region], [Tax1Rate], [Tax2Rate], [Tax3Rate], [TaxIDNumber], [Address], [TaxesAlwaysRoundUp], [Tax1Max], [Tax2Max], [Tax3Max], [ModifiedByComputer], [ModifiedDate], [zw_franchise_id], [sys_di], [sys_du], [zw_active] ) 
		VALUES( @TaxRegionID, @Region, @Tax1Rate, @Tax2Rate, @Tax3Rate, @TaxIDNumber, @Address, @TaxesAlwaysRoundUp, @Tax1Max, @Tax2Max, @Tax3Max, @ModifiedByComputer, @ModifiedDate, @zw_franchise_id, getdate(), getdate(), 1 ) 
	END 

GO
