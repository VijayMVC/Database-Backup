/****** Object:  Table [dbo].[Vendor]    Script Date: 5/15/2018 12:02:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Vendor](
	[VndId] [int] NOT NULL,
	[VndDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndSignUpDeadline] [smallint] NULL,
	[VndUploadDBDeadline] [smallint] NULL,
	[VndPickAndPackShipDays] [smallint] NULL,
	[VndPickAndPackQtyNotAvail] [smallint] NULL,
	[VndPickAndPackQtyNotOrd] [smallint] NULL,
	[VndImprintShipDays] [smallint] NULL,
	[VndInventoryProcessing] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndInventoryRequestStartTime] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndCreditCardProcessing] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndCreditCardStartTime] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndOrderProcessing] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndOrderStartTime] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndDatabaseRequiredOveragePrc] [float] NULL,
	[VndPDFFilePath] [varchar](225) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndDBUploadPath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndMinImprintCount] [int] NULL,
	[MarketingCountry] [int] NULL,
	[VndEmail] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VndPlacedToAcceptedDeadline] [smallint] NULL,
	[VndListLeadDays] [smallint] NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VndId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_Vendor]    Script Date: 5/15/2018 12:02:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Vendor] ON [dbo].[Vendor]
(
	[VndDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
