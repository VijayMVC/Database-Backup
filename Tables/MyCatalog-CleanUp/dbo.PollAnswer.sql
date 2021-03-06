/****** Object:  Table [dbo].[PollAnswer]    Script Date: 5/15/2018 12:03:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PollAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollId] [int] NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NumberOfVotes] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_PollAnswer_PollId]    Script Date: 5/15/2018 12:03:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_PollAnswer_PollId] ON [dbo].[PollAnswer]
(
	[PollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[PollAnswer]  WITH CHECK ADD  CONSTRAINT [PollAnswer_Poll] FOREIGN KEY([PollId])
REFERENCES [dbo].[Poll] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[PollAnswer] CHECK CONSTRAINT [PollAnswer_Poll]
GO
