/****** Object:  Table [System].[ETLHistory]    Script Date: 5/15/2018 11:59:47 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [System].[ETLHistory](
	[ETLHistoryKey] [int] IDENTITY(1,1) NOT NULL,
	[System] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastCompletionDate] [datetime] NULL,
	[Success] [bit] NULL,
	[PackageID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ETLHistory] PRIMARY KEY CLUSTERED 
(
	[ETLHistoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
