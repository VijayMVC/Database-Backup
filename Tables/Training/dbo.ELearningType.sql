/****** Object:  Table [dbo].[ELearningType]    Script Date: 5/15/2018 12:07:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ELearningType](
	[ELearningTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ELearningCategoryID] [int] NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_ELearningType] PRIMARY KEY CLUSTERED 
(
	[ELearningTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[ELearningType] ADD  CONSTRAINT [DF_ELearningType_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
ALTER TABLE [dbo].[ELearningType]  WITH NOCHECK ADD  CONSTRAINT [FK_ELearningType_ELearningCategory] FOREIGN KEY([ELearningCategoryID])
REFERENCES [dbo].[ELearningCategory] ([ELearningCategoryID])
ALTER TABLE [dbo].[ELearningType] CHECK CONSTRAINT [FK_ELearningType_ELearningCategory]
GO
