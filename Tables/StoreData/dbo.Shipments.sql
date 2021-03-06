/****** Object:  Table [dbo].[Shipments]    Script Date: 5/15/2018 12:06:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Shipments](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AccountID] [int] NULL,
	[ActualCost] [float] NULL,
	[ShipToAddressLinkID] [int] NULL,
	[CarrierID] [int] NULL,
	[CarrierClassTypeID] [int] NULL,
	[CarrierService] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactID] [int] NULL,
	[EmailAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstimatedCost] [float] NULL,
	[IsShipped] [bit] NULL,
	[NumberOfPackages] [int] NULL,
	[PackageSize] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageWeight] [float] NULL,
	[PhoneNumberID] [int] NULL,
	[ShipDate] [datetime] NULL,
	[ShipLineItemsXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipmentNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrackingNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransHeaderID] [int] NULL,
	[TransHeaderClassTypeID] [int] NULL,
	[InsuredValue] [float] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipToDivisionID] [int] NULL,
	[ShipToDivisionClassTypeID] [int] NULL,
	[ShippedDueDate] [datetime] NULL,
	[ShippedDueDateOV] [bit] NULL,
	[AccountName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumberText] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipToAddressID] [int] NULL,
 CONSTRAINT [Shipments_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
