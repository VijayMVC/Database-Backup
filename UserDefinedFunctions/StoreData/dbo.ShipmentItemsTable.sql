/****** Object:  UserDefinedFunction [dbo].[ShipmentItemsTable]    Script Date: 5/15/2018 12:15:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION ShipmentItemsTable (	
	-- Add the parameters for the function here
	@ShipmentID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT @ShipmentID as ShipmentID, 
		   CAST( SUBSTRING( LineItemID, 2, PATINDEX('%,%', T.LineItemID)-2 ) AS INT ) LineItemID,
		   Description,
		   LineItemText,
		   Quantity, 
		   IsValidTax, 
		   TaxesCalcPrice, 
		   TaxesOverriddenPrice, 
		   TaxesIsOverridden, 
		   TaxItems
	FROM ( SELECT ShipmentXML.ID,
				  ShipmentItem.value('(LineItemID/text())[1]', 'NVarChar(MAX)') AS LineItemID,
				  ShipmentItem.value('(Quantity/text())[1]', 'FLOAT') AS Quantity,
				  ShipmentItem.value('(Description/text())[1]', 'NVarChar(Max)') AS Description,
				  ShipmentItem.value('(LineItemText/text())[1]', 'NVarChar(Max)') AS LineItemText,
				  ShipmentItem.value('(IsValidTax/text())[1]', 'BIT') AS IsValidTax,
				  ShipmentItem.value('(TaxesCalcPrice/text())[1]', 'FLOAT') AS TaxesCalcPrice,
				  ShipmentItem.value('(TaxesOverriddenPrice/text())[1]', 'FLOAT') AS TaxesOverriddenPrice,
				  ShipmentItem.value('(TaxesIsOverridden/text())[1]', 'BIT') AS TaxesIsOverridden,
				  ShipmentItem.query('(node()[local-name() = "TaxItems"]/Taxes)') TaxItems
		   FROM (SELECT *, CAST(ShipLineItemsXML AS XML) ItemsXML 
				 FROM Shipments
				 WHERE Shipments.ID = @ShipmentID
				 ) ShipmentXML
						CROSS APPLY ItemsXML.nodes('//LineItem') AS VARIABLES(ShipmentItem) 
		   ) T
)

GO
