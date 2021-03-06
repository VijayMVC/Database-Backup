/****** Object:  View [dbo].[ShipperInfoForShipments]    Script Date: 5/15/2018 12:14:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW ShipperInfoForShipments AS --Create View ShipperInfoForShipments AS
--Alter View ShipperInfoForShipments AS
SELECT  Shipment.ShipmentNumber AS OrderNumber, 
        OrderHeader.OrderNumber AS BareOrderNumber,
        OrderHeader.OrderNumber AS ActualOrderNumber,
        OrderHeader.Description, 
        OrderHeader.ID AS OrderID, 

        Shipment.CarrierID,        
        Carrier.CarrierName,
        Shipment.CarrierService, 
        Shipment.TrackingNumber,
		
		CASE WHEN Shipment.InsuredValue > 0.00 THEN CAST(1 AS BIT)
		     ELSE CAST(0 AS BIT)
        END AS UseInsuredValue, Shipment.InsuredValue, 
        Shipment.NumberOfPackages,
        Shipment.PackageWeight AS Weight, 
        1 AS ShipmentNotification, 1 AS DeliveryNotification,
        
        CASE CAST(Shipment.PackageSize AS VarChar(30)) 
          WHEN 'Your Packaging' THEN '01'
          WHEN 'FedEx Pak' THEN '02'
          WHEN 'FedEx Box' THEN '03'
          WHEN 'FedEx Tube' THEN '04'
          WHEN 'FedEx Envelope' THEN '06'
          WHEN 'FedEx 10kg Box' THEN '15'
          WHEN 'FedEx 25kg Box' THEN '25'
          ELSE NULL
        END AS FedExPackageType,
        
        CASE CAST(Shipment.CarrierService AS VarChar(30)) 
          WHEN 'FedEx Priority Overnight' THEN '01'
          WHEN 'Priority Overnight' THEN '01'
          WHEN 'FedEx Standard Overnight' THEN '02'
          WHEN 'Standard Overnight' THEN '02'
          WHEN 'Overnight' THEN '02'
          WHEN 'Standard' THEN '02'
          WHEN 'FedEx 2Day' THEN '03'
          WHEN 'FedEx 2 Day' THEN '03'
          WHEN '2Day' THEN '03'
          WHEN '2ndDay' THEN '03'
          WHEN '2 Day' THEN '03'
          WHEN '2nd Day' THEN '03'
          WHEN 'FedEx 1Day Freight' THEN '04'
          WHEN 'FedEx 1 Day Freight' THEN '04'
          WHEN '1Day Freight' THEN '04'
          WHEN '1 Day Freight' THEN '04'
          WHEN '1Day' THEN '04'
          WHEN '1 Day' THEN '04'
          WHEN 'FedEx 2Day Freight' THEN '05'
          WHEN 'FedEx 2ndDay Freight' THEN '05'
          WHEN 'FedEx 2 Day Freight' THEN '05'
          WHEN 'FedEx 2nd Day Freight' THEN '05'
          WHEN '2Day Freight' THEN '05'
          WHEN '2 Day Freight' THEN '05'
          WHEN '2nd Day Freight' THEN '05'
          WHEN 'FedEx First Overnight' THEN '06'
          WHEN 'First Overnight' THEN '06'
          WHEN 'FedEx Express Saver' THEN '07'
          WHEN 'Express Saver' THEN '07'
          WHEN 'FedEx 3Day Freight' THEN '08'
          WHEN 'FedEx 3 Day Freight' THEN '08'
          WHEN '3Day Freight' THEN '08'
          WHEN '3 Day Freight' THEN '08'
          WHEN 'FedEx 3Day' THEN '08'
          WHEN 'FedEx 3 Day' THEN '08'
          WHEN '3Day' THEN '08'
          WHEN '3 Day' THEN '08'
          WHEN 'FedEx Ground Service' THEN 'R'
          WHEN 'FedEx Ground' THEN 'R'
          WHEN 'Ground Service' THEN 'R'
          WHEN 'Ground' THEN 'R'
          ELSE NULL
        END AS FedExServiceType,
		
		CASE CAST(Shipment.PackageSize AS VarChar(30)) 
          WHEN 'Package' THEN 'Package'
          WHEN 'Box Large' THEN 'UPS Express Box Large'
          WHEN 'Express Box Medium' THEN 'UPS Express Box Medium'
          WHEN 'Express Box Small' THEN 'UPS Express Box Small'
          WHEN 'Letter' THEN 'UPS Letter'
          WHEN 'PAK' THEN 'UPS PAK'
          WHEN 'Tube' THEN 'UPS Tube'
          ELSE NULL
        END AS UPSPackageType,
		
		CASE CAST(Shipment.CarrierService AS VarChar(30)) 
		  WHEN 'Next Day Air Early A.M.' THEN 'Next Day Air Early AM'
		  WHEN 'Next Day Air Early' THEN 'Next Day Air Early AM'
		  WHEN 'Next Day Air' THEN 'Next Day Air'
		  WHEN 'Next Day' THEN 'Next Day Air'
		  WHEN 'Next Day Air Saver' THEN 'Next Day Air Saver'
		  WHEN '1 Day Air Early A.M.' THEN 'Next Day Air Early AM'
		  WHEN '1 Day Air Early' THEN 'Next Day Air Early AM'
		  WHEN '1 Day Air' THEN 'Next Day Air'
		  WHEN '1 Day Air Saver' THEN 'Next Day Air Saver'
		  WHEN '1 Day Air' THEN 'Next Day Air'
		  WHEN '1 Day' THEN 'Next Day Air'
		  WHEN '1Day' THEN 'Next Day Air'
		  WHEN '2nd Day Air A.M.' THEN '2nd Day Air AM'
		  WHEN '2nd Day' THEN '2nd Day Air'
		  WHEN '2nd Day Air' THEN '2nd Day Air'
		  WHEN '2Day' THEN '2nd Day Air'
		  WHEN '2 Day' THEN '2nd Day Air'
		  WHEN '3 Day Select' THEN '3 Day Select'
		  WHEN '3 Day' THEN '3 Day Select'
		  WHEN '3Day' THEN '3 Day Select'
		  WHEN 'Ground' THEN 'Ground'
		  WHEN 'Ground Service' THEN 'Ground'
		  WHEN 'UPS Ground' THEN 'Ground'
		  WHEN 'UPS Ground Service' THEN 'Ground'
          ELSE NULL
        END AS UPSServiceType,

        -- FedEx BillTransportationTo 1 = Sender, 2 = Recipient, 3 = Third Party
        CASE UseShippingAccountInfo 
			WHEN 1 THEN 2 ELSE 1 
		END AS BillTransportationTo,
		
		CASE UseShippingAccountInfo 
			WHEN 1 THEN 'Receiver' ELSE 'Shipper' 
		END AS UPSBillTransportationTo,
        
        CASE UseShippingAccountInfo 
			WHEN 1 THEN ShippingAccountNumber ELSE NULL 
		END AS CustomerShippingAcctID,

        Shipment.AccountID, 
        Shipment.AccountName AS CompanyName, 
        (SELECT AccountNumber FROM Account WHERE ID = Shipment.AccountID) CompanyNumber,
        Shipment.ContactName AS FullName, Shipment.EmailAddress AS Email, Shipment.PhoneNumberText Phone, 

        ShipToAddress.StreetAddress1 AS StreetAddress1, 
        ShipToAddress.StreetAddress2 AS StreetAddress2,
        ShipToAddress.City AS City,
        ShipToAddress.State AS State,
        ShipToAddress.County AS County,
        ShipToAddress.PostalCode AS PostalCode,
        ShipToAddress.Country AS Country,
		
		
		CASE ShipFromClassTypeID
			WHEN 1000 THEN ( Select Top 1 CompanyName From Store Where ID > 0 )
			WHEN 2000 THEN ( Select Top 1 CompanyName From Account Where ID = OrderHeader.ShipFromID )
			WHEN 3000 THEN ( Select Top 1 CompanyName From Account Where ID = (SELECT TOP 1 AccountID FROM AccountContact WHERE ID = OrderHeader.ShipFromID ) )
			WHEN 3400 THEN ( '???')
		END AS ShipFromCompanyName,
		
		CASE ShipFromClassTypeID
			WHEN 1000 THEN ( Select Top 1 FirstName + ' ' + LastName From AccountContact Where ID = OrderHeader.SalesPerson1ID )
			WHEN 2000 THEN ( Select Top 1 FirstName + ' ' + LastName From AccountContact Where IsPrimaryContact = 1 AND AccountID = OrderHeader.ShipFromID )
			WHEN 3000 THEN ( Select Top 1 FirstName + ' ' + LastName From AccountContact Where ID = OrderHeader.ShipFromID )
			WHEN 3400 THEN ('???')
		END AS ShipFromContact,
		
		(Select Top 1 FormattedText From PhoneNumber Where ID = OrderHeader.ShipFromPhoneNumberID) AS ShipFromPhoneNumber,
		

        ShipFromAddress.StreetAddress1 AS ShipFromStreetAddress1,
        ShipFromAddress.StreetAddress2 AS ShipFromStreetAddress2,
        ShipFromAddress.City AS ShipFromCity,
        ShipFromAddress.State AS ShipFromState,
        ShipFromAddress.County AS ShipFromCounty,
        ShipFromAddress.PostalCode AS ShipFromPostalCode,
        ShipFromAddress.Country AS ShipFromCountry,
		
		

        OrderHeader.Salesperson1ID SalespersonID, 
        Salesperson.FirstName + ' ' + Salesperson.LastName AS SalespersonName,
        Salesperson.EmailAddress AS SPEmailAddress

FROM    Shipments AS Shipment WITH (NOLOCK)
        LEFT JOIN TransHeader AS OrderHeader WITH (NOLOCK) ON OrderHeader.ID = Shipment.TransHeaderID
        LEFT JOIN Address AS ShipFromAddress WITH (NOLOCK) ON ShipFromAddress.ID = OrderHeader.ShipFromAddressID
        LEFT JOIN Employee AS Salesperson WITH (NOLOCK) ON Salesperson.ID = OrderHeader.SalesPerson1ID
        LEFT JOIN ShippingMethod AS Carrier WITH (NOLOCK) ON Carrier.ID = Shipment.CarrierID
     	LEFT JOIN Address AS ShipToAddress WITH(NOLOCK) ON ShipToAddress.ID = Shipment.ShipToAddressID

WHERE   OrderHeader.TransactionType IN (1,6)

GO
