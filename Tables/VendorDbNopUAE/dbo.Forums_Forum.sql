/****** Object:  Table [dbo].[Forums_Forum]    Script Date: 5/15/2018 12:08:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Forums_Forum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ForumGroupId] [int] NOT NULL,
	[Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumTopics] [int] NOT NULL,
	[NumPosts] [int] NOT NULL,
	[LastTopicId] [int] NOT NULL,
	[LastPostId] [int] NOT NULL,
	[LastPostCustomerId] [int] NOT NULL,
	[LastPostTime] [datetime] NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_Forums_Forum_DisplayOrder]    Script Date: 5/15/2018 12:08:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Forums_Forum_DisplayOrder] ON [dbo].[Forums_Forum]
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_Forums_Forum_ForumGroupId]    Script Date: 5/15/2018 12:08:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Forums_Forum_ForumGroupId] ON [dbo].[Forums_Forum]
(
	[ForumGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[Forums_Forum]  WITH CHECK ADD  CONSTRAINT [Forum_ForumGroup] FOREIGN KEY([ForumGroupId])
REFERENCES [dbo].[Forums_Group] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Forums_Forum] CHECK CONSTRAINT [Forum_ForumGroup]
GO
