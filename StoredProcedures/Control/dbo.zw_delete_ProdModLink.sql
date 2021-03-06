/****** Object:  StoredProcedure [dbo].[zw_delete_ProdModLink]    Script Date: 5/15/2018 12:09:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
 
CREATE PROCEDURE zw_delete_ProdModLink ( 
@ID int  = NULL , 
@StoreID int  = NULL , 
@ClassTypeID int  = NULL , 
@ModifiedByUser [nvarchar](25)   = NULL , 
@ModifiedByComputer [nvarchar](25)   = NULL , 
@ModifiedDate datetime  = NULL , 
@SeqID int  = NULL , 
@IsSystem bit  = NULL , 
@IsActive bit  = NULL , 
@ProductID int  = NULL , 
@ModifierID int  = NULL , 
@IsDisplayed int  = NULL , 
@DisplayFormula [nvarchar](MAX)   = NULL , 
@UseDefault int  = NULL , 
@DefaultValue [nvarchar](50)   = NULL , 
@UseAlternateList bit  = NULL , 
@SelectionListID int  = NULL , 
@UseAltList bit  = NULL , 
@AltListParamID int  = NULL , 
@AltListParamStoreID int  = NULL , 
@AltListParamClassTypeID int  = NULL , 
@ShowInGrid bit  = NULL , 
@DefaultPartConsumptionFx [nvarchar](MAX)   = NULL , 
@DefaultPart2ConsumptionFx [nvarchar](MAX)   = NULL , 
@AltDependentListName varchar(40)  = NULL , 
@PartConsumptionFormulas [nvarchar](MAX)   = NULL , 
@PartConsumptionUnitIDs [nvarchar](MAX)   = NULL , 
@zw_franchise_id char(7)
)
AS
SET NOCOUNT ON
 
	 UPDATE [ProdModLink] 
	 SET 
		[zw_active] = 0, 
		[sys_du] = getdate() 
	 WHERE [zw_franchise_id] = @zw_franchise_id 
		AND [ID] = @ID
		AND [StoreID] = @StoreID
		AND [ClassTypeID] = @ClassTypeID

GO
