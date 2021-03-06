/****** Object:  Table [dbo].[MSSLocationVisualisations]    Script Date: 5/15/2018 12:05:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSLocationVisualisations](
	[LocationId] [int] NOT NULL,
	[VisualisationName] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Xsl] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Properties] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[SampleData] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [PK_MSSLocationVisualisations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC,
	[VisualisationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[MSSLocationVisualisations]  WITH CHECK ADD  CONSTRAINT [FK_MSSLocationVisualisations_MSSLocations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[MSSLocations] ([Id])
ALTER TABLE [dbo].[MSSLocationVisualisations] CHECK CONSTRAINT [FK_MSSLocationVisualisations_MSSLocations]
GO
