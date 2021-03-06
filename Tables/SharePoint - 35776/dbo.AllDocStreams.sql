/****** Object:  Table [dbo].[AllDocStreams]    Script Date: 5/15/2018 12:05:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AllDocStreams](
	[Id] [uniqueidentifier] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[DeleteTransactionId] [varbinary](16) NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[Size] [int] NULL,
	[Level] [tinyint] NOT NULL,
	[Content] [image] NULL,
 CONSTRAINT [AllDocStreams_CK] UNIQUE CLUSTERED 
(
	[SiteId] ASC,
	[ParentId] ASC,
	[Id] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AllDocStreams_DeleteTransactionIdIdLevelUnique] UNIQUE NONCLUSTERED 
(
	[DeleteTransactionId] ASC,
	[Id] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AllDocStreams_IdLevelUnique] UNIQUE NONCLUSTERED 
(
	[Id] ASC,
	[Level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [AllDocStreams_SiteIdId]    Script Date: 5/15/2018 12:05:32 PM ******/
CREATE NONCLUSTERED INDEX [AllDocStreams_SiteIdId] ON [dbo].[AllDocStreams]
(
	[SiteId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[AllDocStreams] ADD  DEFAULT (0x) FOR [DeleteTransactionId]
ALTER TABLE [dbo].[AllDocStreams] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ParentId]
ALTER TABLE [dbo].[AllDocStreams] ADD  DEFAULT ((1)) FOR [Level]
GO
