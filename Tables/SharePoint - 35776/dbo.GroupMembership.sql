/****** Object:  Table [dbo].[GroupMembership]    Script Date: 5/15/2018 12:05:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupMembership](
	[SiteId] [uniqueidentifier] NOT NULL,
	[GroupId] [int] NOT NULL,
	[MemberId] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [GroupMembership_GroupId]    Script Date: 5/15/2018 12:05:35 PM ******/
CREATE UNIQUE CLUSTERED INDEX [GroupMembership_GroupId] ON [dbo].[GroupMembership]
(
	[SiteId] ASC,
	[GroupId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [GroupMembership_MemberId]    Script Date: 5/15/2018 12:05:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [GroupMembership_MemberId] ON [dbo].[GroupMembership]
(
	[SiteId] ASC,
	[MemberId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
