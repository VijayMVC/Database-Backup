/****** Object:  Table [dbo].[DynamicDescription]    Script Date: 5/15/2018 12:02:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DynamicDescription](
	[DynDescId] [int] NOT NULL,
	[DynDescFilename] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DynDescCategory] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DynDescDescription] [varchar](1600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DynamicDescription] PRIMARY KEY CLUSTERED 
(
	[DynDescId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
