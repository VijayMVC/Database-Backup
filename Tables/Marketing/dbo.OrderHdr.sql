/****** Object:  Table [dbo].[OrderHdr]    Script Date: 5/15/2018 12:02:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderHdr](
	[OrdHId] [int] NOT NULL,
	[OrdHType] [tinyint] NOT NULL,
	[OrdHOrigOrderId] [int] NULL,
	[OrdHVendorId] [int] NOT NULL,
	[OrdHPrdType] [tinyint] NOT NULL,
	[OrdHStoreNum] [int] NULL,
	[OrdHStoreId] [int] NOT NULL,
	[OrdHDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHDate] [smalldatetime] NULL,
	[OrdHSignUpDeadline] [smalldatetime] NULL,
	[OrdHAmount] [float] NULL,
	[OrdHHandlingFee] [float] NULL,
	[OrdHMailOnDemandFee] [float] NULL,
	[OrdHMailOnDemandQty] [int] NULL,
	[OrdHMailOnDemandAmount] [float] NULL,
	[OrdHStatus] [tinyint] NULL,
	[OrdHSubStatus] [tinyint] NULL,
	[OrdHFulfillmentDate] [smalldatetime] NULL,
	[OrdHCCValidationDate] [smalldatetime] NULL,
	[OrdHShipAddr1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipAddr2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipCity] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipState] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipPostalCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipCountry] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipSpecialInst] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHShipMethod] [tinyint] NULL,
	[OrdHShipEstCost] [float] NULL,
	[OrdhTrackingNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHOrdered] [smalldatetime] NULL,
	[OrdHStateChanged] [smalldatetime] NULL,
	[OrdHFulfillmentEmailSent] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdHMailingType] [tinyint] NULL,
	[OrdHImprintAmount] [float] NULL,
	[OrdHFoldingAmount] [float] NULL,
	[OrdHUserId] [int] NULL,
	[OrdHFCGList] [bit] NULL,
 CONSTRAINT [PK_OrderHdr] PRIMARY KEY CLUSTERED 
(
	[OrdHId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_OrderHdr]    Script Date: 5/15/2018 12:02:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderHdr] ON [dbo].[OrderHdr]
(
	[OrdHVendorId] ASC,
	[OrdHStoreId] ASC,
	[OrdHId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_OrderHdr_1]    Script Date: 5/15/2018 12:02:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderHdr_1] ON [dbo].[OrderHdr]
(
	[OrdHStoreId] ASC,
	[OrdHFulfillmentDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
