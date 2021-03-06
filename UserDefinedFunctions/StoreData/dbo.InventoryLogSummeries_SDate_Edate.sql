/****** Object:  UserDefinedFunction [dbo].[InventoryLogSummeries_SDate_Edate]    Script Date: 5/15/2018 12:15:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION InventoryLogSummeries_SDate_Edate (    @StartDate            DateTime,
    @EndDate              DateTime )
   RETURNS TABLE
   AS
   RETURN (


 
select	LogSummaries.*,
		Part.ItemName,
		Part.StationID,
        Part.PartType,
		Part.UnitCost,
		Part.UnitId,
		Part.RedNotificationPoint,
		Part.YellowNotificationPoint,
		Part.CategoryID,
		PartCategory.ID as PartCategoryID,
		PartCategory.ElementName as PartCategory,
		PartCategory.ParentID,
		Station.StationName

from
(

select	InventoryLog.PartID, 0 as TransDetailID, 0 as TransDetailClassTypeID, 0 as ModifiedDate,
		Sum(InventoryLog.QuantityBilled) as QuantityBilled,
		Sum(InventoryLog.QuantityReceivedOnly)as QuantityReceivedOnly,
		Sum(InventoryLog.QuantityOnHand) as QuantityOnHand,
		Sum(InventoryLog.QuantityReserved) as QuantityReserved,
		Sum(InventoryLog.QuantityAvailable) as QuantityAvailable,
		Sum(InventoryLog.QuantityOnOrder)as QuantityOnOrder,
		Sum(InventoryLog.QuantityExpected) as QuantityExpected,
		0 as IsDetail,
        'Start of Period Quantity' as Recordtype
		
	   

from InventoryLog 
	
where 
	InventoryLog.PartID is not null
	and InventoryLog.ModifiedDate < @StartDate

group by PartID--, TransDetailClassTypeID, TransDetailID

union all

select	InventoryLog.PartID, InventoryLog.TransDetailID, TransDetailClassTypeID, InventoryLog.ModifiedDate,
		InventoryLog.QuantityBilled as QuantityBilled,
		InventoryLog.QuantityReceivedOnly as QuantityReceivedOnly,
		InventoryLog.QuantityOnHand as QuantityOnHand,
		InventoryLog.QuantityReserved as QuantityReserved,
		InventoryLog.QuantityAvailable as QuantityAvailable,
		InventoryLog.QuantityOnOrder as QuantityOnOrder,
		InventoryLog.QuantityExpected as QuantityExpected,
		1 as IsDetail,
        'Inventory Log Detail' as Recordtype
		
	   

from InventoryLog 
	
where 
	InventoryLog.PartID is not null
	and InventoryLog.ModifiedDate between @StartDate and @EndDate

union all

select	InventoryLog.PartID, 0 as TransDetailID, 0 as TransDetailClassTypeID,0 as ModifiedDate,
		Sum(InventoryLog.QuantityBilled) as QuantityBilled,
		Sum(InventoryLog.QuantityReceivedOnly)as QuantityReceivedOnly,
		Sum(InventoryLog.QuantityOnHand) as QuantityOnHand,
		Sum(InventoryLog.QuantityReserved) as QuantityReserved,
		Sum(InventoryLog.QuantityAvailable) as QuantityAvailable,
		Sum(InventoryLog.QuantityOnOrder)as QuantityOnOrder,
		Sum(InventoryLog.QuantityExpected) as QuantityExpected,
		0 as IsDetail,
        'Period Summary' as Recordtype
		
	   

from InventoryLog 
	
where 
	InventoryLog.PartID is not null
	and InventoryLog.ModifiedDate between @StartDate and @EndDate

group by InventoryLog.PartID--, TransDetailClassTypeID,InventoryLog.TransDetailID

union all 

select	InventoryLog.PartID, 0 as TransDetailID, 0 as TransDetailClassTypeID,0 as ModifiedDate,
		Sum(InventoryLog.QuantityBilled) as QuantityBilled,
		Sum(InventoryLog.QuantityReceivedOnly)as QuantityReceivedOnly,
		Sum(InventoryLog.QuantityOnHand) as QuantityOnHand,
		Sum(InventoryLog.QuantityReserved) as QuantityReserved,
		Sum(InventoryLog.QuantityAvailable) as QuantityAvailable,
		Sum(InventoryLog.QuantityOnOrder)as QuantityOnOrder,
		Sum(InventoryLog.QuantityExpected) as QuantityExpected,
		0 as IsDetail,
        'End Of Period Quantity' as Recordtype
		
	   

from InventoryLog 
	
where 
	InventoryLog.PartID is not null
	and InventoryLog.ModifiedDate <= @EndDate

group by InventoryLog.PartID --, TransDetailID, TransDetailClassTypeID

union all 

select	InventoryLog.PartID, 0 as TransDetailID, 0 as TransDetailClassTypeID,0 as ModifiedDate,
		Sum(InventoryLog.QuantityBilled) as QuantityBilled,
		Sum(InventoryLog.QuantityReceivedOnly)as QuantityReceivedOnly,
		Sum(InventoryLog.QuantityOnHand) as QuantityOnHand,
		Sum(InventoryLog.QuantityReserved) as QuantityReserved,
		Sum(InventoryLog.QuantityAvailable) as QuantityAvailable,
		Sum(InventoryLog.QuantityOnOrder)as QuantityOnOrder,
		Sum(InventoryLog.QuantityExpected) as QuantityExpected,
		0 as IsDetail,
        'Current Inventory Quantity' as Recordtype
		
	   

from InventoryLog 
	
where 
	InventoryLog.PartID is not null
	

group by PartID --, TransDetailClassTypeID, TransDetailID

) as LogSummaries

		left join Part with(nolock) on LogSummaries.PartID = Part.ID 
		left join PricingElement as PartCategory with(nolock) on PartCategory.ID=Part.CategoryID
        left join Station with(nolock) on Station.ID = StationID
--		left join TransDetail with(nolock) on TransDetail.ID = LogSummaries.TransDetailID
--        left join VendorTransDetail with(nolock) on VendorTransDetail.ID = LogSummaries.TransDetailID
)

GO
