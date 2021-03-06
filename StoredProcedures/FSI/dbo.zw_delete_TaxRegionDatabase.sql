/****** Object:  StoredProcedure [dbo].[zw_delete_TaxRegionDatabase]    Script Date: 5/15/2018 12:09:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 
CREATE PROCEDURE zw_delete_TaxRegionDatabase ( 
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
 
	 UPDATE [TaxRegionDatabase] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [TaxRegionID] = @TaxRegionID

GO
