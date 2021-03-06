/****** Object:  Table [Contact].[ContactFact]    Script Date: 5/15/2018 12:02:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[ContactFact](
	[ContactKey] [int] NOT NULL,
	[ContactID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerID] [int] NULL,
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
	[KeystoneContactKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KeystoneCustomerKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ContactFact] PRIMARY KEY CLUSTERED 
(
	[ContactKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
