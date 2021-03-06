/****** Object:  StoredProcedure [dbo].[zw_delete_AVIDatabase]    Script Date: 5/15/2018 12:09:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
 







/******************************************* CREATE **************************************************/ 
 
CREATE PROCEDURE zw_delete_AVIDatabase ( 
@AVID int  = NULL , 
@StoreID int  = NULL , 
@AVCode varchar(20)   = NULL , 
@PrintAs varchar(20)   = NULL , 
@Description varchar(50)   = NULL , 
@Question varchar(128)   = NULL , 
@AnswerStructure smallint  = NULL , 
@PricingStructure smallint  = NULL , 
@SetupCharge float  = NULL , 
@PerUnitPercentage float  = NULL , 
@MinPerUnitCharge float  = NULL , 
@MinTotalCharge float  = NULL , 
@MinPerAVCharge float  = NULL , 
@SortLevel int  = NULL , 
@DimensionUnits int  = NULL , 
@FixedPerPieceCharge float  = NULL , 
@FixedPerAVCharge float  = NULL , 
@PerPiecePerAVCharge float  = NULL , 
@AreaCharge float  = NULL , 
@LengthCharge float  = NULL , 
@FormulaCharge varchar(MAX)   = NULL , 
@PerimeterCharge float  = NULL , 
@AnswerRequired bit  = NULL , 
@SetupDouble bit  = NULL , 
@BaseDouble bit  = NULL , 
@MinDouble bit  = NULL , 
@ModifiedByComputer varchar(25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@zw_franchise_id varchar(10)
)
AS
SET NOCOUNT ON
 
	 UPDATE [AVI Database] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [AVID] = @AVID
		AND [StoreID] = @StoreID

GO
