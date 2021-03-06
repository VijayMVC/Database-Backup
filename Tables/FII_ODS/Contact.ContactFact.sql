/****** Object:  Table [Contact].[ContactFact]    Script Date: 5/15/2018 11:59:21 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[ContactFact](
	[ContactKey] [int] IDENTITY(1,1) NOT NULL,
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
	[KeystoneCustomerKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CorebridgeContactKey] [int] NULL,
	[CorebridgeCustomerKey] [int] NULL,
	[DoNotEmail] [bit] NULL,
 CONSTRAINT [PK_ContactFact] PRIMARY KEY CLUSTERED 
(
	[ContactKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [ContactFact_ZW_Franchise_ID_FirstName_LastName]    Script Date: 5/15/2018 11:59:21 AM ******/
CREATE NONCLUSTERED INDEX [ContactFact_ZW_Franchise_ID_FirstName_LastName] ON [Contact].[ContactFact]
(
	[ZW_Franchise_ID] ASC,
	[FirstName] ASC,
	[LastName] ASC
)
INCLUDE ( 	[ContactKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Hint_CenterKey_inc_ContactKey]    Script Date: 5/15/2018 11:59:21 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CenterKey_inc_ContactKey] ON [Contact].[ContactFact]
(
	[CenterKey] ASC
)
INCLUDE ( 	[ContactKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_Contactfact_Keystone]    Script Date: 5/15/2018 11:59:21 AM ******/
CREATE NONCLUSTERED INDEX [Hint_Contactfact_Keystone] ON [Contact].[ContactFact]
(
	[KeystoneContactKey] ASC,
	[KeystoneCustomerKey] ASC
)
INCLUDE ( 	[ContactKey],
	[UpdateCheckSum]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_ContactFact_ZW_Franchise_ID_inc_ContactKey_ContactID_CustomerKey_KeystoneContactKey]    Script Date: 5/15/2018 11:59:21 AM ******/
CREATE NONCLUSTERED INDEX [Hint_ContactFact_ZW_Franchise_ID_inc_ContactKey_ContactID_CustomerKey_KeystoneContactKey] ON [Contact].[ContactFact]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[ContactKey],
	[ContactID],
	[CustomerKey],
	[KeystoneContactKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_ContactFact_Emailaddress_Includes]    Script Date: 5/15/2018 11:59:21 AM ******/
CREATE NONCLUSTERED INDEX [idx_ContactFact_Emailaddress_Includes] ON [Contact].[ContactFact]
(
	[EmailAddress] ASC
)
INCLUDE ( 	[ContactKey],
	[CustomerKey],
	[FirstName],
	[LastName],
	[Title],
	[PhoneNumber],
	[PhoneExtention],
	[FaxNumber],
	[PareaCode],
	[FareaCode],
	[BirthMonth],
	[BirthDay]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Contact].[ContactFact] ADD  CONSTRAINT [DF_ContactFact_CustomerKey]  DEFAULT ((-255)) FOR [CustomerKey]
ALTER TABLE [Contact].[ContactFact] ADD  CONSTRAINT [DF_ContactFact_CenterKey]  DEFAULT ((-255)) FOR [CenterKey]
GO
