/****** Object:  Table [dbo].[MSSPropagationPropagationTask]    Script Date: 5/15/2018 12:09:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSPropagationPropagationTask](
	[CatalogID] [int] NOT NULL,
	[TaskType] [int] NOT NULL,
	[ObjectID] [int] NULL,
	[MaxWorkID] [int] NULL,
	[BirthDate] [int] NULL,
	[Time] [datetime] NULL
) ON [PRIMARY]

GO
