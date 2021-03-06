/****** Object:  Table [dbo].[DMMailings]    Script Date: 5/15/2018 12:02:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DMMailings](
	[WebID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailingDate] [smalldatetime] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_DMMailings]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings] ON [dbo].[DMMailings]
(
	[WebID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMMailings_1]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings_1] ON [dbo].[DMMailings]
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMMailings_2]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings_2] ON [dbo].[DMMailings]
(
	[Address1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMMailings_3]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings_3] ON [dbo].[DMMailings]
(
	[City] ASC,
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_DMMailings_4]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings_4] ON [dbo].[DMMailings]
(
	[MailingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_DMMailings_5]    Script Date: 5/15/2018 12:02:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_DMMailings_5] ON [dbo].[DMMailings]
(
	[Address2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[DMMailings] ADD  CONSTRAINT [DF_DMMailings_MailingDate]  DEFAULT (getdate()) FOR [MailingDate]
GO
