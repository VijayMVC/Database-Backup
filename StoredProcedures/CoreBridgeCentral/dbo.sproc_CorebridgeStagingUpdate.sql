/****** Object:  StoredProcedure [dbo].[sproc_CorebridgeStagingUpdate]    Script Date: 5/15/2018 12:09:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE sproc_CorebridgeStagingUpdate

AS

BEGIN

If OBJECT_ID('dbo.CoreBridgestaging','U') IS NOT NULL  DROP TABLE dbo.CoreBridgestaging 	

IF OBJECT_ID('tempdb.dbo.#CorebridgeStage', 'U') IS NOT NULL
DROP TABLE #CorebridgeStage

IF OBJECT_ID('tempdb.dbo.#Pivot', 'U') IS NOT NULL
DROP TABLE #pivot

Select
  --ROW_NUMBER() OVER(ORDER BY ZW_Franchise_ID) AS CorebridgeRowID,
  CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID,
  CoreBridgeCentral.dbo.DailyDim.ReportItem,
  CoreBridgeCentral.dbo.DailyAmounts.CurrentAmount,
  Cast(DateAdd(day, -1, CoreBridgeCentral.dbo.DailyAmounts.LastUpdate)
  As date) As LastUpdate,
  FII_ODS.dbo.vw_Store.WebNumber,
  FII_ODS.dbo.vw_Store.StoreNumber,
  FII_ODS.dbo.vw_Store.VanityName,
  FII_ODS.dbo.vw_Store.OpenStatus,
  FII_ODS.dbo.vw_Store.Address,
  FII_ODS.dbo.vw_Store.CityName,
  FII_ODS.dbo.vw_Store.StateName,
  FII_ODS.dbo.vw_Store.Zip,
  FII_ODS.dbo.vw_Store.CountryCode,
  FII_ODS.dbo.vw_Store.Region,
  FII_ODS.dbo.vw_Store.RegionName,
  FII_ODS.dbo.vw_Store.RoyaltyFIIpercent,
  FII_ODS.dbo.vw_Store.RoyaltyNACpercent,
  FII_ODS.dbo.vw_Store.StoreOpenDate,
  FII_ODS.dbo.vw_Store.OperationalName,
  FII_ODS.dbo.vw_Store.StoreTypeName,
  [FII_ODS].[Store].[StoreFact].Email,
  [FII_ODS].[Store].[StoreFact].FBC,
  [FII_ODS].[Store].[StoreFact].Director,
  [FII_ODS].[Store].[StoreFact].ResaleOpenDate,
  ISNULL([FII_ODS].[Store].[StoreFact].ResaleOpenDate, FII_ODS.dbo.vw_Store.StoreOpenDate) AS CurrentStoreOpenDate

 


INTO #Pivot
From
  CoreBridgeCentral.dbo.DailyAmounts
  Inner Join CoreBridgeCentral.dbo.DailyDim
    On CoreBridgeCentral.dbo.DailyDim.ReportType =
    CoreBridgeCentral.dbo.DailyAmounts.ReportType
  Inner Join CoreBridgeCentral.dbo.vw_Locations
    On CoreBridgeCentral.dbo.DailyAmounts.CompanyLocationId =
    CoreBridgeCentral.dbo.vw_Locations.Value
  Inner Join FII_ODS.dbo.vw_Store
    On CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID =
    FII_ODS.dbo.vw_Store.ZW_Franchise_ID
  INNER JOIN [FII_ODS].[Store].[StoreFact]
  ON		FII_ODS.dbo.vw_Store.ZW_Franchise_ID = 
  [FII_ODS].[Store].[StoreFact].ZW_Franchise_ID

--WHERE		CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID = 'FSI0573'
--AND			CoreBridgeCentral.dbo.DailyDim.ReportItem = '$ in Orders in BUILT'
Order By
  CoreBridgeCentral.dbo.vw_Locations.ZW_Franchise_ID,
  LastUpdate Desc

--SELECT * FROM  #pivot

SELECT	 *
INTO	#CorebridgeStage
FROM	#Pivot
PIVOT
	(
		SUM(CurrentAmount)
		FOR	ReportItem IN (		
								[# of Voided (Post-Completed)]
								,[# of Orders in BUILT]
								,[$ in New Orders]
								,[$ Collected]
								,[$ in Orders in BUILT]
								,[$ in Cancelled Estimates]
								,[$ in Net Completed Orders]
								,[# of Converted Estimates]
								,[# of Orders in WIP]
								,[$ in Total Estimates]
								,[$ in New Estimates]
								,[$ in Orders in WIP]
								,[# of New Customers]
								,[# of Total New Orders]
								,[# of New Estimates]
								,[# of Total Estimates]
								,[$ in Voided (Post-Completed)]
								,[# of Orders in Receivables]
								,[# of Completed Orders]
								,[$ in Converted Estimates]
								,[# of Net Completed Orders]
								,[# of Voided (Pre-Completed)]
								,[# of Cancelled Estimates]
								,[$ in Voided (Pre-Completed)]
								,[$ in Completed Orders]
								,[$ in Total New Orders]
								,[Total $ in Receivables]
								,[# of New Orders]
							)) AS P
						ORDER BY ZW_Franchise_ID;



CREATE TABLE dbo.CoreBridgeStaging
							(
								CorebridgeRowID												INT IDENTITY (1,1) PRIMARY KEY		,
								[ZW_Franchise_ID]											VARCHAR(50)							,
								[LastUpdate]												DATE								,
								[WebNumber]													INT									,
								[StoreNumber]												INT									,
								[VanityName]												VARCHAR(255)						,
								[OpenStatus]												VARCHAR(50)							,
								[Address]													VARCHAR(50)							,
								[CityName]													VARCHAR(50)							,
								[StateName]													VARCHAR(50)							,
								[Zip]														VARCHAR(50)							,
								[CountryCode]												VARCHAR(50)							,		
								[Region]													VARCHAR(50)							,
								[RegionName]												VARCHAR(50)							,
								[RoyaltyFIIpercent]											FLOAT								,
								[RoyaltyNACpercent]											FLOAT								,
								[StoreOpenDate]												DATE								,
								[OperationalName]											VARCHAR(50)							,
								[StoreTypeName]												VARCHAR(50)							,
								[Email]														VARCHAR(255)						,
								[FBC]														VARCHAR(50)							,
								[Director]													VARCHAR(50)							,
								[ResaleOpenDate]											DATE								,
								[CurrentStoreOpenDate]					DATE								,
								[# of Voided (Post-Completed)]			INT									, 
								[# of Orders in BUILT]					INT									,
								[$ in New Orders]						Decimal(18,6)						,
								[$ Collected]							Decimal(18,6)						,
								[$ in Orders in BUILT]					Decimal(18,6)						,
								[$ in Cancelled Estimates]				Decimal(18,6)						,
								[$ in Net Completed Orders]				Decimal(18,6)						,
								[# of Converted Estimates]				INT									,
								[# of Orders in WIP]					INT									,
								[$ in Total Estimates]					Decimal(18,6)						,
								[$ in New Estimates]					Decimal(18,6)						,
								[$ in Orders in WIP]					Decimal(18,6)						,
								[# of New Customers]					INT									,
								[# of Total New Orders]					INT									, 
								[# of New Estimates]					INT									,
								[# of Total Estimates]					INT									,
								[$ in Voided (Post-Completed)]			Decimal(18,6)						,
								[# of Orders in Receivables]			INT									,
								[# of Completed Orders]					INT									,
								[$ in Converted Estimates]				Decimal(18,6)						,
								[# of Net Completed Orders]				INT									,
								[# of Voided (Pre-Completed)]			INT									,
								[# of Cancelled Estimates]				INT									,
								[$ in Voided (Pre-Completed)]			Decimal(18,6)						,
								[$ in Completed Orders]					Decimal(18,6)						,
								[$ in Total New Orders]					Decimal(18,6)						,
								[Total $ in Receivables]				Decimal(18,6)						,
								[# of New Orders]						INT									,
							)

INSERT INTO dbo.CoreBridgestaging(		
								-- CorebridgeRowID												
								[ZW_Franchise_ID]											
								,[LastUpdate]												
								,[WebNumber]													
								,[StoreNumber]												
								,[VanityName]												
								,[OpenStatus]												
								,[Address]													
								,[CityName]													
								,[StateName]													
								,[Zip]														
								,[CountryCode]													
								,[Region]													
								,[RegionName]												
								,[RoyaltyFIIpercent]											
								,[RoyaltyNACpercent]											
								,[StoreOpenDate]												
								,[OperationalName]											
								,[StoreTypeName]												
								,[Email]														
								,[FBC]														
								,[Director]													
								,[ResaleOpenDate]											
								,[CurrentStoreOpenDate]					
								,[# of Voided (Post-Completed)]			
								,[# of Orders in BUILT]					
								,[$ in New Orders]						
								,[$ Collected]							
								,[$ in Orders in BUILT]					
								,[$ in Cancelled Estimates]				
								,[$ in Net Completed Orders]				
								,[# of Converted Estimates]				
								,[# of Orders in WIP]					
								,[$ in Total Estimates]					
								,[$ in New Estimates]					
								,[$ in Orders in WIP]					
								,[# of New Customers]					
								,[# of Total New Orders]					
								,[# of New Estimates]					
								,[# of Total Estimates]					
								,[$ in Voided (Post-Completed)]			
								,[# of Orders in Receivables]			
								,[# of Completed Orders]					
								,[$ in Converted Estimates]				
								,[# of Net Completed Orders]				
								,[# of Voided (Pre-Completed)]			
								,[# of Cancelled Estimates]				
								,[$ in Voided (Pre-Completed)]			
								,[$ in Completed Orders]					
								,[$ in Total New Orders]					
								,[Total $ in Receivables]				
								,[# of New Orders]						
							)
SELECT	
								[ZW_Franchise_ID]											
								,[LastUpdate]												
								,[WebNumber]													
								,[StoreNumber]												
								,[VanityName]												
								,[OpenStatus]												
								,[Address]													
								,[CityName]													
								,[StateName]													
								,[Zip]														
								,[CountryCode]													
								,[Region]													
								,[RegionName]												
								,[RoyaltyFIIpercent]											
								,[RoyaltyNACpercent]											
								,[StoreOpenDate]												
								,[OperationalName]											
								,[StoreTypeName]												
								,[Email]														
								,[FBC]														
								,[Director]													
								,[ResaleOpenDate]											
								,[CurrentStoreOpenDate]					
								,[# of Voided (Post-Completed)]			
								,[# of Orders in BUILT]					
								,[$ in New Orders]						
								,[$ Collected]							
								,[$ in Orders in BUILT]					
								,[$ in Cancelled Estimates]				
								,[$ in Net Completed Orders]				
								,[# of Converted Estimates]				
								,[# of Orders in WIP]					
								,[$ in Total Estimates]					
								,[$ in New Estimates]					
								,[$ in Orders in WIP]					
								,[# of New Customers]					
								,[# of Total New Orders]					
								,[# of New Estimates]					
								,[# of Total Estimates]					
								,[$ in Voided (Post-Completed)]			
								,[# of Orders in Receivables]			
								,[# of Completed Orders]					
								,[$ in Converted Estimates]				
								,[# of Net Completed Orders]				
								,[# of Voided (Pre-Completed)]			
								,[# of Cancelled Estimates]				
								,[$ in Voided (Pre-Completed)]			
								,[$ in Completed Orders]					
								,[$ in Total New Orders]					
								,[Total $ in Receivables]				
								,[# of New Orders]						
FROM			#CorebridgeStage

		--ORDER BY ZW_Franchise_ID;


END
GO
