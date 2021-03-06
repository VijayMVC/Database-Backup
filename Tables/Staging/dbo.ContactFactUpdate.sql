/****** Object:  Table [dbo].[ContactFactUpdate]    Script Date: 5/15/2018 12:06:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ContactFactUpdate](
	[ContactKey] [int] NOT NULL,
	[ContactID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerID] [int] NULL,
	[CustomerKey] [int] NULL,
	[FirstName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2areaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneType] [int] NULL,
	[P3areaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneType] [int] NULL,
	[PrimaryContact] [bit] NULL,
	[APContact] [bit] NULL,
	[AlternateAddressKey] [int] NULL,
	[SortOrder] [int] NULL,
	[InvoicingContact] [bit] NULL,
	[BirthMonth] [smallint] NULL,
	[BirthDay] [int] NULL,
	[IsActive] [bit] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL,
	[KeystoneContactKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KeyStoneCustomerKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
