/****** Object:  Table [dbo].[NewsComment]    Script Date: 5/15/2018 12:03:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[NewsComment](
	[Id] [int] NOT NULL,
	[CommentTitle] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommentText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewsItemId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_NewsComment_NewsItemId]    Script Date: 5/15/2018 12:03:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsComment_NewsItemId] ON [dbo].[NewsComment]
(
	[NewsItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [NewsComment_NewsItem1] FOREIGN KEY([NewsItemId])
REFERENCES [dbo].[News] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [NewsComment_NewsItem1]
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [NewsComment_TypeConstraint_From_CustomerContent_To_NewsComment] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerContent] ([Id])
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [NewsComment_TypeConstraint_From_CustomerContent_To_NewsComment]
GO
