/****** Object:  Table [dbo].[tmp_Vendors]    Script Date: 5/15/2018 12:06:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tmp_Vendors](
	[VendorId] [int] NULL,
	[PrimaryContactId] [int] NULL,
	[BillingContactId] [int] NULL,
	[ExternalKey] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[CenterNumber] [int] NULL,
	[WebNumber] [int] NULL,
	[CreditStatus] [int] NULL,
	[NationalAccountsAgreement] [bit] NULL,
	[NationalAccountsElectrical] [bit] NULL,
	[Phone] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedByImportDate] [datetime] NULL,
	[CreatedById] [int] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO
