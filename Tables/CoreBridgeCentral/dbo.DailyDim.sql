/****** Object:  Table [dbo].[DailyDim]    Script Date: 5/15/2018 11:59:03 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DailyDim](
	[ReportType] [int] NOT NULL,
	[ReportItem] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
