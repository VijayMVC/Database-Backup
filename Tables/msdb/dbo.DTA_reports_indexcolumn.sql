/****** Object:  Table [dbo].[DTA_reports_indexcolumn]    Script Date: 5/15/2018 12:02:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DTA_reports_indexcolumn](
	[IndexID] [int] NOT NULL,
	[ColumnID] [int] NOT NULL,
	[ColumnOrder] [int] NULL,
	[PartitionColumnOrder] [int] NOT NULL,
	[IsKeyColumn] [bit] NOT NULL,
	[IsDescendingColumn] [bit] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [DTA_reports_indexcolumn_index]    Script Date: 5/15/2018 12:02:55 PM ******/
CREATE CLUSTERED INDEX [DTA_reports_indexcolumn_index] ON [dbo].[DTA_reports_indexcolumn]
(
	[IndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
/****** Object:  Index [DTA_reports_indexcolumn_index2]    Script Date: 5/15/2018 12:02:55 PM ******/
CREATE NONCLUSTERED INDEX [DTA_reports_indexcolumn_index2] ON [dbo].[DTA_reports_indexcolumn]
(
	[ColumnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
ALTER TABLE [dbo].[DTA_reports_indexcolumn] ADD  DEFAULT ((0)) FOR [PartitionColumnOrder]
ALTER TABLE [dbo].[DTA_reports_indexcolumn] ADD  DEFAULT ((1)) FOR [IsKeyColumn]
ALTER TABLE [dbo].[DTA_reports_indexcolumn] ADD  DEFAULT ((1)) FOR [IsDescendingColumn]
ALTER TABLE [dbo].[DTA_reports_indexcolumn]  WITH NOCHECK ADD FOREIGN KEY([IndexID])
REFERENCES [dbo].[DTA_reports_index] ([IndexID])
ON DELETE CASCADE
GO
