/****** Object:  Table [dbo].[NameValuePair_Japanese_Unicode_CI_AS]    Script Date: 5/15/2018 12:05:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[NameValuePair_Japanese_Unicode_CI_AS](
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[ListId] [uniqueidentifier] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Level] [tinyint] NOT NULL,
	[FieldId] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](255) COLLATE Japanese_Unicode_CI_AS NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [NameValuePair_Japanese_Unicode_CI_AS_CI]    Script Date: 5/15/2018 12:05:56 PM ******/
CREATE CLUSTERED INDEX [NameValuePair_Japanese_Unicode_CI_AS_CI] ON [dbo].[NameValuePair_Japanese_Unicode_CI_AS]
(
	[SiteId] ASC,
	[ListId] ASC,
	[FieldId] ASC,
	[Value] ASC,
	[ItemId] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [NameValuePair_Japanese_Unicode_CI_AS_MatchUserData]    Script Date: 5/15/2018 12:05:56 PM ******/
CREATE NONCLUSTERED INDEX [NameValuePair_Japanese_Unicode_CI_AS_MatchUserData] ON [dbo].[NameValuePair_Japanese_Unicode_CI_AS]
(
	[SiteId] ASC,
	[ListId] ASC,
	[ItemId] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [NameValuePair_Japanese_Unicode_CI_AS_NoListId]    Script Date: 5/15/2018 12:05:56 PM ******/
CREATE NONCLUSTERED INDEX [NameValuePair_Japanese_Unicode_CI_AS_NoListId] ON [dbo].[NameValuePair_Japanese_Unicode_CI_AS]
(
	[SiteId] ASC,
	[FieldId] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[NameValuePair_Japanese_Unicode_CI_AS] ADD  DEFAULT ((1)) FOR [Level]
GO
