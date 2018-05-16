/****** Object:  Table [dbo].[MSSSessionDefinitionsAlt]    Script Date: 5/15/2018 12:05:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSSessionDefinitionsAlt](
	[DocId] [int] NOT NULL,
	[Term] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Sentence] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[TermOffset] [int] NOT NULL,
	[TermLength] [int] NOT NULL
) ON [PRIMARY]

GO
