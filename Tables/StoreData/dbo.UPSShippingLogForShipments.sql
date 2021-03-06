/****** Object:  Table [dbo].[UPSShippingLogForShipments]    Script Date: 5/15/2018 12:07:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[UPSShippingLogForShipments](
	[OrderNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActualOrderNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrackingNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Weight] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipperCharge] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalCharge] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipDate] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberOfPackages] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
	[Length] [int] NULL,
	[ServiceType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DeclaredValue] [real] NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [UPSShippingLogForShipments_OrderNumberIndex]    Script Date: 5/15/2018 12:07:02 PM ******/
CREATE NONCLUSTERED INDEX [UPSShippingLogForShipments_OrderNumberIndex] ON [dbo].[UPSShippingLogForShipments]
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Trigger [dbo].[UpdateUPSShipment]    Script Date: 5/15/2018 12:07:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER UpdateUPSShipment ON UPSShippingLogForShipments FOR INSERT, UPDATE
AS

UPDATE Shipments 
SET    ModifiedByUser     = 'UPS Auto Update',
       ModifiedDate       = GETDATE(),
       SeqID              = SeqID + 1,
       ActualCost         = COALESCE(Shipments.ActualCost,0) + CAST(Inserted.ShipperCharge as Float),
       EstimatedCost      = COALESCE(Shipments.EstimatedCost,0) + CAST(Inserted.TotalCharge as Float),
       IsShipped          = 1,
       PackageWeight      = COALESCE(Shipments.PackageWeight,0) + CAST(Inserted.Weight AS FLOAT),
       TrackingNumber     = CASE WHEN COALESCE(Shipments.TrackingNumber, '') = '' THEN ''
                                 ELSE Shipments.TrackingNumber + '; '
                            END + Inserted.TrackingNumber,


       InsuredValue       = Inserted.DeclaredValue,
/*       Notes              = Inserted.DeliveryInstructions   ,   */


       NumberOfPackages   = CAST(Inserted.NumberOfPackages AS FLOAT ),
       ShipDate           = CAST( CAST( SUBSTRING(Inserted.ShipDate, 5, 2) + '/' + 
                                        SUBSTRING(Inserted.ShipDate, 7, 2) + '/' + 
                                        LEFT(Inserted.ShipDate, 4) AS Char(10)) AS DateTime),

       CarrierID          = (SELECT TOP 1 ID FROM ShippingMethod WITH(NOLOCK) WHERE CarrierName LIKE '%UPS%' AND IsActive = 1 ),
       CarrierClassTypeID = 6130,


       CarrierService     = CASE Inserted.ServiceType 
                              WHEN '1' THEN 'FedEx Priority Overnight'
							  WHEN '2' THEN 'FedEx Standard Overnight'
							  WHEN '3' THEN 'FedEx 2Day'
							  WHEN '4' THEN 'FedEx 1Day Freight'
							  WHEN '5' THEN 'FedEx 2Day Freight'
							  WHEN '6' THEN 'FedEx First Overnight'
							  WHEN '7' THEN 'FedEx Express Saver'
							  WHEN '8' THEN 'FedEx 3Day Freight'
							  WHEN 'R' THEN 'FedEx Ground Service'
							  WHEN 'Next Day Air Early AM' THEN 'UPS Next Day Air Early A.M.'
							  WHEN 'Next Day Air' THEN 'UPS Next Day Air'
							  WHEN 'Next Day Air Saver' THEN 'UPS Next Day Air Saver'
							  WHEN '2nd Day Air AM' THEN 'UPS 2nd Day Air A.M.'
							  WHEN '2nd Day Air' THEN 'UPS 2nd Day Air'
							  WHEN '3 Day Select' THEN 'UPS 3 Day Select'
							  WHEN 'Ground' THEN 'UPS Ground'
                              ELSE NULL
                            END,


       PackageSize        = COALESCE( CAST( Height AS VARCHAR(5) ) + ' x ', '' ) +
                            COALESCE( CAST( Width  AS VARCHAR(5) ) + ' x ', '' ) +
                            COALESCE( CAST( Length AS VARCHAR(5) )        , '' )

FROM   Inserted
WHERE  Shipments.ShipmentNumber = LTRIM(Inserted.OrderNumber)

GO
