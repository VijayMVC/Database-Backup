/****** Object:  Table [dbo].[PollVotingRecord]    Script Date: 5/15/2018 12:03:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PollVotingRecord](
	[Id] [int] NOT NULL,
	[PollAnswerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[PollVotingRecord]  WITH CHECK ADD  CONSTRAINT [PollVotingRecord_PollAnswer1] FOREIGN KEY([PollAnswerId])
REFERENCES [dbo].[PollAnswer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[PollVotingRecord] CHECK CONSTRAINT [PollVotingRecord_PollAnswer1]
ALTER TABLE [dbo].[PollVotingRecord]  WITH CHECK ADD  CONSTRAINT [PollVotingRecord_TypeConstraint_From_CustomerContent_To_PollVotingRecord] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerContent] ([Id])
ALTER TABLE [dbo].[PollVotingRecord] CHECK CONSTRAINT [PollVotingRecord_TypeConstraint_From_CustomerContent_To_PollVotingRecord]
GO
