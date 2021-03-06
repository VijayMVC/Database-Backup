/****** Object:  Table [dbo].[FIIUserQuestionResponse]    Script Date: 5/15/2018 12:00:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FIIUserQuestionResponse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Response] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_FIIUserQuestionResponse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_FIIUserQuestionResponse]    Script Date: 5/15/2018 12:00:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_FIIUserQuestionResponse] ON [dbo].[FIIUserQuestionResponse]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FIIUserQuestionResponse_1]    Script Date: 5/15/2018 12:00:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_FIIUserQuestionResponse_1] ON [dbo].[FIIUserQuestionResponse]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[FIIUserQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_FIIUserQuestionResponse_FIIQuestion] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[FIIQuestion] ([ID])
ALTER TABLE [dbo].[FIIUserQuestionResponse] CHECK CONSTRAINT [FK_FIIUserQuestionResponse_FIIQuestion]
ALTER TABLE [dbo].[FIIUserQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_FIIUserQuestionResponse_FIIUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FIIUser] ([UserID])
ALTER TABLE [dbo].[FIIUserQuestionResponse] CHECK CONSTRAINT [FK_FIIUserQuestionResponse_FIIUser]
GO
