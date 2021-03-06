/****** Object:  Table [dbo].[GalaxyVendorImport]    Script Date: 5/15/2018 12:06:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GalaxyVendorImport](
	[VendorNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VendorName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressLine1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressLine2] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressCity] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressState] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressPostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressCountry] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactFirstName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactLastName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactPhone] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactPhoneExt] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactMobile] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactFax] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactEmail] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingContactPreferredCommunication] [int] NULL,
	[BillingContactPreferredDocumentDelivery] [int] NULL,
	[NationalAccountsAgreement] [bit] NOT NULL,
	[NationalAccountsElectrical] [bit] NOT NULL,
	[WebNumber] [int] NULL,
	[CenterNumber] [int] NULL,
	[Status] [int] NULL,
	[CreditStatus] [int] NULL,
	[Type] [int] NULL,
	[LastModified] [datetime] NULL
) ON [PRIMARY]

GO
