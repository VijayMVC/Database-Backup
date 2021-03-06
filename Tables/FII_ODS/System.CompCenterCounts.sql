/****** Object:  Table [System].[CompCenterCounts]    Script Date: 5/15/2018 11:59:46 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [System].[CompCenterCounts](
	[Country] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[CompCenters] [int] NOT NULL,
 CONSTRAINT [PK_CompCenterCounts] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
