/****** Object:  Table [dbo].[DMCustomers]    Script Date: 5/15/2018 12:02:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DMCustomers](
	[WebNo] [int] NOT NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderDate] [datetime] NULL,
	[SalesAmt] [money] NULL,
	[Phone] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerID] [int] NULL,
	[PhoneExtension] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Industry] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

/****** Object:  Index [IX_DMCustomers]    Script Date: 5/15/2018 12:02:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMCustomers] ON [dbo].[DMCustomers]
(
	[WebNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMCustomers_1]    Script Date: 5/15/2018 12:02:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMCustomers_1] ON [dbo].[DMCustomers]
(
	[FirstName] ASC,
	[LastName] ASC,
	[Country] ASC,
	[Address1] ASC,
	[Address2] ASC,
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_DMCustomers_2]    Script Date: 5/15/2018 12:02:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMCustomers_2] ON [dbo].[DMCustomers]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMCustomers_3]    Script Date: 5/15/2018 12:02:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMCustomers_3] ON [dbo].[DMCustomers]
(
	[Address1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[DMCustomers] ADD  CONSTRAINT [DF_DMCustomers_WebNo]  DEFAULT ((0)) FOR [WebNo]
GO
