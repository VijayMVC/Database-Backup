/****** Object:  Table [dbo].[DTA_reports_table]    Script Date: 5/15/2018 12:02:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DTA_reports_table](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[SchemaName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TableName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsView] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [DTA_reports_table_index]    Script Date: 5/15/2018 12:02:56 PM ******/
CREATE NONCLUSTERED INDEX [DTA_reports_table_index] ON [dbo].[DTA_reports_table]
(
	[DatabaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
ALTER TABLE [dbo].[DTA_reports_table] ADD  DEFAULT ((0)) FOR [IsView]
ALTER TABLE [dbo].[DTA_reports_table]  WITH NOCHECK ADD FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[DTA_reports_database] ([DatabaseID])
ON DELETE CASCADE
GO
