/****** Object:  Table [dbo].[MigratedJobsPhases]    Script Date: 5/15/2018 11:59:25 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MigratedJobsPhases](
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Job] [int] NULL,
	[Phase] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]

GO
