/****** Object:  Table [dbo].[MSSPropagationSearchServerReady]    Script Date: 5/15/2018 12:05:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSPropagationSearchServerReady](
	[CatalogID] [int] NOT NULL,
	[TaskType] [int] NOT NULL,
	[ObjectID] [int] NULL,
	[SearchServerID] [int] NOT NULL
) ON [PRIMARY]

GO
