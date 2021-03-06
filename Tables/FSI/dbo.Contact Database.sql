/****** Object:  Table [dbo].[Contact Database]    Script Date: 5/15/2018 12:00:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Contact Database](
	[ContactID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
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
	[P2AreaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneType] [int] NULL,
	[P3AreaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P3PhoneType] [int] NULL,
	[PrimaryContact] [bit] NULL,
	[ShippingContact] [bit] NULL,
	[APContact] [bit] NULL,
	[InvoicingContact] [bit] NULL,
	[AlternateAddress] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortOrder] [int] NULL,
	[BirthMonth] [int] NULL,
	[BirthDay] [int] NULL,
	[IsActive] [bit] NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Contact Database] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC,
	[StoreID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_FranchiseID]    Script Date: 5/15/2018 12:00:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_FranchiseID] ON [dbo].[Contact Database]
(
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [NCIX_ContactDatabase_Multiple1]    Script Date: 5/15/2018 12:00:48 PM ******/
CREATE NONCLUSTERED INDEX [NCIX_ContactDatabase_Multiple1] ON [dbo].[Contact Database]
(
	[zw_franchise_id] ASC,
	[ContactID] ASC,
	[sys_di] ASC,
	[sys_du] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Contact Database] ADD  CONSTRAINT [DF_Contact Database_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
