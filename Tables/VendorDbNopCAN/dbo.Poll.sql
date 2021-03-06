/****** Object:  Table [dbo].[Poll]    Script Date: 5/15/2018 12:08:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SystemKeyword] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Published] [bit] NOT NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[AllowGuestsToVote] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[StartDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [Poll_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [Poll_Language]
GO
