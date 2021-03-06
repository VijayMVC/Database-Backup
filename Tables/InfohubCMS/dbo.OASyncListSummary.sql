/****** Object:  Table [dbo].[OASyncListSummary]    Script Date: 5/15/2018 12:01:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OASyncListSummary](
	[Id] [int] NOT NULL,
	[ListName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImportStatus] [int] NOT NULL,
	[ImportStart] [datetimeoffset](7) NOT NULL,
	[ImportEnd] [datetimeoffset](7) NULL,
	[SourceDeletes] [int] NOT NULL,
	[SourceInserts] [int] NOT NULL,
	[SourceReads] [int] NOT NULL,
	[SourceUpdates] [int] NOT NULL,
	[DestinationDeletes] [int] NOT NULL,
	[DestinationInserts] [int] NOT NULL,
	[DestinationReads] [int] NOT NULL,
	[DestinationUpdates] [int] NOT NULL,
	[BaseDeletes] [int] NOT NULL,
	[BaseInserts] [int] NOT NULL,
	[BaseReads] [int] NOT NULL,
	[BaseUpdates] [int] NOT NULL,
	[ImportSummary] [int] NOT NULL,
 CONSTRAINT [pk_OASyncListSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_OASyncLstSmmry_ImprtSmmary]    Script Date: 5/15/2018 12:01:22 PM ******/
CREATE NONCLUSTERED INDEX [idx_OASyncLstSmmry_ImprtSmmary] ON [dbo].[OASyncListSummary]
(
	[ImportSummary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
