/****** Object:  View [dbo].[ShipmentDetail]    Script Date: 5/15/2018 12:14:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW ShipmentDetail AS SELECT ShipmentID
      ,ShipTable.ShipmentNumber
      ,ShipTable.TransHeaderID
      ,TH.OrderNumber
      ,ShipTable.LineItemID
      ,ShipTable.LineItemNumber
      ,ShipTable.Description
      ,ShipTable.Quantity
      ,TD.Quantity as TotalLineQuantity
      ,case when TD.Quantity <> 0 then (ShipTable.Quantity / TD.Quantity)*TD.SubTotalPrice else 0 end as ShippedPrice
      ,ShipTable.IsValidTax
      ,ShipTable.TaxesCalcPrice
      ,ShipTable.TaxesOverriddenPrice
      ,ShipTable.TaxesIsOverridden
      ,ShipTable.TaxItems
      ,TH.EstimateNumber
      ,TH.TransactionType
FROM
(
 SELECT ShipmentXML.ID as ShipmentID,
       ShipmentNumber,
    TransHeaderID, 
    CAST( 
   SUBSTRING( ShipmentItem.value('(LineItemID/text())[1]', 'varchar(MAX)'), 
        2, 
        PATINDEX('%,%', ShipmentItem.value('(LineItemID/text())[1]', 'varchar(MAX)') ) -2
   ) AS INT ) LineItemID,
    ShipmentItem.value('(Quantity/text())[1]', 'FLOAT') AS Quantity,
    ShipmentItem.value('(Description/text())[1]', 'varchar(Max)') AS Description,
    ShipmentItem.value('(LineItemText/text())[1]', 'varchar(15)') AS LineItemNumber,
    ShipmentItem.value('(IsValidTax/text())[1]', 'BIT') AS IsValidTax,
    ShipmentItem.value('(TaxesCalcPrice/text())[1]', 'FLOAT') AS TaxesCalcPrice,
    ShipmentItem.value('(TaxesOverriddenPrice/text())[1]', 'FLOAT') AS TaxesOverriddenPrice,
    ShipmentItem.value('(TaxesIsOverridden/text())[1]', 'BIT') AS TaxesIsOverridden,
    ShipmentItem.query('(node()[local-name() = "TaxItems"]/Taxes)') TaxItems
 FROM (SELECT ID, ShipmentNumber, TransHeaderID, CAST(ShipLineItemsXML AS XML) ItemsXML 
   FROM Shipments
   ) ShipmentXML
    CROSS APPLY ItemsXML.nodes('//LineItem') AS VARIABLES(ShipmentItem) 
) ShipTable 
join TransHeader TH on TH.ID = ShipTable.TransHeaderID
join TransDetail TD on TD.ID = ShipTable.LineItemID

GO
