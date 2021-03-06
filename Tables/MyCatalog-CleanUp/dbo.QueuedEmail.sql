/****** Object:  Table [dbo].[QueuedEmail]    Script Date: 5/15/2018 12:03:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[QueuedEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [int] NOT NULL,
	[From] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FromName] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[To] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ToName] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CC] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bcc] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[SentTries] [int] NOT NULL,
	[SentOnUtc] [datetime] NULL,
	[EmailAccountId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_QueuedEmail_50_50099219__K13_K12_K1_K2_K11_3_4_5_6_7_8_9_10_14]    Script Date: 5/15/2018 12:03:51 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_QueuedEmail_50_50099219__K13_K12_K1_K2_K11_3_4_5_6_7_8_9_10_14] ON [dbo].[QueuedEmail]
(
	[SentOnUtc] ASC,
	[SentTries] ASC,
	[Id] ASC,
	[Priority] ASC,
	[CreatedOnUtc] ASC
)
INCLUDE ( 	[From],
	[FromName],
	[To],
	[ToName],
	[CC],
	[Bcc],
	[Subject],
	[Body],
	[EmailAccountId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_QueuedEmail_SentOnUtc_SentTries]    Script Date: 5/15/2018 12:03:51 PM ******/
CREATE NONCLUSTERED INDEX [idx_QueuedEmail_SentOnUtc_SentTries] ON [dbo].[QueuedEmail]
(
	[SentOnUtc] ASC,
	[SentTries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
ALTER TABLE [dbo].[QueuedEmail]  WITH CHECK ADD  CONSTRAINT [QueuedEmail_EmailAccount] FOREIGN KEY([EmailAccountId])
REFERENCES [dbo].[EmailAccount] ([Id])
ALTER TABLE [dbo].[QueuedEmail] CHECK CONSTRAINT [QueuedEmail_EmailAccount]
GO
