/****** Object:  Table [dbo].[DailyAmounts]    Script Date: 5/15/2018 11:59:02 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DailyAmounts](
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReportType] [int] NOT NULL,
	[ReportItem] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrentAmount] [decimal](18, 6) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[UpdatedBy] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Currency] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DailyAmounts] PRIMARY KEY CLUSTERED 
(
	[CompanyLocationId] ASC,
	[ReportType] ASC,
	[LastUpdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
